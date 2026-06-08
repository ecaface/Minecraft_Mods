# 보더 안쪽에서 후보지 1회 시도
# 현재 1차 버전은 중심 1000,1000 / 반경 104 기준으로 probe를 흩뿌린다.

scoreboard players add $candidate_attempts mcbr.tmp 1
kill @e[type=minecraft:marker,tag=mcbr_candidate_probe]
kill @e[type=minecraft:armor_stand,tag=mcbr_candidate_probe]
summon minecraft:armor_stand 1000 80 1000 {Tags:["mcbr_candidate_probe"],Marker:1b,Invisible:1b,NoGravity:1b,Small:1b}
spreadplayers 1000 1000 1 104 false @e[type=minecraft:armor_stand,tag=mcbr_candidate_probe,limit=1]
execute as @e[type=minecraft:armor_stand,tag=mcbr_candidate_probe,limit=1] at @s run function mcbr:map/register_chest_candidate
kill @e[type=minecraft:armor_stand,tag=mcbr_candidate_probe]
execute if score $candidate_count mcbr.tmp >= $candidate_target mcbr.tmp run function mcbr:map/generate_chest_candidates_complete
execute if score $candidate_attempts mcbr.tmp >= $candidate_max_attempts mcbr.tmp run function mcbr:map/generate_chest_candidates_complete
execute unless score $candidate_count mcbr.tmp >= $candidate_target mcbr.tmp unless score $candidate_attempts mcbr.tmp >= $candidate_max_attempts mcbr.tmp run schedule function mcbr:map/generate_chest_candidates_try_once 1t replace
