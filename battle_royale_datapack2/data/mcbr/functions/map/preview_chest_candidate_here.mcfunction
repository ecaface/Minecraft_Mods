# 현재 후보지 위치에 임시 상자와 표식 생성

execute align xyz run setblock ~ ~ ~ minecraft:chest[facing=south]
execute align xyz if entity @s[tag=mcbr_chest_center] run setblock ~ ~1 ~ minecraft:glowstone
execute align xyz unless entity @s[tag=mcbr_chest_center] run setblock ~ ~1 ~ minecraft:sea_lantern
