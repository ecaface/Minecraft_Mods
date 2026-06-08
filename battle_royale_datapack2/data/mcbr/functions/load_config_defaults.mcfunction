# One-time config initialization. Do not overwrite persisted scoreboard config on every /reload.

# 게임 시작에 필요한 최소 접속 인원입니다.
scoreboard players set $min_players mcbr.config 1
# 한 판에 실제 참가할 수 있는 최대 인원입니다. 초과 인원은 로비에 남습니다.
scoreboard players set $max_players mcbr.config 4
# 경기 시작 전 카운트다운 시간(초)입니다.
scoreboard players set $countdown_seconds mcbr.config 3
# 카운트다운 시간을 틱 단위로 표현한 값입니다.
scoreboard players set $countdown_ticks_default mcbr.config 60
# 전투 시작 시 월드보더 초기 크기입니다.
scoreboard players set $initial_border mcbr.config 256
# 축소가 끝났을 때의 월드보더 최종 크기입니다.
scoreboard players set $final_border mcbr.config 32
# 월드보더가 줄어드는 총 시간(초)입니다.
scoreboard players set $shrink_seconds mcbr.config 420
# 필드 상자 리필 기능 전체를 켜거나 끄는 스위치입니다.
scoreboard players set $chest_refill_enabled mcbr.config 1
# 향후 경기 중 주기적 상자 리필용으로 남겨둔 값입니다.
scoreboard players set $chest_refill_interval mcbr.config 0
# 향후 팀 모드 지원용으로 남겨둔 스위치입니다.
scoreboard players set $team_mode mcbr.config 0
# 승리 판정 후 로비로 강제 복귀하기 전까지의 대기 시간(초)입니다.
scoreboard players set $end_delay_seconds mcbr.config 8
# 종료 대기 시간을 틱 단위로 표현한 값입니다.
scoreboard players set $end_ticks_default mcbr.config 160
# 라운드 준비 단계에서 맵 복원을 실행할지 결정하는 스위치입니다.
scoreboard players set $arena_restore_enabled mcbr.config 0

# Dynamic coordinates will be initialized in player/init_player -> admin/init_dynamic_coords.

# Spawn tuning defaults
# /spreadplayers 실행 시 플레이어 사이 최소 거리입니다.
scoreboard players set $spread_distance mcbr.config 32
# 전투 중심점에서 퍼질 수 있는 최대 반경입니다.
scoreboard players set $spread_range mcbr.config 96
scoreboard players set $arena_half_width mcbr.config 144
# 백업 아레나 상대적 오프셋 (X축 평행이동 거리)
scoreboard players set $arena_backup_offset_x mcbr.config 992

# 월드마다 기본 설정을 한 번만 넣기 위한 내부 표시값입니다.
scoreboard players set $config_initialized mcbr.tmp 1
