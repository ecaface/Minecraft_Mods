# 생성된 랜덤 후보지를 임시 상자로 표시

execute unless entity @e[type=minecraft:marker,tag=mcbr_chest_candidate,limit=1] run tellraw @s [{"text":"[mcbr2] 표시할 후보지가 없습니다. 먼저 generate_random_candidates를 실행하세요.","color":"red"}]
execute if entity @e[type=minecraft:marker,tag=mcbr_chest_candidate,limit=1] run function mcbr:map/preview_chest_candidates
