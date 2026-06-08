# Function Index

대상 경로: `E:\Projects\Minecraft_Mods\battle_royale_datapack1\data\mcbr\functions`

이 문서는 `functions` 폴더 안의 전체 `mcfunction` 파일을 폴더별로 정리한 인덱스다.  
실제 호출 흐름은 `(E:\Projects\Minecraft_Mods\battle_royale_datapack1\docs\Architecture.md)`를 본다.

## 1. 루트 함수
- `load.mcfunction`
- `load_config_defaults.mcfunction`
- `tick.mcfunction`

## 2. admin
- 운영용 진입 함수
- `build_lobby.mcfunction`
- `reset_game.mcfunction`
- `start_game.mcfunction`
- `start_game_continue.mcfunction`
- `start_game_from_lobby_lever.mcfunction`
- `start_game_ready.mcfunction`

## 3. core
- 공통 핵심 로직
- `prepare_round.mcfunction`
- `prepare_round_continue.mcfunction`
- `refill_chests.mcfunction`
- `reset_game.mcfunction`
- `start_game.mcfunction`
- `start_game_continue.mcfunction`

## 4. debug
- 시험용, 강제 실행용, 단계 검증용 함수
- `apply_default_config.mcfunction`
- `build_test_chests.mcfunction`
- `disable_arena_restore.mcfunction`
- `disable_solo_debug.mcfunction`
- `enable_arena_restore.mcfunction`
- `enable_solo_debug.mcfunction`
- `force_end.mcfunction`
- `refill_chests.mcfunction`
- `status.mcfunction`
- `step_cleanup_spawn_caches.mcfunction`
- `step_clear_drops.mcfunction`
- `step_clear_field_chests.mcfunction`
- `step_prepare_round.mcfunction`
- `step_refill_chests.mcfunction`
- `step_restore_arena.mcfunction`

## 5. game
- 실제 경기 진행 로직
- `assign_spawn_loadouts.mcfunction`
- `begin_match.mcfunction`
- `border_control.mcfunction`
- `check_death_or_spectator.mcfunction`
- `check_winner.mcfunction`
- `countdown.mcfunction`
- `end_game.mcfunction`
- `reset_game.mcfunction`
- `spread_players.mcfunction`

## 6. loot
- 상자 정리, 상자 생성, loot table 배정, 시작 상자 생성
- `assign_field_common_loot.mcfunction`
- `assign_field_loot.mcfunction`
- `assign_field_rare_loot.mcfunction`
- `assign_field_uncommon_loot.mcfunction`
- `cleanup_legacy_field_chests.mcfunction`
- `cleanup_spawn_cache_from_scores.mcfunction`
- `cleanup_spawn_caches.mcfunction`
- `clear_field_chests.mcfunction`
- `fill_airdrop.mcfunction`
- `fill_common.mcfunction`
- `fill_rare.mcfunction`
- `fill_uncommon.mcfunction`
- `place_field_chests.mcfunction`
- `refill_all.mcfunction`
- `spawn_candidates_50.mcfunction`
- `spawn_pistol_cache.mcfunction`
- `spawn_pistol_cache_fill_here.mcfunction`
- `spawn_pistol_cache_place_east_far.mcfunction`
- `spawn_pistol_cache_place_east_near.mcfunction`
- `spawn_pistol_cache_place_fallback.mcfunction`
- `spawn_pistol_cache_place_north_far.mcfunction`
- `spawn_pistol_cache_place_north_near.mcfunction`
- `spawn_pistol_cache_place_south_far.mcfunction`
- `spawn_pistol_cache_place_south_near.mcfunction`
- `spawn_pistol_cache_place_west_far.mcfunction`
- `spawn_pistol_cache_place_west_near.mcfunction`

## 7. map
- 로비, 보더, 백업, 복구, 전투 구역 정리
- `arena_clone_from_backup.mcfunction`
- `arena_clone_from_backup_q1.mcfunction`
- `arena_clone_from_backup_q2.mcfunction`
- `arena_clone_from_backup_q3.mcfunction`
- `arena_clone_from_backup_q4.mcfunction`
- `arena_clone_to_backup.mcfunction`
- `arena_clone_to_backup_q1.mcfunction`
- `arena_clone_to_backup_q2.mcfunction`
- `arena_clone_to_backup_q3.mcfunction`
- `arena_clone_to_backup_q4.mcfunction`
- `backup_arena.mcfunction`
- `backup_arena_q1.mcfunction`
- `backup_arena_q2.mcfunction`
- `backup_arena_q3.mcfunction`
- `backup_arena_q4.mcfunction`
- `build_lobby_platform.mcfunction`
- `build_test_chest_ring.mcfunction`
- `clear_arena_drops.mcfunction`
- `README.mcfunction`
- `reset_border.mcfunction`
- `restore_arena.mcfunction`
- `restore_arena_q1.mcfunction`
- `restore_arena_q2.mcfunction`
- `restore_arena_q3.mcfunction`
- `restore_arena_q4.mcfunction`
- `send_all_to_lobby.mcfunction`
- `send_self_to_lobby.mcfunction`
- `spread_players.mcfunction`
- `start_border.mcfunction`

## 8. player
- 플레이어 상태 전환과 참가자 선별
- `cleanup.mcfunction`
- `join_during_match.mcfunction`
- `join_lobby.mcfunction`
- `pick_next_player_by_join_order.mcfunction`
- `set_alive.mcfunction`
- `set_spectator.mcfunction`

## 9. state
- 상태 머신 tick 함수
- `countdown_tick.mcfunction`
- `ended_tick.mcfunction`
- `in_game_tick.mcfunction`
- `set_waiting.mcfunction`
- `waiting_tick.mcfunction`

## 10. util
- 공통 출력 보조 함수
- `announce.mcfunction`
- `debug_status.mcfunction`
- `titles.mcfunction`
