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

---

## 🐞 2026-06-08 추가 버그 수정 및 최적화 내역 (데이터팩 1 & 2 및 자바 모드 공통)

새 게임을 구동하는 과정에서 발견된 **랜덤 상자 중복/불일치/미스폰 버그**를 철저히 디버깅하여 해결하고 문서를 보강합니다.

### 1. P320 권총 탄환 불일치 수정
* **문제점**: 스타터 권총 상자(`spawn_p320.json`)에서 P320 권총은 `.45 ACP` 탄환을 사용해야 하나, 잘못된 탄환 종류인 `9mm`가 소환되어 총에 총알이 장전되지 않는 현상이 있었습니다.
* **조치**: [spawn_p320.json](file:///d:/Projects/github/Minecraft_Mods/battle_royale_datapack2/data/mcbr/loot_tables/chests/sets/spawn_p320.json) (데이터팩 1, 2 둘 다)의 탄환 코드를 `tacz:45acp`로 변경하여 완벽하게 탄환 페어링을 맞췄습니다.

### 2. 상자 중복 소환 및 꼬임 현상 해결 (중복 마커 자동 클린업)
* **문제점**: 청크 비동기 로딩 렉이나 `/reload`, 수동 리셋 과정에서 상자 스캔 마커(`mcbr_chest_candidate`)가 동일한 좌표에 중복 생성 및 누적되는 렉/버그 현상이 있었습니다.
* **조치**: 스캔 마커 소환 시 **반경 0.1블록 이내에 겹쳐 있는 마커들을 1개만 남기고 모두 킬(kill)** 하는 중복 마커 제거(Deduplication) 코드를 스캔 완료 지점과 소환 시작점에 추가하여 마커 누적으로 인한 상자 중복 설치를 원천 차단했습니다.
  * *수정 파일*: [generate_chest_candidates_complete.mcfunction (DP2)](file:///d:/Projects/github/Minecraft_Mods/battle_royale_datapack2/data/mcbr/functions/map/generate_chest_candidates_complete.mcfunction), [place_field_chests.mcfunction (DP1)](file:///d:/Projects/github/Minecraft_Mods/battle_royale_datapack1/data/mcbr/functions/loot/place_field_chests.mcfunction)

### 3. 활성화 상자 필터 누락 해결 (상자 1개만 나오던 문제)
* **문제점**: 후보지는 48개가 정상 스캔되었으나, 인게임 매치 시작 시 활성화된 상자(`mcbr_chest_active`)가 Rare 1개만 나오고 나머지가 소환되지 않는 치명적 현상이 있었습니다.
* **조치**: `assign_field_loot.mcfunction` 에서 Uncommon과 Common 등급 상자 마커를 랜덤하게 골라 배정할 때 `@e` 선택자에 **`tag=mcbr_chest_candidate` 필터가 누락**되어 있어, 월드 내 로비 스폰 마커 등 다른 시스템 마커들에게 상자 태그를 뺏기던 현상을 규명하고 코드를 수정했습니다.
  * *수정 파일*: [assign_field_loot.mcfunction (DP1 & DP2)](file:///d:/Projects/github/Minecraft_Mods/battle_royale_datapack2/data/mcbr/functions/loot/assign_field_loot.mcfunction)

### 4. 마커 태그 클린업 강화 (잔재 마커 카운트 꼬임 방지)
* **문제점**: 이전 라운드의 버그로 인해 로비 스폰 마커 등에 묻어 있던 `mcbr_chest_active` 등 상자 관련 태그들이 라운드 리셋 시 지워지지 않아 마커 활성화 개수(12개 등으로 꼬임)가 부정확해지는 현상이 있었습니다.
* **조치**: 매치 시작 시 **월드 내 모든 마커(`@e[type=minecraft:marker]`)의 상자 관련 태그(active, common, uncommon, rare)를 일괄 리셋**하도록 조치하여 태그가 계속 누적되거나 꼬이는 현상을 완전히 해소했습니다.

### 5. 자바 모드 측 이중 루팅 방지 안전장치 구현
* **내용**: 향후 포지 모드(`mcbr_forge_mod`)를 활성화하게 될 경우, 마인크래프트 데이터팩의 `LootTable` NBT를 가진 상자를 플레이어가 처음 열 때 자바 모드가 빈 상자로 잘못 판단하여 자바 자체의 무작위를 상자에 덧칠(Double Loot)하는 것을 차단했습니다. 자바 측 코드에서 상자 NBT 내 `LootTable` 존재 여부를 실시간 검사하여 충돌을 막도록 안전 코드를 빌드 완료했습니다.
  * *수정 파일*: [BrLootService.java](file:///d:/Projects/github/Minecraft_Mods/mcbr_forge_mod/src/main/java/com/mkmod/mcbr/loot/BrLootService.java)

---

## 🛠️ 인게임 상자 생성 확인 및 디버깅 명령어 안내

지형 복잡도가 높은 정글 등의 지형에서 상자 생성 수량 및 실시간 위치를 시각적으로 확인하기 위해 아래 명령어를 활용할 수 있습니다.

* **스캔된 총 상자 후보지 개수 확인**:
  `/execute if entity @e[type=minecraft:marker,tag=mcbr_chest_candidate]`
* **실제 게임 내 스폰되어 활성화된 11개(1인 기준) 상자 마커 확인**:
  `/execute if entity @e[type=minecraft:marker,tag=mcbr_chest_active]`
* **실제 활성화된 11개 상자의 X/Y/Z 좌표 채팅창에 목록 출력**:
  `/execute as @e[type=minecraft:marker,tag=mcbr_chest_active] run tellraw @a [{"text":"[mcbr] 활성화 상자 좌표: ","color":"green"},{"nbt":"Pos","entity":"@s"}]`
* **실제 활성화된 상자 위치에만 반짝이는 파티클 뿌려 찾기**:
  `/execute at @e[type=minecraft:marker,tag=mcbr_chest_active] run particle minecraft:totem_of_undying ~ ~0.5 ~ 0.2 0.2 0.2 0.1 100`
* **모든 후보 상자(48개 전체)를 발광석 및 상자로 시각화하기 (위치 확인용)**:
  `/function mcbr:map/preview_chest_candidates`
* **상자 시각화 끄기 및 원래대로 지우기**:
  `/function mcbr:map/clear_chest_candidate_preview`

