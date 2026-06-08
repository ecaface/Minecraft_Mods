# 진단 단계:
# 지형 검사 없이 현재 격자 위치를 그대로 후보지로 등록한다.

execute align xyz unless entity @e[type=minecraft:marker,tag=mcbr_chest_candidate,distance=..8] run function mcbr:map/verify_terrain_safety
kill @s
