# 현재 후보지 위치의 임시 상자와 표식 제거

execute align xyz if block ~ ~ ~ minecraft:chest run setblock ~ ~ ~ minecraft:air
execute align xyz if block ~ ~1 ~ minecraft:glowstone run setblock ~ ~1 ~ minecraft:air
execute align xyz if block ~ ~1 ~ minecraft:sea_lantern run setblock ~ ~1 ~ minecraft:air
