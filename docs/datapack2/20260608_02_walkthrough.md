# 작업 완료 보고서 - battle_royale_datapack2 좌표 동적화 완료

특정 좌표 값과 월드 시드(Seed)에 구애받지 않도록 `battle_royale_datapack2` 데이터팩을 100% 동적 상대 좌표 시스템으로 완전히 리팩토링했습니다. 이제 어떠한 새로운 맵이나 멀티플레이 환경에서도 로비 플랫폼이 공중에 안전하게 생성되며, 실제 플레이 범위와 복원 시스템이 완벽하게 상대 오프셋으로 설정되어 실행됩니다.

---

## 🛠️ 구현 및 수정 완료된 세부 사항

### 1. 동적 로비 생성 & 플레이어 초기화 시스템
* **[init_player.mcfunction](file:///d:/Projects/github/Minecraft_Mods/battle_royale_datapack2/data/mcbr/functions/player/init_player.mcfunction) [신규]**: 최초 플레이어 접속 감지 시 동적 좌표 할당 프로세스를 한 번만 실행합니다.
* **[init_dynamic_coords.mcfunction](file:///d:/Projects/github/Minecraft_Mods/battle_royale_datapack2/data/mcbr/functions/admin/init_dynamic_coords.mcfunction) [신규]**: 진입한 호스트 플레이어의 스폰 지점을 X/Z 기준점으로 기록합니다.
  * 대기 로비: 감지된 스폰 좌표 바로 위 공중 `(spawn_x, 120, spawn_z)`에 생성.
  * 전투 아레나 중심점: `(spawn_x + 1000, spawn_z + 1000)`으로 자동 설정.
  * 진입 후 5초 뒤 지형 상공 청크 로드 및 상자 격자 자동 분석 스캔을 트리거합니다.
* **[build_lobby_platform.mcfunction](file:///d:/Projects/github/Minecraft_Mods/battle_royale_datapack2/data/mcbr/functions/map/build_lobby_platform.mcfunction) [수정]**: 설정된 동적 좌표 위에 `mcbr_lobby_builder` 빌더 마커를 소환하여 공중 Spruce Planks 로비를 안전하게 생성합니다. 중앙에는 영구적인 플레이어 스폰 마커 `mcbr_lobby_spawn`를 배치합니다.
* **[send_self_to_lobby.mcfunction](file:///d:/Projects/github/Minecraft_Mods/battle_royale_datapack2/data/mcbr/functions/player/send_self_to_lobby.mcfunction) [수정]**: 하드코딩되었던 `0 100 0` 순간 이동 명령을 `tp @s @e[tag=mcbr_lobby_spawn,limit=1]`로 교체하여 언제든 하늘 로비 플랫폼 중앙으로 정상 복귀할 수 있도록 교정했습니다.

### 2. 상대 좌표 기반의 상자 후보지 자동 격자 분석 스캔
* **[spawn_candidate_grid_candidates.mcfunction](file:///d:/Projects/github/Minecraft_Mods/battle_royale_datapack2/data/mcbr/functions/map/spawn_candidate_grid_candidates.mcfunction) [수정]**: 121개의 스캔 프로브 소환 좌표를 아레나 중심 마커(`mcbr_center_marker`) 기준의 완전한 상대 좌표(`~ ~ ~`) 형태로 소환하도록 재생성했습니다.
* **[generate_chest_candidates.mcfunction](file:///d:/Projects/github/Minecraft_Mods/battle_royale_datapack2/data/mcbr/functions/map/generate_chest_candidates.mcfunction) [수정]**: 동적 아레나 중심에 `mcbr_center_marker`를 소환하고, 해당 위치 기준 `~-120 ~-120 ~120 ~120` 범위를 동적으로 강제 로딩하여 스캔이 진행되는 동안 청크가 유지되도록 했습니다.

### 3. 동적 아레나 백업 & 복구 (11x11 확장 격자)
* **[backup_arena.mcfunction](file:///d:/Projects/github/Minecraft_Mods/battle_royale_datapack2/data/mcbr/functions/map/backup_arena.mcfunction) & [restore_arena.mcfunction](file:///d:/Projects/github/Minecraft_Mods/battle_royale_datapack2/data/mcbr/functions/map/restore_arena.mcfunction) [수정]**:
  * 복원 및 복사 명령어(`clone`)를 아레나 복구 헬퍼 마커(`mcbr_restore_helper`) 기준의 100% 상대식으로 포팅했습니다.
  * 스캔 후보지가 속하는 반경 80블록 영역 전체를 완벽히 커버할 수 있도록 16x16 크기 청크 121개 세트(11x11 행렬 범위인 `-88..87`)로 백업 복제 영역을 확장하여 맵 바깥 지형의 파괴까지 전부 동적 복구할 수 있도록 보완했습니다.

### 4. 청크 로드 및 스캔 안정화 개선
* **[forceload_arena.mcfunction](file:///d:/Projects/github/Minecraft_Mods/battle_royale_datapack2/data/mcbr/functions/map/forceload_arena.mcfunction) & [forceload_arena_remove.mcfunction](file:///d:/Projects/github/Minecraft_Mods/battle_royale_datapack2/data/mcbr/functions/map/forceload_arena_remove.mcfunction) [신규]**:
  * 기존에 하드코딩 좌표(`880 880 1120 1120`, `858 858 1142 1142`)로 개별 파일마다 산재되어 있던 청크 강제 로딩 코드를 제거하고, 동적으로 설정된 아레나 중심점을 기준으로 `~-150` ~ `~150` 구역 전체를 강제 로드/해제하는 상대 좌표 헬퍼 함수를 구축하고 연계 파일들을 모두 업데이트했습니다.
* **[cleanup_spawn_cache_from_scores.mcfunction](file:///d:/Projects/github/Minecraft_Mods/battle_royale_datapack2/data/mcbr/functions/loot/cleanup_spawn_cache_from_scores.mcfunction) [수정]**:
  * 특정 아레나 절대 좌표 조건(`800..1200`) 검사 필터를 지우고 높이 Y 좌표 범위(`50..150`) 검사 방식으로 변경하여 월드 어디서든 스타터 킷 상자 파괴 및 청소가 안정적으로 동작하게 되었습니다.
* **[start_game_ready.mcfunction](file:///d:/Projects/github/Minecraft_Mods/battle_royale_datapack2/data/mcbr/functions/admin/start_game_ready.mcfunction) [수정]**:
  * 월드 로드 대기실 로비 5초 대기 분석 외에, 혹시라도 격자 분석 후보 마커가 없는 상태로 유저가 게임 시작 레버를 동작시켰을 경우 카운트다운(3초) 중 백그라운드에서 즉각 자동 스캔을 실행하여 필드에 상자가 채워질 수 있도록 견고한 폴백 처리를 추가했습니다.

---

## 🧪 검증 및 사용법

1. 데이터팩이 설치된 상태에서 새 월드를 생성하거나 로드합니다.
2. 5초 뒤 로비 채팅창에 `[mcbr2] 상자 후보지 자동 스캔이 끝났습니다.`가 출력되는지 확인합니다.
3. 로비의 게임 시작 레버를 당기거나 명령어로 매치를 시작하여, 플레이어가 동적 좌표 영역에 뿌려지고 드롭 아이템 청소 및 지형 상대 복구가 동작하는지 플레이해 봅니다.
