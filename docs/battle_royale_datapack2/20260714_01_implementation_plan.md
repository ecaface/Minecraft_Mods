# [구현 기록] datapack2 랜덤/시작상자 총기 중복 방지 및 승점 표시 개선

`battle_royale_datapack2`의 상자 총기 배정 방식을 개편하여, 한 라운드 안에서 랜덤상자와 시작상자에 같은 총이 중복 출현하지 않도록 수정했다. 또한 TaCZ 1.20.1 1.1.8-hotfix 기본 총팩 기준으로 누락되어 있던 4종을 출현 풀에 포함하고, 로비에서 참여자의 우승 점수를 확인할 수 있도록 승점 스코어보드를 추가했다.

---

## 1. 요구사항

1. 랜덤상자와 시작상자 사이에서도 총이 중복 출현하지 않게 한다.
2. TaCZ 기본 총팩에 존재하지만 상자에 쓰이지 않던 `tacz:b93r`, `tacz:hk_mk23`, `tacz:m9a4`, `tacz:taurus943`를 등급 풀에 포함한다.
3. 실제 랜덤/시작상자 출현 총은 `br_common`, `br_uncommon`, `br_rare` 등급 구분 없이 하나의 통합 풀에서 할당한다.
4. 권총류는 스페셜한 총 외에는 출현 풀에서 제외한다.
5. 로비에서 참여자의 우승 정보를 볼 수 있도록 승점 스코어를 기록하고 표시한다. 수동 `reset_game` 시에는 승점을 초기화한다.

---

## 2. 구현 방향

기존 방식은 랜덤상자에 `br_common`, `br_uncommon`, `br_rare` loot table을 그대로 넣었다. 이 방식은 각 상자가 열릴 때마다 독립적으로 총을 뽑기 때문에 같은 라운드 안에서 같은 총이 여러 상자에 나올 수 있었다.

개선 후에는 라운드 공용 무기 슬롯 50개를 사용한다.

* 랜덤상자와 시작상자는 모두 같은 `$weapon_rotation` 값을 사용한다.
* 상자 또는 플레이어가 무기 슬롯을 하나 받을 때마다 `$weapon_rotation`을 1 증가시킨다.
* 슬롯은 `0..49`에서 순환한다.
* 현재 최대 플레이어 기준으로 랜덤상자 최대 28개, 시작상자 최대 4개이므로 한 라운드 안에서는 50개 슬롯을 모두 소진하지 않아 중복이 발생하지 않는다.
* `br_common`, `br_uncommon`, `br_rare`는 등급 분류 및 기존 디버그/호환용 풀로 유지하되, 실제 필드/시작상자의 총 배정은 개별 `chests/sets/*` loot table 직접 적용으로 처리한다.

---

## 3. 통합 무기 풀

통합 풀은 총 50종이다. 일반 시작 권총류인 `tacz:glock_17`, `tacz:m1911`, `tacz:p320`, `tacz:cz75`는 제외했다. 스페셜/고화력 권총류인 `deagle`, `deagle_golden`, `rhino357`, `taurus500`, `timeless50`, `lonetrail`, `minigun`, `type_81` 등은 유지했다.

### Common 기반 슬롯

* `common_aa12`
* `common_b93r`
* `common_db_long`
* `common_db_short`
* `common_hk_mk23`
* `common_hk_mp5a5`
* `common_m1014`
* `common_m4a1`
* `common_m870`
* `common_m9a4`
* `common_scar_l`
* `common_spas_12`
* `common_taurus943`
* `common_ump45`
* `common_uzi`
* `common_vector45`

### Uncommon 기반 슬롯

* `uncommon_ak47`
* `uncommon_aug`
* `uncommon_fn_evolys`
* `uncommon_fn_fal`
* `uncommon_g36k`
* `uncommon_hk416d`
* `uncommon_hk_g3`
* `uncommon_kar98`
* `uncommon_lonetrail`
* `uncommon_m16a1`
* `uncommon_m16a4`
* `uncommon_m249`
* `uncommon_m700`
* `uncommon_m95`
* `uncommon_mk14`
* `uncommon_p90`
* `uncommon_qbz_191`
* `uncommon_qbz_95`
* `uncommon_rhino357`
* `uncommon_rpk`
* `uncommon_scar_h`
* `uncommon_sks_tactical`
* `uncommon_spr15hb`
* `uncommon_springfield1873`

### Rare 기반 슬롯

* `rare_ai_awp`
* `rare_deagle`
* `rare_deagle_golden`
* `rare_m107`
* `rare_m320`
* `rare_minigun`
* `rare_rpg7`
* `rare_taurus500`
* `rare_timeless50`
* `rare_type_81`

---

## 4. 변경 파일

### 신규 함수

* `battle_royale_datapack2/data/mcbr/functions/loot/clear_weapon_slot_tags.mcfunction`
  * 현재 엔티티에서 `mcbr_weapon_slot0..49` 태그를 제거한다.
* `battle_royale_datapack2/data/mcbr/functions/loot/assign_next_weapon_slot.mcfunction`
  * `$weapon_rotation` 값에 맞는 `mcbr_weapon_slot*` 태그를 부여한 뒤 rotation을 증가시킨다.
* `battle_royale_datapack2/data/mcbr/functions/loot/apply_weapon_slot_loot.mcfunction`
  * 엔티티의 `mcbr_weapon_slot*` 태그에 맞는 `mcbr:chests/sets/*` loot table을 현재 위치의 상자에 직접 적용한다.

### 수정 함수

* `functions/loot/assign_field_loot.mcfunction`
  * 활성 랜덤상자 마커마다 무기 슬롯을 배정한다.
  * 기존 `br_common`, `br_uncommon`, `br_rare` 직접 적용 대신 `apply_weapon_slot_loot`를 호출한다.
* `functions/game/assign_spawn_loadouts.mcfunction`
  * 기존 시작 권총 5종 회전 배정을 제거했다.
  * 플레이어마다 통합 무기 슬롯을 배정한다.
* `functions/loot/spawn_pistol_cache_fill_here.mcfunction`
  * 기존 `br_spawn_*` 적용 대신 `apply_weapon_slot_loot`를 호출한다.
* `functions/game/begin_match.mcfunction`
  * 시작상자 설명 주석을 권총 전용에서 일반 시작 무기 상자로 정리했다.
* `loot_tables/chests/br_common.json`
  * `common_b93r`, `common_hk_mk23`, `common_m9a4`, `common_taurus943`를 Common 등급 풀에 추가했다.

### 승점 표시 관련 수정

* `functions/load.mcfunction`
  * `mcbr.wins` objective를 추가했다.
* `functions/player/init_player.mcfunction`
  * 신규 플레이어의 `mcbr.wins` 값을 0으로 초기화한다.
* `functions/game/end_game.mcfunction`
  * 솔로 모드 승자는 `mcbr.wins` +1.
  * 팀 모드에서는 승리 팀의 생존 플레이어에게 `mcbr.wins` +1.
* `functions/state/waiting_tick.mcfunction`
  * 로비 대기 상태에서 sidebar에 `mcbr.wins`를 표시한다.
* `functions/admin/reset_game.mcfunction`
  * 수동 관리자 리셋 시 모든 플레이어의 `mcbr.wins`를 0으로 초기화한다.

---

## 5. 검증 결과

PowerShell 기준으로 다음 검증을 수행했다.

* 전체 `loot_tables/**/*.json` 파싱 성공.
* `function mcbr:*` 참조가 모두 실제 `.mcfunction` 파일로 해소됨을 확인.
* `mcbr:chests/*` loot table 참조가 모두 실제 JSON 파일로 해소됨을 확인.
* 통합 슬롯 풀 검증:
  * 슬롯 세트 수: 50
  * 고유 세트 수: 50
  * GunId 수: 50
  * 고유 GunId 수: 50
  * 신규 4종 포함 확인: `tacz:b93r`, `tacz:hk_mk23`, `tacz:m9a4`, `tacz:taurus943`
  * 일반 시작 권총 제외 확인: `tacz:glock_17`, `tacz:m1911`, `tacz:p320`, `tacz:cz75`
* `git diff --check` 공백 오류 없음.

인게임 `/reload` 및 실제 라운드 플레이 검증은 아직 수행하지 않았다.

---

## 6. 운영상 주의

* 자동 라운드 종료 후 로비로 복귀할 때는 승점이 유지되어 sidebar에 표시된다.
* `/function mcbr:admin/reset_game`을 수동 실행하면 승점이 0으로 초기화된다.
* 통합 슬롯은 50개이고 현재 datapack2 최대 매치 구성은 랜덤상자 최대 28개 + 시작상자 최대 4개라 중복 없이 충분하다. 향후 `$max_players`와 상자 수를 크게 늘려 한 라운드에서 50개를 초과하면 슬롯 순환 때문에 중복이 다시 발생할 수 있다.

---

## 7. 추가 반영: 로비 고도 상향

로비를 낮은 공중에 만들 때 위에서 물, 블록, 몬스터가 떨어지는 사례가 있어 datapack2의 동적 로비 생성 고도를 상향했다.

* `functions/admin/init_dynamic_coords.mcfunction`
  * `$lobby_y` 기본값을 `120`에서 `240`으로 변경했다.
  * 좌표 초기화만 수행하고 로비 플랫폼은 자동 생성하지 않도록 정리했다.
* `functions/admin/build_lobby.mcfunction`
  * 실행한 플레이어의 현재 X/Z 좌표를 기준으로 `$lobby_x`, `$lobby_z`, `$center_x`, `$center_z`를 다시 설정한 뒤 로비를 생성하도록 수정했다.
  * 주석을 고정 `0 100 0` 설명에서 config 기반 고고도 로비 설명으로 수정했다.
* `functions/admin/set_dynamic_coords.mcfunction`
  * 로비/전투 중심 좌표 계산을 재사용하기 위해 추가했다.
  * 로비는 실행자 X/Z와 `Y=240`, 전투 중심은 실행자 X/Z에서 각각 `+1000`으로 설정한다.
* `functions/player/init_player.mcfunction`
  * 새 월드 생성 직후 플레이어 최초 접속만으로 로비가 자동 생성되지 않도록 동적 좌표 초기화 호출을 제거했다.
  * 로비 생성과 전투 중심 좌표 설정은 `/function mcbr:admin/build_lobby` 실행 시에만 수행한다.
* `functions/admin/ensure_combat_center.mcfunction`
  * 게임 시작 직전에 전투 중심 좌표가 없거나 로비 좌표와 같으면 로비 X/Z 기준 `+1000` 위치로 보정한다.
  * 로비에서 그대로 경기가 시작되는 상태를 방지하기 위해 `functions/core/start_game.mcfunction`에서 먼저 호출한다.
* `functions/map/spread_players.mcfunction`
  * 전투 배치 범위를 `16..96`으로 완화해 새 월드 지형에서 `spreadplayers` 실패 가능성을 낮췄다.
  * 배치 후에도 로비 반경 32블록 안에 남은 참가자는 `functions/map/spread_self_fallback.mcfunction`으로 재배치한다.
* `functions/map/spread_self_fallback.mcfunction`
  * 로비에 남은 참가자만 전투 중심 기준으로 한 번 더 `spreadplayers`를 실행한다.
  * 그래도 로비에 남으면 slow falling을 부여하고 전투 중심 임시 마커로 이동시켜, 시작상자가 로비에 생기지 않게 방어한다.
* `functions/map/deploy_players_to_field.mcfunction`
  * `begin_match` 직전에 참가자를 전투 중심 임시 마커로 먼저 이동시킨 뒤 `spreadplayers`를 다시 실행한다.
  * countdown 단계의 전투 배치가 실패하더라도 시작상자가 로비가 아닌 전투 구역에 생성되도록 최종 방어선으로 추가했다.
* `functions/game/begin_match.mcfunction`
  * 시작상자 배치 전에 `mcbr:map/deploy_players_to_field`를 호출한다.
* `functions/player/join_during_match.mcfunction`
  * 중도 접속 관전자 임시 이동 높이를 `120`에서 `240`으로 맞췄다.
* `functions/map/reset_border.mcfunction`
  * 로비 위치 설명 주석을 고고도 로비 기준으로 정리했다.

이 변경은 기존 월드에서 이미 생성된 로비를 자동으로 옮기거나 새 월드에 자동 생성하지 않는다. 변경 후 `/reload` 및 `/function mcbr:admin/build_lobby`를 수동 실행해야 새 고도 로비가 생성된다.

---

## 8. 추가 반영: debug/status 빈 값 보정

`/function mcbr:debug/status` 실행 시 일부 월드에서 값이 빈칸으로 표시되는 문제가 있었다. 원인은 status가 fake-player score를 그대로 출력하는데, 해당 score가 아직 생성되지 않았거나 과거 초기화 흐름에서 누락된 경우 Minecraft score JSON component가 값을 비워서 보여주기 때문이다.

* `functions/debug/ensure_status_values.mcfunction`
  * status 출력에 필요한 score가 없을 때만 기본값을 보정하는 함수로 추가했다.
  * 기존 config 값을 덮어쓰지 않도록 `scoreboard players get`의 성공 여부를 `mcbr.debug`에 저장한 뒤, score가 없는 경우에만 기본값을 채운다.
  * `/reload` 시 함수 파싱 실패 가능성을 줄이기 위해 좌표 보정에서 음수 범위 `matches -30000000..30000000` 구문은 사용하지 않는다.
* `functions/debug/status.mcfunction`
  * 출력 시작 전에 `mcbr:debug/ensure_status_values`를 호출한다.
  * `$state`처럼 `$`가 붙은 내부 fake-player score를 직접 출력하지 않고 `mcbr_state` 같은 표시용 score로 복사한 뒤 출력한다.
  * 로비 좌표 `$lobby_x/$lobby_y/$lobby_z`와 전투 중심 `$center_x/$center_z`도 함께 출력한다.
* `functions/debug/copy_status_values.mcfunction`
  * 내부 runtime/config score를 `mcbr.debug` objective의 표시용 이름으로 복사하기 위해 추가했다.
* `functions/admin/ensure_runtime_values.mcfunction`
  * 게임 시작 전에 필수 runtime/config 값이 없으면 기본값을 채우기 위해 추가했다.
* `functions/core/start_game.mcfunction`
  * 시작 루틴 진입 시 `mcbr:admin/ensure_runtime_values`를 먼저 호출한다.
* `functions/load.mcfunction`
  * `/reload` 시 datapack load 메시지가 다시 안정적으로 출력되도록 `mcbr.wins` objective 추가 명령에서 표시 이름 인자를 제거했다.

이 변경 후 오래된 월드나 초기화가 어긋난 월드에서도 `debug/status`가 빈 값 대신 기본 상태값을 표시한다.
