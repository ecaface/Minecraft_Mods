# 후보지 위치에 임시 상자 생성

forceload add 880 880 1120 1120
execute as @e[type=minecraft:marker,tag=mcbr_chest_candidate] at @s run function mcbr:map/preview_chest_candidate_here
forceload remove 880 880 1120 1120
tellraw @a [{"text":"[mcbr2] 후보지 미리보기 상자를 생성했습니다.","color":"yellow"}]
