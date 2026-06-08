# 후보지 marker 실제 등록

summon minecraft:marker ~0.5 ~0 ~0.5 {Tags:["mcbr_chest_candidate"]}
execute as @e[type=minecraft:marker,tag=mcbr_chest_candidate,sort=nearest,limit=1,distance=..1] at @s positioned 1000 ~ 1000 if entity @s[distance=..32] run tag @s add mcbr_chest_center
scoreboard players add $candidate_count mcbr.tmp 1
