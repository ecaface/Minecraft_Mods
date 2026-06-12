# battle_royale_datapack2 미구현 핵심 기능 고도화 구현 계획서

본 계획서는 마인크래프트 배틀로얄 프로젝트의 실험용 데이터팩인 `battle_royale_datapack2`를 실전 운용 가능한 수준으로 업그레이드하기 위해, 잔여 미구현 핵심 5대 기능(팀 모드, 에어드랍 시스템, 주기적 상자 리필, 지형 복구 좌표 동적화, 지형 예외 필터 고도화)을 단계별로 체계적으로 설계하고 구현하는 계획서입니다.

---

## User Review Required

> [!IMPORTANT]
> **지형 복구 좌표 동적화**를 활성화하려면 어드민이 새 맵을 세팅할 때 기준이 되는 '아레나 중심 좌표'와 '복구 범위(반경)'가 스코어보드 또는 NBT 저장소에 사전에 등록되어야 합니다. 복구 구역의 무결성을 위해, 백업 영역의 상대적 오프셋(예: 기존 월드 좌표에서 X축으로 +1000 블록 이동한 지점)을 연동하는 물리 법칙을 규격화할 예정입니다.

> [!WARNING]
> **팀 모드(Team Mode)** 활성화 시 기존의 개인전 사망 처리 및 단일 1인 승리 판정(`check_winner.mcfunction`) 로직이 팀 단위 생존 검사로 완전히 전환되므로, 하위 호환성을 유지할 수 있도록 `$team_mode` 조건 분기를 두어 병렬 작동하도록 설계합니다.

---

## Open Questions

> [!NOTE]
> 1. **에어드랍 낙하 메커니즘**: 에어드랍(보급) 스폰 시 단순히 하늘 높은 좌표에 보급 상자를 소환하여 중력으로 떨어뜨리는 물리 방식을 취할 것인가요, 아니면 낙하산(Chicken/ArmorStand 탑승 조합)을 이용해 천천히 하강하는 시각적인 연출 효과를 추가할 것인가요?
> 2. **주기적 상자 리필 규칙**: 경기 중 주기적으로 상자를 리필할 때, 기존에 플레이어가 루팅하여 비어 있는 상자만 리필할 것인가요, 아니면 기존 상자를 완전히 지우고 후보지 중 새로운 위치를 셔플링하여 재생성할 것인가요? (후자가 밸런스상 더 권장됩니다.)

---

## Proposed Changes

### 1. [Component] 팀 모드 (Team Mode) 지원
기존 개인전 중심의 게임 수명 주기 로직을 팀 모드로 확장합니다.

#### [NEW] [assign_teams.mcfunction](file:///e:/Projects/Minecraft_Mods/battle_royale_datapack2/data/mcbr/functions/player/assign_teams.mcfunction)
* 로비에서 준비 단계가 완료되었을 때 접속한 활성 인원을 무작위 또는 수동으로 Red/Blue/Green/Yellow 등 4개 팀(팀원 수 지정 가능)에 고르게 나누어 배정하는 로직을 작성합니다.

#### [MODIFY] [check_winner.mcfunction](file:///e:/Projects/Minecraft_Mods/battle_royale_datapack2/data/mcbr/functions/game/check_winner.mcfunction)
* `$team_mode mcbr.config`가 `1`인 경우, 개인 단위 생존자 카운트 대신 **살아남은 팀원들의 팀ID 목록**을 스캔하여 단 하나의 팀만 생존했을 때 해당 팀의 승리로 판정하는 로직을 추가합니다.

---

### 2. [Component] 에어드랍 (Airdrop) 보급 시스템
경기의 긴장감을 유도하고 중화기 획득 경로를 다양화하기 위한 정기 보급 메커니즘을 완성합니다.

#### [MODIFY] [fill_airdrop.mcfunction](file:///e:/Projects/Minecraft_Mods/battle_royale_datapack2/data/mcbr/functions/loot/fill_airdrop.mcfunction)
* 현재 비어 있는 주석 처리를 제거하고, 지정된 동적 또는 무작위 좌표에 붉은색 연막 파티클(Redstone dust particle)을 내뿜는 보급용 마커 엔티티(`mcbr_airdrop_marker`)를 생성한 뒤 빨간색 셜커 상자/체스트 블록을 소환하여 `mcbr:chests/br_airdrop` 루트 테이블을 인베디드하도록 구현합니다.

#### [NEW] [trigger_airdrop.mcfunction](file:///e:/Projects/Minecraft_Mods/battle_royale_datapack2/data/mcbr/functions/game/trigger_airdrop.mcfunction)
* 경기 진행 중 보더 축소 단계가 바뀔 때(예: Phase 1 -> Phase 2), 생존 구역 반경 내부의 무작위 2D 좌표를 선정하여 고도 `Y = 150` 위치에 보급 상자를 스폰하고 하강하도록 유도하는 트리거 로직을 구현합니다.

---

### 3. [Component] 경기 중 주기적 상자 리필 (Periodic Chest Refill)
경기 중 상자가 모두 루팅되어 무기가 부족해지는 중후반 단계의 밸런스를 개선합니다.

#### [NEW] [periodic_refill_timer.mcfunction](file:///e:/Projects/Minecraft_Mods/battle_royale_datapack2/data/mcbr/functions/game/periodic_refill_timer.mcfunction)
* 게임 시작 후 `$chest_refill_interval mcbr.config` 스코어 값이 초 단위(예: 180초 = 3분)로 설정된 경우, 매 초마다 타이머 스코어를 감소시키다가 `0`에 도달하면 신호 메시지를 출력하고 `/function mcbr:loot/refill_all`을 호출하여 후보지 기반 셔플 스폰을 재트리거합니다.

---

### 4. [Component] 신규 맵 대응 지형 복구 좌표 동적화
맵이 교체되거나 확장이 필요한 경우 기존 하드코딩 좌표에서 벗어나 자유롭게 아레나 복구가 구동되도록 개편합니다.

#### [MODIFY] [load_config_defaults.mcfunction](file:///e:/Projects/Minecraft_Mods/battle_royale_datapack2/data/mcbr/functions/load_config_defaults.mcfunction)
* 동적 아레나 설정을 위한 환경 변수 세트를 신규 추가합니다:
  ```mcfunction
  # 아레나 동적 복원용 중심점 및 영역 크기
  scoreboard players set $arena_center_x mcbr.config 1000
  scoreboard players set $arena_center_z mcbr.config 1000
  scoreboard players set $arena_half_width mcbr.config 144
  # 백업 아레나 상대적 오프셋 (X축 평행이동 거리)
  scoreboard players set $arena_backup_offset_x mcbr.config 992
  ```

#### [MODIFY] [backup_arena.mcfunction](file:///e:/Projects/Minecraft_Mods/battle_royale_datapack2/data/mcbr/functions/map/backup_arena.mcfunction) 및 [restore_arena.mcfunction](file:///e:/Projects/Minecraft_Mods/battle_royale_datapack2/data/mcbr/functions/map/restore_arena.mcfunction)
* 고정 좌표 `864`와 `1151` 등으로 복제하던 구조를 걷어냅니다.
* 중심점 스코어 값과 반경/두께 스코어를 수학적으로 연산하거나, 동적 클론을 위해 매 판 중심 좌표를 참조하여 유연한 백업 영역을 할당하도록 동적 4분할(Quadrants) 클론 엔진으로 개편합니다.

---

### 5. [Component] 지형 예외 필터 고도화 (Advanced Safety Filtering)
후보지 중 스폰 시 낙하 피해를 주거나 루팅이 불가능한 부적절한 지형을 한층 더 완벽하게 여과해 줍니다.

#### [MODIFY] [verify_terrain_safety.mcfunction](file:///e:/Projects/Minecraft_Mods/battle_royale_datapack2/data/mcbr/functions/map/verify_terrain_safety.mcfunction)
* **낭떠러지 필터**: 착지 지점의 동서남북 4방향을 스캔하여, 3칸 이상 아래가 허공으로 뚫려 있는 불안정한 절벽 끝 지형인 경우 안전 마크(`mcbr_candidate_safe`)를 부여하지 않고 즉시 배제하는 예외 차단 로직을 고도화합니다.

---

## Verification Plan

### Automated Tests
* **JSON 구문 검증**:
  * 추가될 루트 테이블 및 신규 파일들의 문법 정적 오류를 분석하기 위해 파이썬 파서 스크립트를 통한 밸리데이션 사전 수행.

### Manual Verification
1. **지형 복구 동적화 테스트**:
   * 스코어보드에서 `$arena_center_x`를 임의의 다른 좌표(예: `1500`)로 설정한 후, 백업과 복구가 지정한 오프셋에 따라 무너지지 않고 칼같이 1:1 매칭 복제되는지 확인합니다.
2. **에어드랍 트리거 검사**:
   * `/function mcbr:game/trigger_airdrop`을 수동 실행하여, 현재 생존 구역(월드 보더 반경 안쪽)에 정확히 무작위 배치되고 빨간색 연막 파티클이 방출되는지 확인합니다.
3. **팀 모드 테스트**:
   * `/scoreboard players set $team_mode mcbr.config 1`로 활성화한 후, 로비의 분배 레버를 작동하여 Red/Blue 팀 태그 및 고유 팀 컬러 색상이 전원에게 올바르게 설정되는지 확인합니다.
