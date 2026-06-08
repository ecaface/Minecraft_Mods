# 상자 후보지 격자 스캔 시작
# 청크가 로드되어 있지 않으면 스캔이 정상 작동하지 않으므로 영역을 강제 로드합니다.

# 0. Clean up existing scan markers to prevent duplicates on rescanning
kill @e[type=minecraft:marker,tag=mcbr_chest_candidate]
kill @e[type=minecraft:marker,tag=mcbr_chest_center]

# 1. Create the center marker so we can use it for relative forceloading and grid spawning
execute positioned 0 60 0 run summon minecraft:marker ~ ~ ~ {Tags:["mcbr_center_marker"]}
execute store result entity @e[type=minecraft:marker,tag=mcbr_center_marker,limit=1] Pos[0] double 1 run scoreboard players get $arena_center_x mcbr.config
execute store result entity @e[type=minecraft:marker,tag=mcbr_center_marker,limit=1] Pos[2] double 1 run scoreboard players get $arena_center_z mcbr.config

# 2. Force load the grid area relative to center marker
execute at @e[type=minecraft:marker,tag=mcbr_center_marker,limit=1] run forceload add ~-120 ~-120 ~120 ~120
scoreboard players set $candidate_count mcbr.tmp 0
tellraw @a [{"text":"[mcbr2] 청크를 로드하는 중입니다. 0.5초 후 스캔을 시작합니다...","color":"yellow"}]
schedule function mcbr:map/generate_chest_candidates_step2 10t replace

