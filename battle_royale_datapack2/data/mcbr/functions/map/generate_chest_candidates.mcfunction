# 상자 후보지 격자 스캔 시작
# 청크가 로드되어 있지 않으면 스캔이 정상 작동하지 않으므로 영역을 강제 로드합니다.

forceload add 880 880 1120 1120
scoreboard players set $candidate_count mcbr.tmp 0
tellraw @a [{"text":"[mcbr2] 청크를 로드하는 중입니다. 0.5초 후 스캔을 시작합니다...","color":"yellow"}]
schedule function mcbr:map/generate_chest_candidates_step2 10t replace

