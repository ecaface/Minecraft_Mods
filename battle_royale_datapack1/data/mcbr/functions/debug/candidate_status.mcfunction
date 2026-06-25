# 현재 랜덤 후보지 개수 확인

scoreboard players set $candidate_count mcbr.tmp 0
scoreboard players set $candidate_center_count mcbr.tmp 0
execute as @e[type=minecraft:marker,tag=mcbr_chest_candidate] run scoreboard players add $candidate_count mcbr.tmp 1
execute as @e[type=minecraft:marker,tag=mcbr_chest_center] run scoreboard players add $candidate_center_count mcbr.tmp 1
tellraw @s [{"text":"[mcbr2] 후보지 상태","color":"gold"}]
tellraw @s [{"text":"- total_candidates: ","color":"yellow"},{"score":{"name":"$candidate_count","objective":"mcbr.tmp"},"color":"white"}]
tellraw @s [{"text":"- center_candidates: ","color":"yellow"},{"score":{"name":"$candidate_center_count","objective":"mcbr.tmp"},"color":"white"}]
tellraw @s [{"text":"- target: ","color":"yellow"},{"score":{"name":"$candidate_target","objective":"mcbr.tmp"},"color":"white"}]
tellraw @s [{"text":"- attempts: ","color":"yellow"},{"score":{"name":"$candidate_attempts","objective":"mcbr.tmp"},"color":"white"}]
