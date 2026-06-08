# Summon temporary forceload helper marker and move to configured center
execute positioned 0 60 0 run summon minecraft:marker ~ ~ ~ {Tags:["mcbr_forceload_helper"]}
execute store result entity @e[type=minecraft:marker,tag=mcbr_forceload_helper,limit=1] Pos[0] double 1 run scoreboard players get $arena_center_x mcbr.config
execute store result entity @e[type=minecraft:marker,tag=mcbr_forceload_helper,limit=1] Pos[2] double 1 run scoreboard players get $arena_center_z mcbr.config

# Forceload the arena area (radius 150 blocks around the dynamic center)
execute at @e[type=minecraft:marker,tag=mcbr_forceload_helper,limit=1] run forceload add ~-150 ~-150 ~150 ~150

# Clean up helper
kill @e[type=minecraft:marker,tag=mcbr_forceload_helper]
