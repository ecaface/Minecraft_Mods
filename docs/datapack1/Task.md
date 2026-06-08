# Task

작성일: `2026-04-08`
대상 경로: `E:\Projects\Minecraft_Mods\battle_royale_datapack1`

## 1. 문제 정의
2번째 라운드 시작 전에 아래 문제가 남아 있었다.

1) 필드 드롭 아이템이 다음 판에 남음
- 플레이어 사망 드롭 포함

2) 필드 상자가 다음 판에 남거나 상자 주변으로 아이템이 떨어짐

3) 맵 복구 범위 밖 블록은 복구되지 않음

## 2. 해결 원칙

### 2.1 백업/복구 범위
- 대상: 초기 보더 전체
- 현재 기준 live 전투 구역:
  - `x 864..1151`
  - `y 60..127`
  - `z 864..1151`
- 현재 기준 backup 구역:
  - `x 1856..2143`
  - `y 60..127`
  - `z 1856..2143`

### 2.2 엔티티 정리 범위
- 대상: 초기 보더 전체
- 정리 대상:
  - `minecraft:item`
  - `minecraft:experience_orb`
  - `minecraft:arrow`
  - `minecraft:spectral_arrow`
  - `minecraft:trident`

### 2.3 역할 분리
- `reset_game`
  - 종료 처리
  - 로비 이동
  - 보더 안전 복구
- `prepare_round`
  - 다음 판 준비
  - 드롭 정리
  - 시작 상자 정리
  - 필드 상자 정리
  - 맵 복구
  - 필드 상자 재생성 및 리필

## 3. 목표 prepare_round 순서
1. 보더 전체 강제 로드
2. 보더 전체 드롭 아이템 정리
3. 이전 시작 상자 정리
4. 기존 필드 상자 정리
5. 보더 전체 블록 복구
6. 보더 전체 드롭 아이템 재정리
7. 필드 상자 재생성 및 리필
8. 강제 로드 해제

## 4. 진행률 메시지 원칙
백업과 복구 시간이 길어질 수 있으므로 단계 메시지를 출력한다.

예시:
- `[mcbr] Prepare round 1/5: clearing border-area drops...`
- `[mcbr] Prepare round 2/5: cleaning starter chests...`
- `[mcbr] Prepare round 3/5: clearing field chests...`
- `[mcbr] Prepare round 4/5: restoring arena blocks...`
- `[mcbr] Prepare round 5/5: rebuilding field chests...`

## 5. 수정 대상 함수

### 5.1 이미 반영된 함수
- `(E:\Projects\Minecraft_Mods\battle_royale_datapack1\data\mcbr\functions\core\prepare_round_continue.mcfunction)`
- `(E:\Projects\Minecraft_Mods\battle_royale_datapack1\data\mcbr\functions\map\backup_arena.mcfunction)`
- `(E:\Projects\Minecraft_Mods\battle_royale_datapack1\data\mcbr\functions\map\backup_arena_q1.mcfunction)`
- `(E:\Projects\Minecraft_Mods\battle_royale_datapack1\data\mcbr\functions\map\backup_arena_q2.mcfunction)`
- `(E:\Projects\Minecraft_Mods\battle_royale_datapack1\data\mcbr\functions\map\backup_arena_q3.mcfunction)`
- `(E:\Projects\Minecraft_Mods\battle_royale_datapack1\data\mcbr\functions\map\backup_arena_q4.mcfunction)`
- `(E:\Projects\Minecraft_Mods\battle_royale_datapack1\data\mcbr\functions\map\restore_arena.mcfunction)`
- `(E:\Projects\Minecraft_Mods\battle_royale_datapack1\data\mcbr\functions\map\restore_arena_q1.mcfunction)`
- `(E:\Projects\Minecraft_Mods\battle_royale_datapack1\data\mcbr\functions\map\restore_arena_q2.mcfunction)`
- `(E:\Projects\Minecraft_Mods\battle_royale_datapack1\data\mcbr\functions\map\restore_arena_q3.mcfunction)`
- `(E:\Projects\Minecraft_Mods\battle_royale_datapack1\data\mcbr\functions\map\restore_arena_q4.mcfunction)`
- `(E:\Projects\Minecraft_Mods\battle_royale_datapack1\data\mcbr\functions\map\clear_arena_drops.mcfunction)`
- `(E:\Projects\Minecraft_Mods\battle_royale_datapack1\data\mcbr\functions\loot\clear_field_chests.mcfunction)`

### 5.2 검증 대상 함수
- `(E:\Projects\Minecraft_Mods\battle_royale_datapack1\data\mcbr\functions\loot\cleanup_spawn_caches.mcfunction)`
- `(E:\Projects\Minecraft_Mods\battle_royale_datapack1\data\mcbr\functions\core\refill_chests.mcfunction)`
- `(E:\Projects\Minecraft_Mods\battle_royale_datapack1\data\mcbr\functions\loot\place_field_chests.mcfunction)`
- `(E:\Projects\Minecraft_Mods\battle_royale_datapack1\data\mcbr\functions\loot\assign_field_loot.mcfunction)`

## 6. debug 검증 함수
현재 단계별 검증용 함수가 준비되어 있다.

- `(E:\Projects\Minecraft_Mods\battle_royale_datapack1\data\mcbr\functions\debug\step_clear_drops.mcfunction)`
- `(E:\Projects\Minecraft_Mods\battle_royale_datapack1\data\mcbr\functions\debug\step_cleanup_spawn_caches.mcfunction)`
- `(E:\Projects\Minecraft_Mods\battle_royale_datapack1\data\mcbr\functions\debug\step_clear_field_chests.mcfunction)`
- `(E:\Projects\Minecraft_Mods\battle_royale_datapack1\data\mcbr\functions\debug\step_restore_arena.mcfunction)`
- `(E:\Projects\Minecraft_Mods\battle_royale_datapack1\data\mcbr\functions\debug\step_refill_chests.mcfunction)`
- `(E:\Projects\Minecraft_Mods\battle_royale_datapack1\data\mcbr\functions\debug\step_prepare_round.mcfunction)`

## 7. 남은 확인 항목
1. 2번째 판에서 플레이어 사망 드롭이 남지 않는지
2. 2번째 판에서 필드 상자가 남지 않는지
3. 2번째 판에서 상자 주변 드롭이 생기지 않는지
4. 보더 전체 안에서 부순 블록이 다음 판에 복구되는지
5. prepare_round 단계 메시지가 실제 순서대로 출력되는지

## 8. 완료 조건
아래 조건을 모두 만족하면 이 작업을 완료로 본다.

1. 보더 전체 안의 블록이 다음 판에 복구된다
2. 필드 드롭 아이템이 다음 판에 남지 않는다
3. 플레이어 사망 드롭 아이템이 다음 판에 남지 않는다
4. 필드 상자가 중복 생성되거나 바닥으로 드롭을 뿌리지 않는다
5. prepare_round 단계 메시지가 실제 순서대로 보인다
