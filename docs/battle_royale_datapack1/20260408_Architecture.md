# Architecture

대상 경로: `E:\Projects\Minecraft_Mods\battle_royale_datapack1`

이 문서는 `battle_royale_datapack1`의 실제 호출 흐름을 단계별로 정리한 문서다.  
전체 파일 목록은 `(E:\Projects\Minecraft_Mods\battle_royale_datapack1\docs\Function_Index.md)`를,  
loot table 목록은 `(E:\Projects\Minecraft_Mods\battle_royale_datapack1\docs\LootTable_Index.md)`를 본다.

## 1. 게임 설치 - `/function mcbr:admin/build_lobby`

### 1.1 단계 `(E:\Projects\Minecraft_Mods\battle_royale_datapack1\data\mcbr\functions\admin\build_lobby.mcfunction)`
1) `function mcbr:map/build_lobby_platform`
   - 로비 플랫폼 생성

2) `function mcbr:map/backup_arena`
   - 전투 구역 전체 백업 실행

3) `gamerule doImmediateRespawn true`
   - 사망 시 리스폰 버튼 없이 즉시 리스폰되게 설정

4) `scoreboard players set $arena_restore_enabled mcbr.config 1`
   - 맵 복구 기능 활성화

5) `execute if entity @s run tag @a remove mcbr_host`
   - 기존 host 태그 제거

6) `execute if entity @s run tag @s add mcbr_host`
   - 실행자를 host로 지정

7) `execute if entity @s run tp @s 0 100 0`
   - 실행자를 로비 중심으로 이동

8) `tellraw @a [{"text":"[mcbr] Lobby built, arena backup refreshed, and arena restore enabled.","color":"green"}]`
   - 완료 메시지 출력


## 2. 게임 시작 - 레버 또는 `/function mcbr:admin/start_game`

### 2.1 단계 `(E:\Projects\Minecraft_Mods\battle_royale_datapack1\data\mcbr\functions\admin\start_game.mcfunction)`
1) `function mcbr:core/start_game`
   - 실제 게임 시작 로직 진입

### 2.2 단계 `(E:\Projects\Minecraft_Mods\battle_royale_datapack1\data\mcbr\functions\core\start_game.mcfunction)`
1) `execute unless score $state mcbr.state matches 0 run function mcbr:core/reset_game`
   - 현재 상태가 waiting(0)이 아니면 먼저 reset 수행

2) `function mcbr:core/prepare_round`
   - 다음 라운드 준비 단계 진입

3) `function mcbr:core/start_game_continue`
   - 참가 인원 검사 후 countdown 진입

### 2.3 단계 `(E:\Projects\Minecraft_Mods\battle_royale_datapack1\data\mcbr\functions\core\prepare_round.mcfunction)`
1) `forceload add 858 858 1142 1142`
   - 초기 보더 전체 준비 범위를 강제 로드

2) `schedule function mcbr:core/prepare_round_continue 1t replace`
   - 1틱 뒤 실제 준비 파이프라인 실행

### 2.4 단계 `(E:\Projects\Minecraft_Mods\battle_royale_datapack1\data\mcbr\functions\core\prepare_round_continue.mcfunction)`
1) `tellraw ... Prepare round 1/5`
   - 단계 메시지 출력

2) `function mcbr:map/clear_arena_drops`
   - 보더 전체 드롭 아이템, XP, 발사체 정리

3) `tellraw ... Prepare round 2/5`
   - 단계 메시지 출력

4) `function mcbr:loot/cleanup_spawn_caches`
   - 이전 라운드 시작 상자 정리

5) `tellraw ... Prepare round 3/5`
   - 단계 메시지 출력

6) `function mcbr:loot/clear_field_chests`
   - 필드 상자 50개 후보지 기준으로 기존 상자 정리

7) `tellraw ... Prepare round 4/5`
   - 단계 메시지 출력

8) `execute if score $arena_restore_enabled mcbr.config matches 1 run function mcbr:map/restore_arena`
   - 보더 전체 백업본으로 블록 복구

9) `tellraw ... Prepare round 5/5`
   - 단계 메시지 출력

10) `function mcbr:map/clear_arena_drops`
    - 복구 후 드롭 아이템, XP, 발사체 재정리

11) `execute if score $chest_refill_enabled mcbr.config matches 1 run function mcbr:core/refill_chests`
    - 필드 상자 새로 생성 및 리필

12) `forceload remove 858 858 1142 1142`
    - 준비용 강제 로드 해제

13) `tellraw @a [{"text":"[mcbr] Round preparation complete.","color":"green"}]`
    - 준비 완료 메시지 출력

### 2.5 단계 `(E:\Projects\Minecraft_Mods\battle_royale_datapack1\data\mcbr\functions\map\restore_arena.mcfunction)`
1) `tellraw ... Arena restore 1/5`
   - 북서쪽 복구 시작

2) `forceload add ...`
   - 북서쪽 live/backup 구역 로드

3) `function mcbr:map/restore_arena_q1`
   - 북서쪽 clone 체인 실행

4) `restore_arena_q2`, `restore_arena_q3`, `restore_arena_q4`
   - 북동, 남서, 남동 순서로 전체 보더 복구

5) `tellraw @a [{"text":"[mcbr] Arena restored from backup region.","color":"aqua"}]`
   - 맵 복구 완료 메시지 출력

### 2.6 단계 `(E:\Projects\Minecraft_Mods\battle_royale_datapack1\data\mcbr\functions\core\start_game_continue.mcfunction)`
1) `scoreboard players set $active_count mcbr.tmp 0`
   - 참가 가능 인원 계산 준비

2) `execute as @a[gamemode=!spectator] run scoreboard players add $active_count mcbr.tmp 1`
   - spectator 제외 인원 계산

3) `execute unless score $active_count mcbr.tmp >= $min_players mcbr.config run tellraw ...`
   - 최소 인원 미달 메시지 출력

4) `execute if score $active_count mcbr.tmp > $max_players mcbr.config run tellraw ...`
   - 최대 인원 초과 메시지 출력

5) `execute if score $active_count mcbr.tmp >= $min_players mcbr.config run function mcbr:admin/start_game_ready`
   - 시작 가능 시 countdown 준비 단계 진입

### 2.7 단계 `(E:\Projects\Minecraft_Mods\battle_royale_datapack1\data\mcbr\functions\admin\start_game_ready.mcfunction)`
1) `scoreboard players set $state mcbr.state 1`
   - 상태를 countdown으로 변경

2) `scoreboard players operation $countdown_ticks mcbr.timer = $countdown_ticks_default mcbr.config`
   - countdown 시간 설정

3) `scoreboard players set $end_lock mcbr.tmp 0`
   - 종료 잠금 초기화

4) 태그 및 임시 점수 초기화
   - `mcbr_playing`, `mcbr_alive`, `mcbr_next_pick` 제거

5) `function mcbr:player/pick_next_player_by_join_order`
   - 로그인 순서 기준으로 최대 인원까지만 참가자로 선별

6) `tag @a[tag=mcbr_playing] add mcbr_alive`
   - 참가자를 생존 상태로 지정

7) `execute as @a[tag=mcbr_playing] run function mcbr:player/cleanup`
   - 참가자 상태 정리

8) `execute as @a[tag=!mcbr_playing,gamemode=!spectator] run function mcbr:player/join_lobby`
   - 비참가자는 로비로 이동

9) `gamemode adventure @a[tag=mcbr_playing]`
   - countdown 동안 참가자 adventure 유지

10) `tellraw` / `title`
    - countdown 시작 메시지 출력

### 2.8 단계 `(E:\Projects\Minecraft_Mods\battle_royale_datapack1\data\mcbr\functions\game\countdown.mcfunction)`
1) `scoreboard players remove $countdown_ticks mcbr.timer 1`
   - countdown 감소

2) `execute if score ... run title ...`
   - 남은 시간 표시

3) `execute if score $countdown_ticks mcbr.timer matches 0 run function mcbr:game/spread_players`
   - 참가자를 전투 구역으로 랜덤 배치

4) `execute if score $countdown_ticks mcbr.timer matches 0 run function mcbr:game/begin_match`
   - 실제 전투 시작

### 2.9 단계 `(E:\Projects\Minecraft_Mods\battle_royale_datapack1\data\mcbr\functions\game\begin_match.mcfunction)`
1) `scoreboard players set $state mcbr.state 2`
   - 상태를 in_game으로 변경

2) `time set day`
   - 시간 초기화

3) `title` / `tellraw`
   - 전투 시작 메시지 출력

4) `team leave @a[tag=mcbr_playing]`
   - 참가자를 로비 팀에서 분리

5) `gamemode survival @a[tag=mcbr_playing]`
   - 참가자를 survival로 전환

6) `function mcbr:game/assign_spawn_loadouts`
   - 시작 상자용 권총, 탄약, 방어구 배정

7) `execute as @a[tag=mcbr_playing] at @s run function mcbr:loot/spawn_pistol_cache`
   - 플레이어 주변 시작 상자 생성

8) `function mcbr:game/border_control`
   - 보더 축소 시작


## 3. 게임 종료 - 자동 종료 또는 `/function mcbr:admin/reset_game`

### 3.1 실제 호출 체인
1) `mcbr:game/check_winner`
2) `mcbr:game/end_game`
3) `mcbr:state/ended_tick`
4) `mcbr:game/reset_game`
5) `mcbr:core/reset_game`

### 3.2 단계 `(E:\Projects\Minecraft_Mods\battle_royale_datapack1\data\mcbr\functions\game\end_game.mcfunction)`
1) `scoreboard players set $end_lock mcbr.tmp 1`
   - 종료 잠금 설정

2) `scoreboard players set $state mcbr.state 3`
   - 상태를 ended로 변경

3) `scoreboard players operation $end_ticks mcbr.timer = $end_ticks_default mcbr.config`
   - 종료 대기 시간 설정

4) `gamemode adventure @a[tag=mcbr_playing,gamemode=!spectator]`
   - 남은 참가자 전투 중지

5) `effect give ... resistance`
   - 승자 확정 직후 추가 피해 방지

6) `tellraw` / `title`
   - 종료 메시지 출력

### 3.3 단계 `(E:\Projects\Minecraft_Mods\battle_royale_datapack1\data\mcbr\functions\state\ended_tick.mcfunction)`
1) `scoreboard players remove $end_ticks mcbr.timer 1`
   - 종료 대기 시간 감소

2) `execute if score $end_ticks mcbr.timer matches ..0 run function mcbr:game/reset_game`
   - 시간이 끝나면 reset_game 실행

### 3.4 단계 `(E:\Projects\Minecraft_Mods\battle_royale_datapack1\data\mcbr\functions\core\reset_game.mcfunction)`
1) `forceload add 858 858 1142 1142`
   - 정리 범위 강제 로드

2) `function mcbr:map/clear_arena_drops`
   - 보더 전체 드롭 아이템, XP, 발사체 정리

3) `function mcbr:loot/cleanup_spawn_caches`
   - 이전 시작 상자 정리

4) `forceload remove 858 858 1142 1142`
   - 정리용 강제 로드 해제

5) 상태값 초기화
   - `$state = 0`
   - `$countdown_ticks = 0`
   - `$end_ticks = 0`
   - `$end_lock = 0`

6) 참가 태그 및 점수 초기화
   - `mcbr_playing`, `mcbr_alive` 제거

7) `execute as @a run function mcbr:player/cleanup`
   - 전원 상태 정리

8) `team join mcbr_lobby @a`
   - 전원 로비 팀 합류

9) `function mcbr:map/send_all_to_lobby`
   - 전원 로비 이동

10) `function mcbr:map/reset_border`
    - 보더를 로비 안전 상태로 복구

11) `tellraw @a [{"text":"[mcbr] Reset complete. Back to lobby.","color":"green"}]`
    - 완료 메시지 출력


## 4. Debug 함수

- 실제 운영용 `admin`과 분리된 시험 전용 함수
- 경로 기준: `(E:\Projects\Minecraft_Mods\battle_royale_datapack1\data\mcbr\functions\debug)`

### 4.1 상태 확인
1) `/function mcbr:debug/status`
   - 현재 host, state, config 값을 확인

### 4.2 상자/루팅 점검
1) `/function mcbr:debug/build_test_chests`
   - 테스트용 상자 링 생성

2) `/function mcbr:debug/refill_chests`
   - 필드 상자 리필 강제 실행

### 4.3 설정 점검
1) `/function mcbr:debug/apply_default_config`
   - 기본 config 값을 현재 월드 scoreboard에 다시 적용

2) `/function mcbr:debug/enable_arena_restore`
   - 맵 복구 활성화

3) `/function mcbr:debug/disable_arena_restore`
   - 맵 복구 비활성화

4) `/function mcbr:debug/enable_solo_debug`
   - solo debug 활성화

5) `/function mcbr:debug/disable_solo_debug`
   - solo debug 비활성화

6) `/function mcbr:debug/force_end`
   - 현재 경기를 강제 종료 상태로 전환

### 4.4 단계별 검증
1) `/function mcbr:debug/step_clear_drops`
   - 보더 전체 드롭 아이템 정리만 단독 실행

2) `/function mcbr:debug/step_cleanup_spawn_caches`
   - 시작 상자 정리만 단독 실행

3) `/function mcbr:debug/step_clear_field_chests`
   - 필드 상자 제거만 단독 실행

4) `/function mcbr:debug/step_restore_arena`
   - 맵 복구만 단독 실행

5) `/function mcbr:debug/step_refill_chests`
   - 상자 리필만 단독 실행

6) `/function mcbr:debug/step_prepare_round`
   - 전체 prepare_round 파이프라인 시험 실행
