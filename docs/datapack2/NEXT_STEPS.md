# 다음 할 일

작성일: `2026-04-07`

## 우선순위 높음
- 격자 기반 후보지 생성이 실제로 marker를 남기는지 확인
- `candidate_status`에서 `total_candidates`가 0이 아닌 상태까지 만들기
- `preview_random_candidates`로 후보지 위치를 눈으로 확인하기

## 그 다음
- 지형 검사 조건을 다시 단계적으로 추가
- 물, 용암, 공중, 나무 위, 절벽 끝 제외 로직 붙이기
- 중앙 후보 / 일반 후보 분리 정교화

## 이후 연결 작업
- 후보지 기반 필드 상자 활성화 함수 만들기
- 인원수별 common / uncommon / rare 수량 규칙 연결
- rare는 중앙 후보지에서만 뽑도록 연결

## 점검 메모
- `battle_royale_datapack1`과 `battle_royale_datapack2`는 같은 `mcbr:` 네임스페이스를 사용하므로, 같은 월드 `datapacks`에 같이 넣으면 충돌할 수 있다.
- 실험할 때는 실제 월드에 `battle_royale_datapack2`만 넣고 확인하는 것이 안전하다.
