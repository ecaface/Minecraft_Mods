# 구현 계획서 - battle_royale_datapack2 좌표 동적화 및 견고성 개선

데이터팩이 특정 좌표 값과 월드 시드(Seed)에 구애받지 않도록 100% 동적 상대 좌표 시스템으로 리팩토링합니다. 호스트 플레이어의 최초 스폰 좌표를 자동으로 읽어 하늘에 로비를 만들고 전투 구역을 상대 좌표(+1000, +1000)로 배치하여, 어떠한 지형에서도 안전하게 작동하도록 보장합니다.

---

## 제안된 변경 사항

### 1. 동적 초기화 및 플레이어 로직

#### [NEW] [init_dynamic_coords.mcfunction](file:///d:/Projects/github/Minecraft_Mods/battle_royale_datapack2/data/mcbr/functions/admin/init_dynamic_coords.mcfunction)
* 새 월드에 처음 진입한 플레이어 기준의 스폰 위치 X, Z 좌표를 자동으로 감지합니다.
* 로비 좌표를 `(spawn_x, 120, spawn_z)` (하늘 위 공중)으로 설정합니다.
* 전투 구역 중심점을 `(spawn_x + 1000, spawn_z + 1000)`으로 자동 설정합니다.
* 로비 플랫폼 빌드(`build_lobby_platform`)를 자동 호출하고, 5초 후 후보지 스캔(`generate_chest_candidates`)을 자동으로 예약합니다.

#### [NEW] [init_player.mcfunction](file:///d:/Projects/github/Minecraft_Mods/battle_royale_datapack2/data/mcbr/functions/player/init_player.mcfunction)
* 첫 접속 플레이어 인식을 위한 동적 좌표 감지 트리거를 호출하고 초기 설정을 진행합니다.
* 플레이어 상태에 따라 대기실 로비 분기 혹은 진행 중인 게임 관전자 참여 로직을 처리합니다.

#### [MODIFY] [tick.mcfunction](file:///d:/Projects/github/Minecraft_Mods/battle_royale_datapack2/data/mcbr/functions/tick.mcfunction)
* 신규 플레이어 진입 체크 로직을 `mcbr:player/init_player`로 위임합니다.

#### [MODIFY] [load_config_defaults.mcfunction](file:///d:/Projects/github/Minecraft_Mods/battle_royale_datapack2/data/mcbr/functions/load_config_defaults.mcfunction)
* 하드코딩된 로비 및 전투 중심 절대 좌표 설정을 제거하고 동적 초기화 로직으로 책임을 이관합니다.

#### [MODIFY] [send_self_to_lobby.mcfunction](file:///d:/Projects/github/Minecraft_Mods/battle_royale_datapack2/data/mcbr/functions/player/send_self_to_lobby.mcfunction)
* 절대 좌표 `tp @s 0 100 0` 명령어를 동적 로비 생성 마커 타겟인 `tp @s @e[type=minecraft:marker,tag=mcbr_lobby_spawn,limit=1]`로 대체합니다.

---

### 2. 동적 로비 빌드 및 후보지 격자 스캔

#### [MODIFY] [build_lobby_platform.mcfunction](file:///d:/Projects/github/Minecraft_Mods/battle_royale_datapack2/data/mcbr/functions/map/build_lobby_platform.mcfunction)
* 동적 설정 좌표에 소환된 빌더 마커(`mcbr_lobby_builder`) 기준으로 대기 플랫폼을 빌드합니다.
* 플랫폼 중앙에 영구적인 대기실 스폰 마커(`mcbr_lobby_spawn`)를 배치합니다.

#### [MODIFY] [spawn_candidate_grid_candidates.mcfunction](file:///d:/Projects/github/Minecraft_Mods/battle_royale_datapack2/data/mcbr/functions/map/spawn_candidate_grid_candidates.mcfunction)
* 121개의 후보지 감지 프로브 소환 좌표를 절대 좌표가 아닌 아레나 중심 마커(`mcbr_center_marker`) 기준의 상대 좌표(`~ ~ ~`) 형태로 소환하도록 파이썬 생성기를 통해 재구축했습니다.

#### [MODIFY] [generate_chest_candidates.mcfunction](file:///d:/Projects/github/Minecraft_Mods/battle_royale_datapack2/data/mcbr/functions/map/generate_chest_candidates.mcfunction)
* dynamic_center_marker를 활용하여 스캔 영역(`~-120 ~-120`에서 `~120 ~120`)을 동적으로 강제 로드(`forceload`)합니다.

---

### 3. 동적 아레나 백업 & 복구 (확장된 11x11 그리드)

#### [MODIFY] [backup_arena.mcfunction](file:///d:/Projects/github/Minecraft_Mods/battle_royale_datapack2/data/mcbr/functions/map/backup_arena.mcfunction) & [restore_arena.mcfunction](file:///d:/Projects/github/Minecraft_Mods/battle_royale_datapack2/data/mcbr/functions/map/restore_arena.mcfunction)
* 아레나 백업 및 복구를 절대 좌표가 아닌 동적 복구 헬퍼 마커(`mcbr_restore_helper`) 기준의 상대 복사(`clone`) 명령으로 100% 상대화했습니다.
* 스캔 후보지 영역(반경 80블록)을 완벽히 포함하도록 16x16 크기 영역 121개 복제 세트(11x11 그리드 범위인 `-88..87`)로 확장 구성했습니다.

---

### 4. 청크 로드 및 스캔 안정화 개선

#### [NEW] [forceload_arena.mcfunction](file:///d:/Projects/github/Minecraft_Mods/battle_royale_datapack2/data/mcbr/functions/map/forceload_arena.mcfunction) & [forceload_arena_remove.mcfunction](file:///d:/Projects/github/Minecraft_Mods/battle_royale_datapack2/data/mcbr/functions/map/forceload_arena_remove.mcfunction)
* 고정 좌표(`880 880 1120 1120`, `858 858 1142 1142`)로 실행되던 모든 청크 강제 로드 로직을 아레나 중심점 마커 기반 상대 청크 로더로 단일화했습니다.

#### [MODIFY] [cleanup_spawn_cache_from_scores.mcfunction](file:///d:/Projects/github/Minecraft_Mods/battle_royale_datapack2/data/mcbr/functions/loot/cleanup_spawn_cache_from_scores.mcfunction)
* 고정 좌표 범위 조건 검사(`800..1200`)를 제거하고, 높이 범위 조건(`50..150`) 체크로 대체하여 모든 좌표의 월드에서 스폰 캐시가 문제없이 지워지도록 했습니다.

#### [MODIFY] [start_game_ready.mcfunction](file:///d:/Projects/github/Minecraft_Mods/battle_royale_datapack2/data/mcbr/functions/admin/start_game_ready.mcfunction)
* 플레이어가 조인 시점에 지연 등으로 상자 후보지가 생성되지 않았을 경우, 게임 시작 카운트다운(3초) 대기 중에 자동으로 분석 스캔을 트리거하여 상자가 정상적으로 스폰되도록 예외 처리를 마련했습니다.

---

## 검증 계획

### 수동 검증
1. 새로운 시드의 마인크래프트 월드를 생성하고 Refactored 데이터팩을 추가합니다.
2. 스폰 지점 상공 공중에 스펙타클하게 spruce planks 대기 로비가 빌드되고 플레이어가 그 위에 안전하게 스폰되는지 확인합니다.
3. 로비에 있는 게임 시작 레버를 클릭하여 게임을 시작하면 플레이어가 정확히 +1000, +1000 상대 오프셋 위치의 지상 전투 구역으로 뿌려지는지 확인합니다.
4. 경기 시작 전/중에 상자들이 맵 도처에 랜덤으로 나타나는지, 그리고 경기 종료 후 모든 지형 파괴(예: 크리퍼 폭발 등)가 백업 저장소로부터 정확히 동적으로 복구되는지 확인합니다.
