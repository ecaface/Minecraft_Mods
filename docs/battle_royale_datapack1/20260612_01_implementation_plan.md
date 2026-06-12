# 구현 계획서 - datapack2 공통 개선사항 datapack1 백포트

작성일: `2026-06-12`
대상: `battle_royale_datapack1`
기준 방향: `battle_royale_datapack2`를 주 개발 대상으로 유지하되, 두 데이터팩에 공통으로 필요한 안정화 수정은 `battle_royale_datapack1`에도 반영한다.

---

## 1. 작업 배경

`battle_royale_datapack1`은 신규 기능 개발을 종료하고 안정판/백업판으로 유지한다. 다만 `battle_royale_datapack2`에서 실제 플레이 중 발견된 공통 버그 수정, 루팅 안정화, 상자 마커 꼬임 방지 로직은 datapack1에도 동일하게 적용해야 한다.

이번 작업은 기능 확장이 아니라 **공통 안정화 백포트**다. datapack1의 고정 좌표 기반 구조는 유지하고, datapack2 전용인 동적 로비/상대 좌표/자동 지형 스캔 기능은 가져오지 않는다.

---

## 2. 적용 대상 공통 개선사항

### 2.1 P320 시작 상자 탄약 수정

#### [MODIFY] `battle_royale_datapack1/data/mcbr/loot_tables/chests/sets/spawn_p320.json`

문제:
- P320 권총은 `.45 ACP` 탄약을 사용해야 한다.
- 시작 상자에서 잘못된 탄약이 지급되면 총은 생성되지만 장전/사용이 불가능해진다.

계획:
- `spawn_p320.json` 내부 탄약 ID를 `tacz:45acp`로 고정한다.
- 총기 ID, 탄창 용량, 탄약 수량 NBT가 기존 datapack2 수정본과 같은지 비교한다.

검증:
- 게임 내에서 시작 상자 또는 해당 loot table을 열었을 때 P320과 `tacz:45acp`가 함께 생성되는지 확인한다.

---

### 2.2 필드 상자 선택자 필터 보강

#### [MODIFY] `battle_royale_datapack1/data/mcbr/functions/loot/assign_field_loot.mcfunction`

문제:
- common/uncommon/rare 상자를 무작위로 고를 때 `tag=mcbr_chest_candidate` 필터가 빠지면 로비 마커, 스폰 마커 등 다른 marker가 상자 태그를 가져갈 수 있다.
- 이 경우 실제 필드 상자가 1개만 나오거나 등급별 활성화 수량이 꼬인다.

계획:
- common/uncommon/rare 배정용 모든 `@e[type=minecraft:marker,...]` 선택자에 `tag=mcbr_chest_candidate` 조건이 들어가 있는지 확인한다.
- `mcbr_chest_active`, `mcbr_chest_common`, `mcbr_chest_uncommon`, `mcbr_chest_rare` 태그 부여 대상이 후보지 마커로 제한되도록 수정한다.
- datapack1의 고정 후보지 방식은 유지한다.

검증:
- `/function mcbr:debug/refill_chests` 실행 후 활성화 마커 수가 인원수 공식과 일치하는지 확인한다.
- 로비/스폰/기타 시스템 마커에 상자 관련 태그가 붙지 않는지 확인한다.

---

### 2.3 상자 관련 태그 클린업 강화

#### [MODIFY] `battle_royale_datapack1/data/mcbr/functions/loot/assign_field_loot.mcfunction`
#### [검토] `battle_royale_datapack1/data/mcbr/functions/loot/clear_field_chests.mcfunction`
#### [검토] `battle_royale_datapack1/data/mcbr/functions/loot/refill_all.mcfunction`

문제:
- 이전 라운드나 `/reload`, 수동 리셋 이후 일부 marker에 상자 상태 태그가 남으면 다음 라운드의 상자 수량 계산과 배치가 꼬일 수 있다.

계획:
- 필드 상자 재배정 시작 시 월드 내 모든 marker에서 아래 태그를 일괄 제거한다.
  - `mcbr_chest_active`
  - `mcbr_chest_common`
  - `mcbr_chest_uncommon`
  - `mcbr_chest_rare`
- 이후 `mcbr_chest_candidate` 태그가 있는 후보지에만 등급/활성 태그를 다시 부여한다.
- `mcbr_chest_candidate`와 `mcbr_chest_center`는 영구 후보지 정보이므로 제거하지 않는다.

검증:
- 두 번째 라운드 시작 전후로 활성화 태그 수가 누적되지 않는지 확인한다.
- `/execute as @e[type=minecraft:marker,tag=mcbr_chest_active] run tellraw ...` 형태로 좌표를 출력해 활성화 대상이 필드 후보지인지 확인한다.

---

### 2.4 중복 마커 및 중복 상자 방지

#### [MODIFY] `battle_royale_datapack1/data/mcbr/functions/loot/place_field_chests.mcfunction`
#### [검토] `battle_royale_datapack1/data/mcbr/functions/loot/spawn_candidates_50.mcfunction`

문제:
- 고정 후보지 방식에서도 `/reload`, 수동 리필, 예외적인 재실행 과정에서 동일 좌표 상자나 marker 상태가 중복될 수 있다.
- 중복 상자는 루팅 꼬임, 바닥 드롭, 상자 수량 불일치로 이어진다.

계획:
- 상자를 놓기 전 해당 위치의 기존 chest를 제거하거나 정상적으로 덮어쓰는지 확인한다.
- 활성화 마커 기준으로 상자 1개만 생성되도록 `place_field_chests.mcfunction`의 선택자와 실행 순서를 점검한다.
- datapack2의 중복 마커 제거 로직 중 datapack1의 고정 후보지 구조에 맞는 부분만 반영한다.
- 고정 후보지 원본 marker를 실수로 삭제하지 않도록 반경 기반 kill 로직은 신중하게 적용한다.

검증:
- `/function mcbr:debug/refill_chests`를 여러 번 연속 실행해도 같은 좌표에 상자가 중복 생성되지 않는지 확인한다.
- 상자 재생성 중 기존 상자 아이템이 바닥에 쏟아지지 않는지 확인한다.

---

### 2.5 54종 총기 루팅 테이블 및 총기-탄약 페어링 안정화

#### [VERIFY] `battle_royale_datapack1/data/mcbr/loot_tables/chests/br_common.json`
#### [VERIFY] `battle_royale_datapack1/data/mcbr/loot_tables/chests/br_uncommon.json`
#### [VERIFY] `battle_royale_datapack1/data/mcbr/loot_tables/chests/br_rare.json`
#### [VERIFY] `battle_royale_datapack1/data/mcbr/loot_tables/chests/sets/*.json`

문제:
- 과거 문서에는 `minecraft:group` 기반 구조와 개별 sets 기반 구조가 함께 남아 있다.
- 실제 안정화 기준은 총기와 탄약을 확실히 함께 지급하는 개별 set loot table 구조다.

계획:
- datapack1의 실제 loot table이 54종 총기 세트 구조를 유지하는지 확인한다.
- 각 set 파일이 총기 pool과 탄약 pool을 분리해 항상 같이 실행되도록 되어 있는지 검사한다.
- P320, Taurus 943, Taurus 500, Kar98, Lone Trail 등 1.1.8 신규 총기의 탄약 매핑을 재확인한다.
- JSON 파싱 검증을 수행한다.

검증:
- 전체 `*.json` loot table을 JSON 파서로 검사한다.
- `/function mcbr:debug/refill_chests` 후 common/uncommon/rare 상자를 열어 총기와 대응 탄약이 함께 생성되는지 표본 검증한다.

---

## 3. 명시적으로 제외하는 항목

이번 datapack1 백포트에 아래 기능은 포함하지 않는다.

- datapack2의 동적 로비 생성
- 최초 접속자 기준 좌표 자동 초기화
- 아레나 중심 `(spawn_x + 1000, spawn_z + 1000)` 상대화
- 자동 지형 스캔 및 하방 레이캐스팅 후보지 생성
- 동적 forceload/상대 좌표 기반 backup/restore 전환
- 팀전, 에어드랍, 주기적 리필 타이머 등 datapack2 확장 기능

datapack1은 기존 고정 좌표 안정판으로 유지한다.

---

## 4. 작업 순서

1. datapack1과 datapack2의 대상 파일을 비교한다.
2. `spawn_p320.json` 탄약 매핑을 먼저 수정한다.
3. `assign_field_loot.mcfunction`의 태그 클린업과 후보지 필터를 반영한다.
4. `place_field_chests.mcfunction`의 중복 상자 방지 로직을 점검하고 필요한 최소 수정만 반영한다.
5. loot table JSON 전체를 파싱 검증한다.
6. datapack1 문서에 실제 반영 내역과 검증 결과를 완료 보고서로 추가한다.

---

## 5. 검증 계획

### 정적 검증
- datapack1 loot table JSON 전체 파싱
- `spawn_p320.json`의 탄약 ID가 `tacz:45acp`인지 확인
- `assign_field_loot.mcfunction`의 common/uncommon/rare 선택자에 `tag=mcbr_chest_candidate`가 포함되어 있는지 확인
- 상자 상태 태그 제거 대상이 모든 marker인지 확인

### 게임 내 수동 검증
- `/reload`
- `/function mcbr:debug/refill_chests`
- 활성화 상자 수량 확인
- common/uncommon/rare 상자 위치가 후보지 마커 위에만 생성되는지 확인
- P320 시작 상자에서 `.45 ACP` 탄약이 함께 지급되는지 확인
- 2회 이상 리필/라운드 반복 후 상자 중복, 바닥 드롭, 태그 누적이 없는지 확인

---

## 6. 완료 조건

아래 조건을 모두 만족하면 이번 백포트 작업을 완료로 본다.

1. datapack1의 P320 시작 상자가 `tacz:45acp` 탄약을 지급한다.
2. field chest 등급 배정이 `mcbr_chest_candidate` 마커에만 적용된다.
3. 모든 marker의 상자 상태 태그가 매 리필 시작 시 초기화된다.
4. 반복 리필해도 상자 중복 생성이나 바닥 드롭이 발생하지 않는다.
5. 54종 총기 loot table JSON이 모두 파싱된다.
6. 표본 상자에서 총기와 대응 탄약이 함께 생성된다.
