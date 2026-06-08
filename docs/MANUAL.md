# 🎮 마인크래프트 배틀로얄 (MCBR) 운영 & 개발 메뉴얼

본 메뉴얼은 마인크래프트 배틀로얄 데이터팩 프로젝트의 **클라이언트 환경 설치, 라운드 실행 및 운영, 디버깅 명령어, 환경 변수 설정**에 이르기까지 모든 운영 절차와 기술 명세를 집대성한 통합 가이드북입니다.

---

## 💾 1. 게임 설치 및 클라이언트 환경 설정

성공적인 게임 작동과 TaCZ 1.1.8-hotfix 신규 총기들의 리소스 깨짐 현상(Checkerboard 무늬)을 완벽하게 해결하기 위한 클라이언트 세팅 가이드입니다.

### 🔫 1) TaCZ 모드 및 리소스팩 준비
* **마인크래프트 버전**: `1.20.1` (Forge / NeoForge / Fabric 호환)
* **모드 버전**: `tacz-1.20.1-1.1.8-hotfix.jar`
* **필수 리소스팩**: 모드 다운로드 시 내장된 기본 총기 리소스팩이 정상 적용되어 있는지 확인합니다.

### 🧹 2) [중요] 1.1.8 신규 총기 캐시 청소 (Malfunction Fix)
이전 버전(1.1.7) 캐시 파일로 인해 신규 총기들(Mk23, Kar98 등)의 텍스처나 모델링이 깨져 보일 수 있습니다. 게임 실행 전 다음 캐시 폴더를 물리적으로 삭제해 주시기 바랍니다.

1. **마인크래프트 게임을 완전히 종료**합니다.
2. 실행 단축키 `Win + R`을 누르고 `%appdata%\.minecraft\`를 입력해 진입합니다.
   * *Prism Launcher 또는 CurseForge를 사용하는 경우, 해당 인스턴스의 마인크래프트 실행 폴더로 이동합니다.*
3. 폴더 내부에 위치한 **`tacz` 폴더 전체를 물리적 삭제**합니다.
4. 게임을 재실행하면 모드가 1.1.8 버전의 온전하고 결점 없는 기본 총기팩 캐시를 자동으로 압축 해제 및 갱신합니다.

### 📦 3) 데이터팩(Datapack) 적용 규칙
* **실전용 (`battle_royale_datapack1`)**: 고정형 50개 검증 지형 상자를 활용한 완전무결 매치 라이프사이클 운영 버전.
* **실험용 (`battle_royale_datapack2`)**: 지형 자동 감지 레이캐스팅 격자 생성 스캐너 전용 프로토타입 버전.
* > [!WARNING]
  > 두 데이터팩은 동일한 `mcbr:` 네임스페이스를 공유하므로 **하나의 마인크래프트 세이브 월드에는 반드시 둘 중 하나만 탑재**해 작동시켜야 네임스페이스 충돌을 방지할 수 있습니다.

---

## 🗺️ 2. 새 맵에서 배틀로얄 세션 구성 방법 (Setting Up a New Map)

새로운 월드나 아레나 맵을 준비하여 배틀로얄 게임을 최초로 개설하고 운영하고자 할 때의 단계별 절차입니다.

### 📍 1단계: 경기 중심 좌표(Center) 결정 및 맵 선정
1. 마인크래프트 야생 월드 혹은 제작된 아레나 맵을 서버/클라이언트에 생성합니다.
2. 경기의 핵심 전장이자 중심부가 될 좌표를 결정합니다.
   * *기본 시스템은 `X = 1000, Z = 1000` 근처를 기준 중심 좌표로 삼고 작동하도록 세팅되어 있습니다.*

### 📂 2단계: 데이터팩(Datapack) 탑재
1. 사용할 세이브 월드 폴더의 `datapacks` 경로로 진입합니다.
2. 실전 고정 마커식 플레이를 원하면 `battle_royale_datapack1`을, 격자식 실시간 지형 스캔 플레이를 원하면 `battle_royale_datapack2` 폴더를 집어넣습니다.
3. 게임 내에서 `/reload`를 입력해 데이터팩 파일들을 완전히 로드합니다.

### 🏛️ 3단계: 로비 생성 및 지형 원본 백업
1. 관리자 권한을 가진 상태에서 서버 혹은 월드 채팅창에 아래 명령어를 실행합니다. (어느 위치에서든 실행 가능합니다.)
   ```mcfunction
   /function mcbr:admin/build_lobby
   ```
2. **결과**:
   * 월드의 고정 좌표인 **`X=0, Y=100, Z=0` 위치의 상공**에 유리 대기실(로비 플랫폼)과 호스트용 게임 시작 레버가 즉시 자동 건설되며, 실행자는 로비 한가운데로 자동 텔레포트됩니다.
   * 전투가 치러질 실제 아레나 전장 구역(`X=1000, Z=1000` 중심 범위)의 지형 블록 정보가 백업 버퍼 디렉토리로 **자동 1회 백업**됩니다. (이후 매치 종료 및 재생성 시 이 원본 지형으로 자동 복원됩니다.)

### 📦 4단계: 아레나 상자 스폰 후보지 생성
* > [!IMPORTANT]
  > 적용한 데이터팩 종류에 따라 상자 후보지 세팅 방식이 완전히 다릅니다.

#### A. `battle_royale_datapack1` (실전용 고정 좌표 방식)을 사용할 경우:
아레나 필드 내에서 상자가 스폰되길 원하는 50개의 위치를 직접 선점한 후, 그 자리에 서서 다음 소환 명령어를 실행해 마커들을 **수동 배치**해야 합니다.
* **일반 스폰 마커 소환**: `/summon minecraft:marker ~ ~ ~ {Tags:["mcbr_chest_candidate"]}`
* **중앙 Rare 스폰 마커 소환** (반경 32블록 내): `/summon minecraft:marker ~ ~ ~ {Tags:["mcbr_chest_candidate", "mcbr_chest_center"]}`
* *전체 50개 마커가 골고루 깔렸다면, 매 판 마커가 자동으로 리필 상자로 전환됩니다.*

#### B. `battle_royale_datapack2` (실험용 지형 적응형 자동 방식 - 권장)을 사용할 경우:
일일이 50개의 마커 좌표를 찾으러 다닐 필요가 없습니다. 로비 플랫폼에서 다음 명령어 한 번만 실행하면 스캐너가 알아서 산꼭대기, 동굴 입구, 자갈밭 등 안전한 solid 바닥을 감지하여 121개의 영구 마커를 1초 만에 **자동 안착**시킵니다.
```mcfunction
/function mcbr:admin/generate_random_candidates
```
* *물속, 용암 한가운데, 높은 나무 나뭇잎 위 등 비정상 지형은 스캐너의 안전성 필터가 자동으로 기각하므로 즉시 실전 플레이가 가능합니다.*

### 🔔 5단계: 친구 초대 및 매치 시작
1. 로비 유리 대기실 위의 시작 레버를 우클릭으로 당겨서 경기를 개막합니다!
2. 라운드 종료 후에는 시스템이 자동으로 지형을 원본으로 복원해주고 상자들을 알아서 재배치해주므로 지속적인 연전이 가능합니다.

---

## 🚀 3. 게임 실행 및 운영 명령어 (Gameplay Loop)

일반적인 매치 플레이 진행 및 비상 복구에 사용되는 명령어 일람입니다.

### 🕹️ 1) 최초 월드 셋업 (최초 1회 필수)
새로운 맵을 월드에 적용한 뒤, 데이터팩 시스템과 대기용 로비 플랫폼을 최초로 구성하기 위해 실행하는 명령어 세트입니다.
```mcfunction
/reload
/function mcbr:admin/build_lobby
```
* **동작**:
  * `/reload`: 데이터팩의 함수 파일들을 로드하고 config 기본값 세팅.
  * `build_lobby`: 맵 복원용 기준 버퍼 구역을 자동 백업하고, 하늘 위에 안전하게 대기할 수 있는 로비 유리 플랫폼을 생성하며, 실행한 유저에게 `mcbr_host` 태그를 위임합니다.

### 🏁 2) 경기 시작 (Start Game)
경기 준비가 완료되면 대기실에 배치된 **로비 레버**를 우클릭하여 작동시키거나, 아래의 호스트/관리자 전용 명령어로 매치를 강제 시작할 수 있습니다.
```mcfunction
/function mcbr:admin/start_game
```
* **진행 흐름**: 
  * 경기 시작 시점 플레이어 인원수 비례 상자 스폰 ➡️ 플레이어 카운트다운 시작 ➡️ 개별 무작위 권총 보급 상자 지급 ➡️ 경기 본격 개막.

### 🚨 3) 매치 강제 중단 및 초기화 (Emergency Reset)
경기가 꼬였거나 중도 포기하고 전원 로비 대기소로 강제 귀환시키고자 할 때 사용하는 절대적 강제 리셋 명령어입니다.
```mcfunction
/function mcbr:admin/reset_game
```
* **동작**: 월드 보더(장벽) 크기를 최초 설정값으로 급속 팽창, 대기소 추락사 방지 조치 작동, 낙하 중인 보급품 정리, 모든 플레이어 생존 상태 해제 및 관전자 모드 복구 후 로비 텔레포트 일괄 진행.

---

## 🛠️ 4. 디버그 및 관리자 명령어 (Debug Tools)

지형 격자 스캐너 관리, 상자 수동 생성, 시스템의 세부 테스트를 위한 개발용 디버깅 명령어 일람입니다.

### 📦 1) 필드 상자 수동 리필 (Force Chest Refill)
경기 중 혹은 테스트를 위해 월드 전역에 흩어져 있는 루팅 상자들을 즉각적인 등급비에 맞춰 강제로 재생성하고 54종 전체 무작위 총기류와 NBT 탄약 번들을 채워 넣는 명령어입니다.
```mcfunction
/function mcbr:debug/refill_chests
```

### 🌍 2) 맵 지형 자동 복구 기능 ON / OFF
매 판 플레이어가 설치하거나 파괴한 나무, 흙, 폭발 블록 등의 복구 기능을 토글할 수 있습니다.
* **지형 복구 활성화 (기본 권장)**:
  ```mcfunction
  /function mcbr:debug/enable_arena_restore
  ```
* **지형 복구 비활성화**:
  ```mcfunction
  /function mcbr:debug/disable_arena_restore
  ```

### 👤 3) 1인 테스트 전용 모드 (Solo Play Debug)
배틀로얄 시스템은 기본적으로 최소 2인 이상의 플레이어가 모여야만 시작되도록 설계되어 있습니다. 혼자서 테스트하거나 연습하고자 할 때 아래 명령어로 인원 검사를 우회할 수 있습니다.
* **1인 테스트 모드 활성화 (인원 제한 해제)**:
  ```mcfunction
  /function mcbr:admin/enable_solo_debug
  ```
* **1인 테스트 모드 비활성화 (기본 멀티 규칙 복구)**:
  ```mcfunction
  /function mcbr:admin/disable_solo_debug
  ```

### 📡 4) 지형 적응형 자동 스캔 스포너 관리 (datapack2 전용)
실험용 데이터팩 2번에서 새로운 지형 적응형 격자 생성 스캐너를 수동으로 구동하고 제어하는 어드민 기능입니다.
* **지형 자동 레이캐스팅 스캔 점화**:
  ```mcfunction
  /function mcbr:admin/generate_random_candidates
  ```
  * *하늘(Y=200)에 121개 프롭을 소환한 뒤, 물/용암/나뭇잎/공중 지형을 통과해 안전 바닥까지 Synchronous하게 자동 낙하 검사 후 안착시킵니다.*
* **스캔된 상자 위치 실시간 미리보기 시각화**:
  ```mcfunction
  /function mcbr:admin/preview_random_candidates
  ```
* **시각화 미리보기 입자 지우기**:
  ```mcfunction
  /function mcbr:admin/clear_random_candidate_preview
  ```
* **스캔된 모든 지형 마커 완전히 철거 (초기화)**:
  ```mcfunction
  /function mcbr:admin/clear_random_candidates
  ```
* **현재 스캔된 최종 후보지 개수 및 정보 확인**:
  ```mcfunction
  /function mcbr:admin/candidate_status
  ```

---

## ⚙️ 5. 시스템 환경 설정 (Config Details)

시스템 상태를 직접 모니터링하고 인 게임에서 스코어보드를 통해 실시간 룰을 변경하는 고급 가이드입니다.

### 📊 1) 현재 시스템 구성 세부 정보 모니터링
호스트 정보, 로비 설정, 카운트다운 시간, 보더 수치, 복구 활성화 상태 등 데이터팩의 실시간 심장박동 상태를 화면에 요약 출력합니다.
```mcfunction
/function mcbr:debug/status
```

### 🔄 2) 기본 세팅 값 일괄 재설정
만약 시스템 변수 설정이 꼬였다면 아래 명령어로 데이터팩에 코딩된 기본 최적 설정값으로 안전하게 덮어쓸 수 있습니다.
```mcfunction
/function mcbr:debug/apply_default_config
```

### 🎛️ 3) 주요 인게임 스코어보드 설정 목록 (Scoreboard Values)
다음 명령어 형식으로 인 게임에서 매치 규칙과 밸런스를 즉석 변경할 수 있습니다.
* *변경 예시: 시작 카운트다운을 15초로 설정할 때 ➡️ `/scoreboard players set $countdown_seconds mcbr.config 15`*

| 설정 대상 변수 | 보드 네임스페이스 | 기본 설정값 | 설명 |
| :--- | :--- | :---: | :--- |
| **`$countdown_seconds`** | `mcbr.config` | `10` | 매치 본격 개막 전 대기 상태 카운트다운 (초) |
| **`$min_players`** | `mcbr.config` | `2` | 경기를 합법적으로 개시 가능한 최소 참여자 (spectator 제외) |
| **`$max_players`** | `mcbr.config` | `4` | 참가자로 선정될 수 있는 최대 경기 정원 수 |
| **`$chest_refill_enabled`**| `mcbr.config` | `1` | 경기 리셋 및 매치 재작동 시 상자 자동 리필 작동 여부 (0: OFF, 1: ON) |
| **`$arena_restore_enabled`**| `mcbr.config` | `0` | 라운드 시작 전 파괴된 지형 백업본 자동 복원 여부 (0: OFF, 1: ON) |
| **`$initial_border`** | `mcbr.config` | `256` | 전투 시작 시 월드보더의 최초 가로세로 직경 크기 (블록 단위) |
| **`$shrink_seconds`** | `mcbr.config` | `420` | 월드보더가 최종 크기로 줄어드는 데 걸리는 총 시간 (초) |
| **`$final_border`** | `mcbr.config` | `32` | 보더 장벽이 완전히 줄어들었을 때의 최종 안전 구역 크기 (블록 단위) |
| **`$end_delay_seconds`** | `mcbr.config` | `8` | 경기 종료(승리 판정) 후 로비로 강제 복귀하기까지 대기 시간 (초) |
| **`$spread_distance`** | `mcbr.config` | `32` | 경기 개막 전 플레이어들 간의 보급 스폰 시 최소 스페이싱 거리 (블록 단위) |
| **`$spread_range`** | `mcbr.config` | `96` | 전투 중심점으로부터 플레이어들이 분산 소환되는 최대 반경 (블록 단위) |
| **`$lobby_x`** | `mcbr.config` | `0` | 대기용 로비 플랫폼 생성 기준 중심 X 좌표 |
| **`$lobby_y`** | `mcbr.config` | `100` | 대기용 로비 플랫폼 생성 기준 중심 Y 좌표 (고도) |
| **`$lobby_z`** | `mcbr.config` | `0` | 대기용 로비 플랫폼 생성 기준 중심 Z 좌표 |

---

### 🎛️ 4) 실시간 반영 여부 및 마인크래프트 엔진 제약 (중요)

마인크래프트 1.20.1 바닐라 엔진의 기술적 한계로 인해 스코어보드 값 변경이 **즉시 반영되는 설정**과, **코드 파일(.mcfunction)의 상수를 직접 변경해야 하는 설정**이 나뉩니다.

#### 🟢 인게임에서 스코어보드 변경 시 즉시 반영되는 변수
아래 변수들은 대기소 레버 작동 및 리셋 진행 시, 내부 시스템이 스코어보드 점수를 실시간으로 읽어서 매회 평가하므로 즉시 반영됩니다.
* **`$countdown_seconds`**: 카운트다운 시간 (게임 준비 단계에서 자동으로 틱으로 환산해 동적 반영)
* **`$min_players` / `$max_players`**: 최소 및 최대 인원수 규칙
* **`$chest_refill_enabled`**: 상자 리필 여부
* **`$arena_restore_enabled`**: 지형 복원 활성화 여부
* **`$end_delay_seconds`**: 승리 판정 후 대기 시간

#### 🔴 마인크래프트 엔진 한계로 직접 코드 파일을 수정해야 하는 변수
마인크래프트의 몇몇 명령어(`/worldborder`, `/spreadplayers`, `/fill` 등)는 변수나 스코어보드 값을 인자로 받아 동적으로 작동할 수 없게 설계되어 있습니다. 따라서 아래 기능들은 스코어보드 기본값 외에 **실제 해당 파일 내부의 명령어 속 숫자를 수정**하셔야 작동에 반영됩니다.

##### 1. 월드보더(자기장) 범위 및 시간
* **스코어보드 변수**: `$initial_border`, `$final_border`, `$shrink_seconds`
* **실제 수정해야 할 코드 파일**:
  * [start_border.mcfunction](file:///E:/Projects/Minecraft_Mods/battle_royale_datapack1/data/mcbr/functions/map/start_border.mcfunction) (datapack1 및 datapack2 동일)
* **수정 위치 및 기본 코드 예시**:
  ```mcfunction
  worldborder center 1000 1000  # 경기 중심 좌표
  worldborder set 280 0         # 시작 크기 (280블록)
  worldborder set 40 360        # 최종 크기 (40블록)까지 360초(6분) 동안 축소
  ```

##### 2. 플레이어 스폰 분산 범위
* **스코어보드 변수**: `$spread_distance`, `$spread_range`
* **실제 수정해야 할 코드 파일**:
  * [spread_players.mcfunction](file:///E:/Projects/Minecraft_Mods/battle_royale_datapack1/data/mcbr/functions/map/spread_players.mcfunction) (datapack1 및 datapack2 동일)
* **수정 위치 및 기본 코드 예시**:
  ```mcfunction
  # 중심좌표(1000, 1000), 최소 거리 40블록, 최대 반경 140블록 설정
  spreadplayers 1000 1000 40 140 false @a[tag=mcbr_playing]
  ```

##### 3. 로비 플랫폼 및 전투 구역 중심 좌표
* **스코어보드 변수**: `$lobby_x`, `$lobby_y`, `$lobby_z` / `$center_x`, `$center_z`
* **동작 제약**: 로비 상공 생성 좌표(`0 100 0`) 및 전투 구역 중심좌표(`1000 1000`) 역시 블록 생성 및 이동 관련 명령어들의 특성상 코드 내부에 고정 좌표로 기술되어 있습니다.

---

## 🎁 6. 부록: 아이템 & 총기 등급 분류 명세 (Loot Specification)

게임 밸런스와 아이템 희소성을 유지하기 위해 데이터팩 내부의 모든 총기류는 체계적인 등급 풀(Common, Uncommon, Rare)로 분배되어 자동 드롭됩니다. 

> [!NOTE]
> 매치 개막 시 모든 플레이어는 **시작상자(기본 권총)**를 1정씩 무작위 지급받으므로, 필드의 파밍 재미를 위해 **필드 상자(Common 등급)에서는 모든 권총류가 완전히 제외**되었습니다.

### 🔫 1) 시작상자 (Starter Chest) 구성 무기
게임 진입 시 스폰 장소에 고정 배치되는 초반 호신 및 전투용 기본 무기 세트입니다.
* **등장 대상 총기 (5종 중 무작위 1개 세트)**:
  * `Glock 17` (일반)
  * `M1911` (일반)
  * `P320` (일반)
  * `CZ75` (일반)
  * `Desert Eagle` (전설급 보너스 권총)
* **스폰 보장**: 완충된 해당 권총 1정과 전용 탄약 NBT 번들이 100% 같이 생성됩니다.

---

### 📦 2) 랜덤상자 (Field Chest) 총기 등급 분류 (총 46종)
*필드 전역의 일반/중앙 상자에서 획득할 수 있는 메인 주력 무기 목록입니다.*

#### 🟢 Common (일반 등급 - 12종)
*초반 교전에 매우 적합하며 권총류가 배제된 탄탄한 기본 무기군입니다.*
* **AR (돌격소총)**: `M4A1`, `SCAR-L`
* **SMG (기관단총)**: `HK MP5A5`, `UMP45`, `UZI`, `Vector .45`
* **SG (샷건)**: `M1014`, `M870`, `SPAS-12`, `AA-12`, `Double Barrel (Long)`, `Double Barrel (Short)`

#### 🔵 Uncommon (희귀 등급 - 24종)
*전장의 주력 화력이 되는 고티어 소총, 돌격소총 및 다양한 저격소총과 기관총군입니다.*
* **AR (돌격소총)**: `AK47`, `AUG`, `G36K`, `HK416D`, `M16A1`, `M16A4`, `QBZ-95`, `QBZ-191`, `SCAR-H`
* **DMR/BR (지정사수/전투소총)**: `FN FAL`, `HK G3`, `Mk14 EBR`, `SKS Tactical`
* **SR (저격소총)**:
  * 🔭 **Retro 2x 스코프 장착**: `Kar98k`, `Springfield 1873`
  * 🔭 **Vudu 스코프 장착**: `Remington M700`, `SPR15 HB`, `Barrett M95`, `Lone Trail`
* **LMG (경기관총)**: `FN Evolys`, `M249`, `RPK`
* **기타 고티어**: `FN P90` (SMG), `Rhino .357` (리볼버)

#### 🔴 Rare (전설/특수 등급 - 10종)
*아레나 중앙의 Rare 상자(Center 후보지) 및 특수 보급에서 극소수만 획득할 수 있는 최강의 화기들입니다.*
* **SR (대물/고티어 저격소총 - 🔭 8x 스코프 기본 장착)**: `AI AWP`, `Barrett M107`
* **Heavy (중화기 / 폭발성)**: `Minigun` (미니건 - 기본 150발들이), `RPG-7`, `M320` (유탄발사기)
* **Pistol (고위력 권총/리볼버)**: `Desert Eagle`, `Desert Eagle Golden` (골드 데글), `Taurus .500`, `Timeless .50`
* **AR 최고존엄**: `Type 81` (81식 소총)
