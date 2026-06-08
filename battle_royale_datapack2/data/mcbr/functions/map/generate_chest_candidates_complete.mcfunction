# 상자 후보지 자동 스캔 종료

kill @e[type=minecraft:marker,tag=mcbr_candidate_probe]
kill @e[type=minecraft:armor_stand,tag=mcbr_candidate_probe]
scoreboard players set $candidate_center_count mcbr.tmp 0
execute as @e[type=minecraft:marker,tag=mcbr_chest_center] run scoreboard players add $candidate_center_count mcbr.tmp 1
tellraw @a [{"text":"[mcbr2] 상자 후보지 자동 스캔이 끝났습니다.","color":"green"}]
tellraw @a [{"text":"[mcbr2] total=","color":"yellow"},{"score":{"name":"$candidate_count","objective":"mcbr.tmp"},"color":"white"},{"text":", center=","color":"yellow"},{"score":{"name":"$candidate_center_count","objective":"mcbr.tmp"},"color":"white"},{"text":", attempts=","color":"yellow"},{"score":{"name":"$candidate_attempts","objective":"mcbr.tmp"},"color":"white"}]
