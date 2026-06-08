# 상자 후보지 격자 스캔 (Step 2: 스캔 및 마커 소환)
tellraw @a [{"text":"[mcbr2] 스캔 2단계 진입 완료. 스캔을 시도합니다...","color":"aqua"}]
function mcbr:map/spawn_candidate_grid_candidates
execute as @e[type=minecraft:marker,tag=mcbr_candidate_probe] at @s run function mcbr:map/raycast_downward
function mcbr:map/generate_chest_candidates_complete
