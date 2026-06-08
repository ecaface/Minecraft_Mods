# battle_royale_datapack1 버전 정보

- 버전: `0.2.66-dev`
- 업데이트 날짜: `2026-04-08`
- 대상 마인크래프트 버전: `1.20.1`
- 대상 TACZ 버전: `1.20.1`

## 이번 버전 핵심 변경
- `prepare_round`가 드롭 정리, 시작 상자 정리, 필드 상자 정리, 맵 복구, 상자 리필을 한 파이프라인으로 처리하도록 재정리됨
- `clear_arena_drops`가 초기 보더 전체 기준으로 동작하도록 확장됨
- `backup_arena`와 `restore_arena`가 전체 초기 전투 구역 기준 q1~q4 체인으로 정리됨
- `clear_field_chests`가 50개 필드 상자 후보지 전체를 기준으로 기존 상자를 제거하도록 정리됨
- 백업, 복구, 라운드 준비에 단계 진행 메시지 추가
- `admin`과 `debug` 역할 분리 유지
- `debug`에 단계별 검증 함수 추가

## 현재 기본 설정
- 최소 인원: `1`
- 최대 인원: `4`
- 카운트다운: `10초`
- 초기 보더 설정값: `256`
- 최종 보더 설정값: `32`
- 보더 축소 시간 설정값: `420초`
- 기본 최대 체력: `60`

## 현재 운영 절차
### 새 맵 최초 1회
```mcfunction
/reload
/function mcbr:admin/build_lobby
```

### 일반적인 라운드 시작
- 로비 레버로 시작

### 상태가 꼬였을 때
```mcfunction
/function mcbr:admin/reset_game
```

## 점검용 함수
상태 확인:
```mcfunction
/function mcbr:debug/status
```

기본 설정 다시 적용:
```mcfunction
/function mcbr:debug/apply_default_config
```

맵 복구 on/off:
```mcfunction
/function mcbr:debug/enable_arena_restore
/function mcbr:debug/disable_arena_restore
```

## 문서
- 구조 문서:
  - `(E:\Projects\Minecraft_Mods\battle_royale_datapack1\docs\Architecture.md)`
- 함수 인덱스:
  - `(E:\Projects\Minecraft_Mods\battle_royale_datapack1\docs\Function_Index.md)`
- loot table 인덱스:
  - `(E:\Projects\Minecraft_Mods\battle_royale_datapack1\docs\LootTable_Index.md)`
- 현재 작업 계획:
  - `(E:\Projects\Minecraft_Mods\battle_royale_datapack1\Task.md)`
