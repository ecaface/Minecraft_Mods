# Minecraft_Mods 작업 안내

## 목적
- 가족, 지인과 함께 할 수 있는 소규모 마인크래프트 배틀로얄을 만든다.
- 현재 우선순위는 데이터팩 기반 구현이다.
- Forge 모드는 이후 이전 또는 확장 경로로 유지한다.

## 현재 작업 우선순위
1. **[battle_royale_datapack1](../battle_royale_datapack1) (실전용)**: 실전 플레이 대기 중인 안정 버전. 라운드 재진행 시 맵 지형 복구, 드롭 정리 등 버그 안정화 및 실전 밸런스 조정 집중.
2. **[battle_royale_datapack2](../battle_royale_datapack2) (실험용)**: 새 맵 도입 시 상자 고정 좌표의 한계를 해결하기 위한 격자 기반 자동 상자 후보지 생성 및 셔플링 프로토타입 구현 공간.
3. 필요 시 [mcbr_forge_mod](../mcbr_forge_mod) 로직 이전

## 문서 규칙
### 전체 프로젝트
- [AGENT.md](./AGENT.md)
- [FEATURE_ROLE_SUMMARY.md](./FEATURE_ROLE_SUMMARY.md)

### battle_royale_datapack1 (실전 대기용 안정화 버전)
- **특징**: 50개 고정 좌표 후보지 기반 필드 상자 시스템 및 완성도 높은 게임 라이프사이클을 갖춘 운영 버전.
- 주요 문서 경로:
  - E:/Projects/Minecraft_Mods/battle_royale_datapack1/docs
  - [README.md](../battle_royale_datapack1/docs/README.md)
  - [VERSION.md](../battle_royale_datapack1/docs/VERSION.md)
  - [NEXT_STEPS.md](../battle_royale_datapack1/docs/NEXT_STEPS.md)

### battle_royale_datapack2 (새 맵용 랜덤 상자 실험 버전)
- **특징**: 새 맵 자동 대응을 위해 지형 안전 구역을 검사하여 상자 후보지를 자동 추출하고 배치하는 격자 후보지 시스템 전용 실험 버전.
- 주요 문서 경로:
  - E:/Projects/Minecraft_Mods/battle_royale_datapack2/docs
  - [README.md](../battle_royale_datapack2/docs/README.md)
  - [VERSION.md](../battle_royale_datapack2/docs/VERSION.md)
  - [NEXT_STEPS.md](../battle_royale_datapack2/docs/NEXT_STEPS.md)

### mcbr_forge_mod
- [README.md](../mcbr_forge_mod/docs/README.md)
- [NEXT_STEPS.md](../mcbr_forge_mod/docs/NEXT_STEPS.md)

### ThirdParty
- [tacz-1.20.1-1.1.8-hotfix](../ThirdParty/tacz-1.20.1-1.1.8-hotfix)

## 현재 기준 운영 원칙
- **데이터팩 사용 규칙**:
  - 일반 실전 플레이 및 밸런스 조정 시에는 `battle_royale_datapack1`을 적용하여 플레이합니다.
  - 신규 맵의 무작위 상자 스폰 실험 시에는 네임스페이스 충돌을 방지하기 위해 `battle_royale_datapack2`만 단독 적용합니다.
- 새 맵 최초 1회:
  - `/reload`
  - `/function mcbr:admin/build_lobby`
- 이후 일반 플레이:
  - `/reload`
  - 로비 레버로 시작
- 상태가 꼬였을 때만:
  - `/function mcbr:admin/reset_game`

## 현재 기준 진실 문서
- **실전 플레이 진실 문서 (datapack1)**:
  - 데이터팩 사용법과 운영 절차: [README.md](../battle_royale_datapack1/docs/README.md)
  - 함수 책임 구조: [FEATURE_ROLE_SUMMARY.md](./FEATURE_ROLE_SUMMARY.md)
  - 현재 버전과 안정 상태: [VERSION.md](../battle_royale_datapack1/docs/VERSION.md)
- **랜덤 후보지 실험 진실 문서 (datapack2)**:
  - 상자 후보지 시스템 설계: [DESIGN_RANDOM_CHEST_SYSTEM.md](../battle_royale_datapack2/docs/DESIGN_RANDOM_CHEST_SYSTEM.md)
  - 실험 진행도 및 계획: [NEXT_STEPS.md](../battle_royale_datapack2/docs/NEXT_STEPS.md)
