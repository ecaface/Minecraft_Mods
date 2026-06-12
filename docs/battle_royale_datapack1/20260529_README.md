# MK Battle Royale Datapack 1

마인크래프트 `1.20.1` + TACZ `1.20.1` 기준의 배틀로얄 데이터팩이다.

## 1. 목적
- 로비 대기
- 레버 시작
- 랜덤 스폰
- 보더 축소
- TACZ 총기 루팅
- 승리 판정
- 로비 복귀

## 2. 새 맵 최초 세팅
```mcfunction
/reload
/function mcbr:admin/build_lobby
```

`build_lobby`가 하는 일:
- 로비 생성
- 전투 구역 백업
- 즉시 리스폰 gamerule 설정
- `arena_restore_enabled` 활성화
- host 지정
- 실행자 로비 이동

## 3. 일반 사용 절차

### 같은 맵을 다시 열었을 때
```mcfunction
/reload
```

그다음:
- 로비 레버로 시작
- 상태가 꼬였으면 `/function mcbr:admin/reset_game`

## 4. 주요 운영 함수
```mcfunction
/function mcbr:admin/build_lobby
/function mcbr:admin/start_game
/function mcbr:admin/reset_game
```

## 5. 주요 debug 함수
```mcfunction
/function mcbr:debug/status
/function mcbr:debug/refill_chests
/function mcbr:debug/apply_default_config
/function mcbr:debug/enable_arena_restore
/function mcbr:debug/disable_arena_restore
/function mcbr:debug/enable_solo_debug
/function mcbr:debug/disable_solo_debug
/function mcbr:debug/force_end
```

## 6. 현재 게임 구조
- 로비 위치:
  - `0 100 0`
- 전투 중심:
  - `1000 1000`
- 초기 전투 구역 복구 범위:
  - `x 864..1151`
  - `y 60..127`
  - `z 864..1151`
- 백업 구역:
  - `x 1856..2143`
  - `y 60..127`
  - `z 1856..2143`

## 7. 상자 구조

### 필드 상자
- 50개 후보지 기반
- 인원 수에 따라 생성 개수 변경
- rare는 중앙 후보지 쪽에서만 배정

### 시작 상자
- 전투 시작 직후 플레이어 근처 생성
- 권총 1정
- 맞는 탄약
- 랜덤 방어구 세트

## 8. 라운드 준비 구조
`prepare_round`는 아래 순서로 동작한다.

1. 보더 전체 강제 로드
2. 드롭 아이템 정리
3. 시작 상자 정리
4. 필드 상자 정리
5. 맵 복구
6. 드롭 아이템 재정리
7. 필드 상자 리필
8. 강제 로드 해제

## 9. 보더 기본값
- 초기 보더 설정값: `256`
- 최종 보더 설정값: `32`
- 축소 시간 설정값: `420초`

주의:
- 현재 `start_border` 실제 적용값은 별도 함수에 하드코딩되어 있으므로, 설정값과 완전히 일치하는지는 점검이 필요하다.

## 10. 문서
- [구조 문서](Architecture.md)
- [함수 인덱스](Function_Index.md)
- [LootTable 인덱스](LootTable_Index.md)
- [현재 작업 계획](Task.md)
- [다음 작업](NEXT_STEPS.md)
