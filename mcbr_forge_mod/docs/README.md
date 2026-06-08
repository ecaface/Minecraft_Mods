# mcbr_forge_mod

이 프로젝트는 Forge `1.20.1` 기반의 배틀로얄 서버 모드 뼈대입니다.
현재 주력 런타임은 데이터팩이며, 이 모드는 이후 로직 이전 또는 확장 경로로 유지합니다.

## 현재 위치
- 초기 규칙 검증은 데이터팩으로 먼저 진행
- Forge 모드는 이후 서버 모드화가 필요할 때 사용
- CurseForge 환경을 기준으로 관리

## 현재 포함된 내용
- Forge `1.20.1` Gradle 프로젝트 구조
- 서버 전용 경기 상태 머신 뼈대
- `/mcbr start`, `/mcbr reset`, `/mcbr status` 명령
- 카운트다운 -> 경기 시작 -> 사망 탈락 -> 승자 판정 -> 리셋 흐름
- Forge config 기반 기본 설정
- 상자 최초 오픈 시 서버가 즉석으로 채우는 루팅 시스템
- TACZ 총기 / 탄약 아이템 구조 반영

## 현재 주의할 점
- 빌드 산출물은 만들 수 있지만, 실제 서버 기준 실전 검증은 아직 부족함
- 데이터팩 버전이 우선이므로, 규칙 변경은 데이터팩에서 먼저 검증 후 모드로 옮기는 것이 안전함

## 권장 다음 단계
1. IDE에서 프로젝트 열기
2. Forge / TACZ 버전 정합성 확인
3. `BrModConfig`, `BrMatchManager` 기본값 재점검
4. `BrLootService` 밸런스 점검
5. 2인 테스트부터 시작
6. 이후 좌표 기반 상자 / 에어드랍 / 팀전 확장 검토

## 관련 문서
- 남은 작업:
  - [NEXT_STEPS.md](/E:/Projects/Minecraft_Mods/mcbr_forge_mod/NEXT_STEPS.md)
