# [검증 및 작업 완료서] TACZ 1.1.8 교정 및 명세 업데이트 완료

구현 계획서 승인에 따라 워크스페이스 내 **TaCZ 1.1.8-hotfix 신규 총기 및 탄약 명세 병합 작업을 성공적으로 실행 완료**했습니다.

---

## 1. 완료된 작업 사항 (Workspace Updates)

### 🔫 1) 신규 총기 레지스트리 병합
* **수정 파일**: [TACZ_GUN_IDS.txt](file:///E:/Projects/Minecraft_Mods/ThirdParty/TACZ_GUN_IDS.txt)
* **내용**: 1.1.8-hotfix에 새롭게 추가된 **7가지 총기 ID**를 알파벳 순서에 맞게 정확히 삽입 및 정렬 완료했습니다.
  ```diff
  + tacz:hk_mk23
  + tacz:kar98
  + tacz:lonetrail
  + tacz:m9a4
  + tacz:rhino357
  + tacz:taurus500
  + tacz:taurus943
  ```

### 🍬 2) 신규 탄약 레지스트리 병합
* **수정 파일**: [TACZ_AMMO_IDS.txt](file:///E:/Projects/Minecraft_Mods/ThirdParty/TACZ_AMMO_IDS.txt)
* **내용**: 신규 탄약 규격인 **3가지 탄약 ID**를 매핑 테이블에 알파벳 순서대로 정합되도록 최종 갱신 완료했습니다.
  ```diff
  + tacz:22wmr
  + tacz:500mag
  + tacz:792x57
  ```

---

## 2. 사용자 권장 수동 진행 단계 (Action Required)

이식성 있는 명세 업데이트는 모두 끝났으므로, 실제 게임 화면에서의 깨짐 현상을 해결하기 위해 아래의 **실행 인스턴스 폴더 캐시 청소 가이드**를 최종 수행해 주시기 바랍니다.

1. **게임 완전 종료**
2. **`tacz` 캐시 디렉토리 완전히 물리적 삭제**
   * 경로: `%appdata%\.minecraft\tacz\` (또는 사용 중이신 Prism/CurseForge 인스턴스의 `tacz` 폴더 전체)
3. **게임 재실행** (TaCZ 1.1.8 모듈이 새롭고 결점 없는 1.1.8 버전 기본 총기팩 압축 해제 작업을 수행함)

---

## 3. 게임 내 최종 수동 검증 방법 (Verification)

캐시를 성공적으로 제거하고 재런칭하셨다면, 게임 내 맵에 진입하여 아래의 방법으로 기능이 올바르게 돌아가는지 최종 테스트해 보실 수 있습니다.

### 🧪 검증 테스트 시나리오
1. **수동 아이템 지급 검증**:
   * 게임 채팅창에 `/give @s tacz:modern_kinetic_gun{GunId:"tacz:glock_17"}`을 입력해 봅니다.
   * **기대 결과**: 인벤토리 및 손에 든 총기가 보라색/검은색 checkerboard 무늬 없이 깨끗하게 3D 모델로 렌더링되며 우클릭 ADS(조준) 및 장전이 정상 동작해야 합니다.
2. **배틀로얄 상자 리필 스폰 최종 점검**:
   * 치트가 허용된 데이터팩 맵에서 `/function mcbr:debug/refill_chests` 명령어를 실행합니다.
   * **기대 결과**: 정상 스폰된 필드 상자들을 열었을 때 깨진 아이템 없이 신규 1.1.8 총기들과 탄약들이 온전히 드롭되어 루팅이 가능해야 합니다.
