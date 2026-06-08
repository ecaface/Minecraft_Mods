# Phase 1 border start profile.
# Combat zone center is separated from the lobby.
# Default values are tuned for a small 2-player test first.

# Summon temporary center marker to set the worldborder center dynamically
execute positioned 0 60 0 run summon minecraft:marker ~ ~ ~ {Tags:["mcbr_border_center_temp"]}
execute store result entity @e[type=minecraft:marker,tag=mcbr_border_center_temp,limit=1] Pos[0] double 1 run scoreboard players get $center_x mcbr.config
execute store result entity @e[type=minecraft:marker,tag=mcbr_border_center_temp,limit=1] Pos[2] double 1 run scoreboard players get $center_z mcbr.config

# Execute at the temporary marker to center the world border
execute at @e[type=minecraft:marker,tag=mcbr_border_center_temp,limit=1] run worldborder center ~ ~

# Clean up temporary marker
kill @e[type=minecraft:marker,tag=mcbr_border_center_temp]

worldborder set 280 0
worldborder set 40 360
