# [구현 계획서] 54종 전체 총기 등급별 랜덤 스폰 시스템 구현 계획

현재 28종만 스폰되던 마인크래프트 배틀로얄 데이터팩(`battle_royale_datapack1`)을 개정하여, **TaCZ 1.1.8-hotfix 모드에 등록된 54종의 모든 총기와 탄약이 등급별 상자에서 유기적이고 완벽하게 무작위 출현**하도록 설계된 대대적인 스폰 시스템 개선 계획서입니다.

---

## 1. 개편 핵심 아키텍처

기존의 개별 총기 스폰 방식은 16개 상자에 고정 총기를 매핑하므로 확장성이 없고 28종으로 제한되었습니다.
* **새로운 설계**: 모든 총기를 등급별(Common, Uncommon, Rare) 통합 전용 루트 테이블([br_common.json](file:///E:/Projects/Minecraft_Mods/battle_royale_datapack1/data/mcbr/loot_tables/chests/br_common.json) 등)로 단일화합니다.
* **총기와 맞는 탄약 동시 드롭 보장**: 마인크래프트의 `"type": "minecraft:group"` composite 형식을 사용하여, 상자가 열릴 때 선택된 총기와 **해당 총기에 정확하게 맞는 탄약 및 탄창 용량**이 한 쌍으로 함께 생성되도록 완벽히 보장합니다.

---

## 2. 54종 전체 총기 등급 분류 (Grading Map)

### 🟢 일반 상자 (Common - 총 20종)
비교적 가벼운 권총, 기관단총, 펌프액션 샷건류입니다.
* `aa12` (12g / 8발)
* `b93r` (9mm / 20발)
* `cz75` (9mm / 16발)
* `db_long` (12g / 2발)
* `db_short` (12g / 2발)
* `glock_17` (9mm / 17발)
* `hk_mk23` (45acp / 12발)
* `hk_mp5a5` (9mm / 30발)
* `m1014` (12g / 6발)
* `m1911` (45acp / 7발)
* `m4a1` (556x45 / 30발)
* `m870` (12g / 5발)
* `m9a4` (9mm / 17발)
* `p320` (45acp / 12발)
* `scar_l` (556x45 / 30발)
* `spas_12` (12g / 5발)
* `taurus943` (22wmr / 8발)
* `ump45` (45acp / 25발)
* `uzi` (9mm / 20발)
* `vector45` (45acp / 20발)

### 🔵 중급 상자 (Uncommon - 총 24종)
주력 자동소총, 경기관총, 표준 저격소총(DMR)류입니다.
* `ak47` (762x39 / 30발)
* `aug` (556x45 / 30발)
* `fn_evolys` (308 / 75발)
* `fn_fal` (308 / 20발)
* `g36k` (556x45 / 30발)
* `hk_g3` (308 / 20발)
* `hk416d` (556x45 / 30발)
* `kar98` (792x57 / 4발)
* `lonetrail` (30_06 / 1발)
* `m16a1` (556x45 / 20발)
* `m16a4` (556x45 / 30발)
* `m249` (556x45 / 75발)
* `m700` (30_06 / 5발)
* `m95` (50bmg / 5발)
* `mk14` (308 / 10발)
* `p90` (57x28 / 50발)
* `qbz_95` (58x42 / 30발)
* `qbz_191` (58x42 / 30발)
* `rhino357` (357mag / 6발)
* `rpk` (762x39 / 40발)
* `scar_h` (308 / 20발)
* `sks_tactical` (762x39 / 10발)
* `spr15hb` (556x45 / 15발)
* `springfield1873` (45_70 / 1발)

### 🔴 고급 상자 (Rare - 총 10종)
중화기 및 특수 고화력 Revolver류, 반자동 대물저격총입니다.
* `ai_awp` (338 / 5발)
* `deagle` (50ae / 7발)
* `deagle_golden` (357mag / 9발)
* `m107` (50bmg / 10발)
* `m320` (40mm / 1발)
* `minigun` (308 / 150발)
* `rpg7` (rpg_rocket / 1발)
* `taurus500` (500mag / 5발)
* `timeless50` (50ae / 8발)
* `type_81` (762x39 / 30발)

---

## 3. 파일 변경 제안 (Proposed Changes)

### [MODIFY] [assign_field_loot.mcfunction](file:///E:/Projects/Minecraft_Mods/battle_royale_datapack1/data/mcbr/functions/loot/assign_field_loot.mcfunction)
기존의 복잡하고 하드코딩된 개별 총기 분배 방식(149라인)을 제거하고, 마커 태그 단위로 다이렉트 루트 테이블을 할당하도록 극도로 단정하게 개편(약 50라인)합니다.

* **핵심 변경 코드 영역**:
```mcfunction
# 1. 기존 mcbr_common_pick1 ~ 16 중복 연산 및 20~50라인의 청소 태그 제거
# 2. 신규 스폰 로직을 3줄로 극도로 단순화 및 성능 최적화:
execute as @e[type=minecraft:marker,tag=mcbr_chest_common] at @s if block ~ ~ ~ minecraft:chest run data merge block ~ ~ ~ {LootTable:"mcbr:chests/br_common"}
execute as @e[type=minecraft:marker,tag=mcbr_chest_uncommon] at @s if block ~ ~ ~ minecraft:chest run data merge block ~ ~ ~ {LootTable:"mcbr:chests/br_uncommon"}
execute as @e[type=minecraft:marker,tag=mcbr_chest_rare] at @s if block ~ ~ ~ minecraft:chest run data merge block ~ ~ ~ {LootTable:"mcbr:chests/br_rare"}
```

---

## 4. 검증 계획 (Verification Plan)

### 자동 및 수동 검증 단계
1. **데이터팩 리로드 검사**:
   * 게임 내부에서 `/reload`를 입력하여 구문 분석(Parsing) 오류나 경로 바인딩 경고가 없는지 엄격히 점검합니다.
2. **랜덤 상자 드롭 확인**:
   * `/function mcbr:debug/refill_chests`를 실행해 필드 상자들에 54종의 모든 새로운 총기들과 1.1.8-hotfix 탄약(Taurus 943의 .22 WMR 등)이 등급에 맞게 올바르게 스폰되는지 확인합니다.
