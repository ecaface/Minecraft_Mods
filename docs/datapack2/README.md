# battle_royale_datapack2

이 폴더는 `battle_royale_datapack1`을 유지한 채, 새 맵용 랜덤 상자 후보지 시스템을 실험하는 2단계 작업 공간이다.

## 원칙
- `battle_royale_datapack1`은 더 이상 수정하지 않는다.
- 새 실험은 모두 이 폴더에서만 진행한다.
- 문서는 이 폴더 안에서만 관리한다.

## 현재 작업 주제
- 새 맵에서 상자 후보지를 자동으로 추출하는 시스템 설계 및 구현
- 후보지 기반 랜덤 상자 활성화 구조 검증

## 현재 관리자 함수
- `/function mcbr:admin/generate_random_candidates`
  - 후보지 자동 생성 실행
- `/function mcbr:admin/clear_random_candidates`
  - 기존 후보지 marker 정리
- `/function mcbr:admin/candidate_status`
  - 후보지 개수 확인
- `/function mcbr:admin/preview_random_candidates`
  - 후보지 미리보기 상자 생성
- `/function mcbr:admin/clear_random_candidate_preview`
  - 후보지 미리보기 정리

## 현재 확인 포인트
- 후보지가 실제로 생성되는지
- 중앙 후보 분류가 되는지
- 미리보기 상자가 올바른 위치에 보이는지

## 관련 문서
- [DESIGN_RANDOM_CHEST_SYSTEM.md](DESIGN_RANDOM_CHEST_SYSTEM.md)
- [NEXT_STEPS.md](NEXT_STEPS.md)
- [VERSION.md](VERSION.md)
