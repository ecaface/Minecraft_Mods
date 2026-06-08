# 배틀로얄 기능 역할 정리

업데이트: `2026-04-08`
기준 버전: `0.2.66-dev`

## 핵심 원칙
- `reset_game`는 종료 처리 전용이다.
- `prepare_round`는 다음 판 준비 전용이다.
- `begin_match`는 실제 전투 시작 전용이다.
- 로비 복귀, 맵 복원, 상자 리필, 시작 상자 생성 책임을 섞지 않는다.

## 주요 진입점
- 새 맵 초기 세팅:
  - `/function mcbr:admin/build_lobby`
- 일반 경기 시작:
  - 로비 레버
  - 또는 `/function mcbr:admin/start_game`
- 강제 로비 복귀:
  - `/function mcbr:admin/reset_game`
- 필드 상자 수동 리필:
  - `/function mcbr:debug/refill_chests`
- 현재 상태 확인:
  - `/function mcbr:debug/status`
- 현재 기본 설정 다시 적용:
  - `/function mcbr:debug/apply_default_config`

## 로비
- 역할:
  - 안전 대기 공간
  - 경기 시작 지점
  - 경기 종료 후 복귀 지점
- 주요 파일:
  - [build_lobby.mcfunction](../battle_royale_datapack1/data/mcbr/functions/admin/build_lobby.mcfunction)
  - [build_lobby_platform.mcfunction](../battle_royale_datapack1/data/mcbr/functions/map/build_lobby_platform.mcfunction)
  - [send_all_to_lobby.mcfunction](../battle_royale_datapack1/data/mcbr/functions/map/send_all_to_lobby.mcfunction)
  - [join_lobby.mcfunction](../battle_royale_datapack1/data/mcbr/functions/player/join_lobby.mcfunction)

## 호스트
- 역할:
  - `mcbr_host` 태그를 가진 플레이어
  - 로비 레버로 경기를 시작할 수 있는 플레이어
- 지정 방식:
  - [build_lobby.mcfunction](../battle_royale_datapack1/data/mcbr/functions/admin/build_lobby.mcfunction) 실행자
- 상태 확인:
  - [status.mcfunction](../battle_royale_datapack1/data/mcbr/functions/debug/status.mcfunction)

## 경기 시작 흐름
1. [admin/start_game.mcfunction](../battle_royale_datapack1/data/mcbr/functions/admin/start_game.mcfunction)
2. [core/start_game.mcfunction](../battle_royale_datapack1/data/mcbr/functions/core/start_game.mcfunction)
3. [core/prepare_round.mcfunction](../battle_royale_datapack1/data/mcbr/functions/core/prepare_round.mcfunction)
4. [core/prepare_round_continue.mcfunction](../battle_royale_datapack1/data/mcbr/functions/core/prepare_round_continue.mcfunction)
5. [core/start_game_continue.mcfunction](../battle_royale_datapack1/data/mcbr/functions/core/start_game_continue.mcfunction)
6. [admin/start_game_ready.mcfunction](../battle_royale_datapack1/data/mcbr/functions/admin/start_game_ready.mcfunction)
7. [game/countdown.mcfunction](../battle_royale_datapack1/data/mcbr/functions/game/countdown.mcfunction)
8. [game/begin_match.mcfunction](../battle_royale_datapack1/data/mcbr/functions/game/begin_match.mcfunction)

## reset_game
- 역할:
  - 현재 판 상태 정리
  - 남아 있는 드롭 아이템 정리
  - 시작 상자 정리
  - 플레이어 정리
  - 전원 로비 복귀
  - 로비에서 죽지 않도록 보더 즉시 복구
- 주요 파일:
  - [core/reset_game.mcfunction](../battle_royale_datapack1/data/mcbr/functions/core/reset_game.mcfunction)
  - [reset_border.mcfunction](../battle_royale_datapack1/data/mcbr/functions/map/reset_border.mcfunction)

## prepare_round
- 역할:
  - 다음 판 준비
  - 시작 상자 잔여물 정리
  - 전투 구역 드롭 아이템 정리
  - 필요 시 맵 복원
  - 필드 상자 리필
- 주요 파일:
  - [prepare_round.mcfunction](../battle_royale_datapack1/data/mcbr/functions/core/prepare_round.mcfunction)
  - [prepare_round_continue.mcfunction](../battle_royale_datapack1/data/mcbr/functions/core/prepare_round_continue.mcfunction)

## 맵 백업과 복원
- 백업:
  - `build_lobby` 실행 시 1회 수행
- 복원:
  - `prepare_round_continue`에서 수행
- 목적:
  - 전투 핵심 구역 지형 원복
  - 전투 중 파손된 블록, 나무, 지형 복구
- 주요 파일:
  - [backup_arena.mcfunction](../battle_royale_datapack1/data/mcbr/functions/map/backup_arena.mcfunction)
  - [restore_arena.mcfunction](../battle_royale_datapack1/data/mcbr/functions/map/restore_arena.mcfunction)

## 필드 상자
- 역할:
  - 50개 후보지 중 일부를 매 판 활성화
  - 인원수에 따라 common / uncommon / rare 수를 조절
  - rare는 중앙 후보 10개에서만 생성
- 현재 규칙:
  - common = `n * 4`
  - uncommon = `(n - 1)^2 + 1`
  - rare = `floor(n / 2)`
- 관련 파일:
  - [core/refill_chests.mcfunction](../battle_royale_datapack1/data/mcbr/functions/core/refill_chests.mcfunction)
  - [refill_all.mcfunction](../battle_royale_datapack1/data/mcbr/functions/loot/refill_all.mcfunction)
  - [place_field_chests.mcfunction](../battle_royale_datapack1/data/mcbr/functions/loot/place_field_chests.mcfunction)
  - [assign_field_loot.mcfunction](../battle_royale_datapack1/data/mcbr/functions/loot/assign_field_loot.mcfunction)
  - [spawn_candidates_50.mcfunction](../battle_royale_datapack1/data/mcbr/functions/loot/spawn_candidates_50.mcfunction)

## 시작 상자
- 역할:
  - 전투 시작 시 플레이어 근처에 권총 상자 생성
  - 맞는 탄약과 랜덤 풀세트 방어구 제공
  - 다음 판 준비 때 정확한 좌표 기반으로 정리
- 관련 파일:
  - [assign_spawn_loadouts.mcfunction](../battle_royale_datapack1/data/mcbr/functions/game/assign_spawn_loadouts.mcfunction)
  - [spawn_pistol_cache.mcfunction](../battle_royale_datapack1/data/mcbr/functions/loot/spawn_pistol_cache.mcfunction)
  - [cleanup_spawn_caches.mcfunction](../battle_royale_datapack1/data/mcbr/functions/loot/cleanup_spawn_caches.mcfunction)
  - [cleanup_spawn_cache_from_scores.mcfunction](../battle_royale_datapack1/data/mcbr/functions/loot/cleanup_spawn_cache_from_scores.mcfunction)

## 인원 제한
- 기본값:
  - 최소 `1`
  - 최대 `4`
- 동작:
  - spectator가 아닌 접속자 수를 기준으로 시작 가능 여부 계산
  - 최대 인원 초과 시 일부만 참가자로 선정
  - 초과 인원은 로비 대기
- 관련 파일:
  - [load_config_defaults.mcfunction](../battle_royale_datapack1/data/mcbr/functions/load_config_defaults.mcfunction)
  - [start_game_continue.mcfunction](../battle_royale_datapack1/data/mcbr/functions/core/start_game_continue.mcfunction)
  - [start_game_ready.mcfunction](../battle_royale_datapack1/data/mcbr/functions/admin/start_game_ready.mcfunction)

## 사망, 승리, 종료
- 역할:
  - 탈락 처리
  - 관전자 전환
  - 동시 사망 / 종료 레이스 방지
  - 승리 판정 후 종료 상태 진입
- 관련 파일:
  - [check_death_or_spectator.mcfunction](../battle_royale_datapack1/data/mcbr/functions/game/check_death_or_spectator.mcfunction)
  - [check_winner.mcfunction](../battle_royale_datapack1/data/mcbr/functions/game/check_winner.mcfunction)
  - [end_game.mcfunction](../battle_royale_datapack1/data/mcbr/functions/game/end_game.mcfunction)
  - [ended_tick.mcfunction](../battle_royale_datapack1/data/mcbr/functions/state/ended_tick.mcfunction)

## 상태 확인과 운영 함수 (Debug 네임스페이스)
- [status.mcfunction](../battle_royale_datapack1/data/mcbr/functions/debug/status.mcfunction)
  - 호스트 여부
  - 현재 호스트
  - state
  - arena_restore_enabled
  - chest_refill_enabled
  - min/max players
  - countdown / border / shrink 설정값
- [enable_arena_restore.mcfunction](../battle_royale_datapack1/data/mcbr/functions/debug/enable_arena_restore.mcfunction)
- [disable_arena_restore.mcfunction](../battle_royale_datapack1/data/mcbr/functions/debug/disable_arena_restore.mcfunction)
- [apply_default_config.mcfunction](../battle_royale_datapack1/data/mcbr/functions/debug/apply_default_config.mcfunction)

## 문제 생겼을 때 우선 확인 순서
- 로비 레버 시작 문제:
  - [waiting_tick.mcfunction](../battle_royale_datapack1/data/mcbr/functions/state/waiting_tick.mcfunction)
  - [start_game_from_lobby_lever.mcfunction](../battle_royale_datapack1/data/mcbr/functions/admin/start_game_from_lobby_lever.mcfunction)
- 맵 복원 문제:
  - [prepare_round.mcfunction](../battle_royale_datapack1/data/mcbr/functions/core/prepare_round.mcfunction)
  - [prepare_round_continue.mcfunction](../battle_royale_datapack1/data/mcbr/functions/core/prepare_round_continue.mcfunction)
  - [restore_arena.mcfunction](../battle_royale_datapack1/data/mcbr/functions/map/restore_arena.mcfunction)
- 필드 상자 문제:
  - [refill_all.mcfunction](../battle_royale_datapack1/data/mcbr/functions/loot/refill_all.mcfunction)
  - [place_field_chests.mcfunction](../battle_royale_datapack1/data/mcbr/functions/loot/place_field_chests.mcfunction)
  - [assign_field_loot.mcfunction](../battle_royale_datapack1/data/mcbr/functions/loot/assign_field_loot.mcfunction)
- 시작 상자 문제:
  - [spawn_pistol_cache.mcfunction](../battle_royale_datapack1/data/mcbr/functions/loot/spawn_pistol_cache.mcfunction)
  - [cleanup_spawn_caches.mcfunction](../battle_royale_datapack1/data/mcbr/functions/loot/cleanup_spawn_caches.mcfunction)
  - [cleanup_spawn_cache_from_scores.mcfunction](../battle_royale_datapack1/data/mcbr/functions/loot/cleanup_spawn_cache_from_scores.mcfunction)
