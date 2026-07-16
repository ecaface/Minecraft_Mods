# Phase 1 arena spread setup.
# Combat zone center is separated from the lobby.
# Default values are tuned for a small 2-player test first.

# 1. Summon temporary center marker to use as spread center
kill @e[type=minecraft:marker,tag=mcbr_spread_center_temp]
execute positioned 0 200 0 run summon minecraft:marker ~ ~ ~ {Tags:["mcbr_spread_center_temp"]}
execute store result entity @e[type=minecraft:marker,tag=mcbr_spread_center_temp,limit=1] Pos[0] double 1 run scoreboard players get $center_x mcbr.config
execute store result entity @e[type=minecraft:marker,tag=mcbr_spread_center_temp,limit=1] Pos[2] double 1 run scoreboard players get $center_z mcbr.config

# 2. Spread players relative to the center marker
execute at @e[type=minecraft:marker,tag=mcbr_spread_center_temp,limit=1] run spreadplayers ~ ~ 16 96 false @a[tag=mcbr_playing]
execute as @a[tag=mcbr_playing] at @s if entity @e[type=minecraft:marker,tag=mcbr_lobby_spawn,distance=..32,limit=1] run function mcbr:map/spread_self_fallback

# 3. Clean up temporary marker
kill @e[type=minecraft:marker,tag=mcbr_spread_center_temp]
