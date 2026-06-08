# battle_royale_datapack1 다음 작업

업데이트: `2026-04-08`

## 1. 라운드 복구 검증
- 2번째 판 시작 전에 필드 드롭 아이템이 모두 사라지는지 확인
- 2번째 판 시작 전에 플레이어 사망 드롭 아이템이 모두 사라지는지 확인
- 2번째 판 시작 전에 기존 필드 상자가 남지 않는지 확인
- 초기 보더 전체 안에서 부순 블록이 다음 판에 복구되는지 확인

## 2. prepare_round 단계 검증
- `Prepare round 1/5 ~ 5/5` 메시지가 실제 순서대로 출력되는지 확인
- `backup_arena 1/5 ~ 5/5` 메시지가 실제 순서대로 출력되는지 확인
- `restore_arena 1/5 ~ 5/5` 메시지가 실제 순서대로 출력되는지 확인

## 3. debug 단계별 시험
- `/function mcbr:debug/step_clear_drops`
- `/function mcbr:debug/step_cleanup_spawn_caches`
- `/function mcbr:debug/step_clear_field_chests`
- `/function mcbr:debug/step_restore_arena`
- `/function mcbr:debug/step_refill_chests`
- `/function mcbr:debug/step_prepare_round`

## 4. 다인원 실전 테스트
- 2인 테스트:
  - 랜덤 스폰
  - 시작 상자
  - 필드 상자
  - 사망 후 종료
  - 로비 복귀
- 3인 이상 테스트:
  - 관전자 전환
  - 남은 인원 경기 지속
  - 최종 승리 처리

## 5. 밸런스 조정
- 필드 상자 수량 체감 확인
- common / uncommon / rare 체감 확인
- 시작 상자 권총, 탄약, 방어구 세트 체감 확인
- 보더 축소 시간 체감 확인
