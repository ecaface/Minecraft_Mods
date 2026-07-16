# Last-resort deployment if spreadplayers left a participant in the lobby.

execute at @e[type=minecraft:marker,tag=mcbr_spread_center_temp,limit=1] run spreadplayers ~ ~ 0 32 false @s
execute at @s if entity @e[type=minecraft:marker,tag=mcbr_lobby_spawn,distance=..32,limit=1] run effect give @s minecraft:slow_falling 15 0 true
execute at @s if entity @e[type=minecraft:marker,tag=mcbr_lobby_spawn,distance=..32,limit=1] run tp @s @e[type=minecraft:marker,tag=mcbr_spread_center_temp,limit=1]
