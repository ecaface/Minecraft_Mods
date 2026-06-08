# Clear dropped combat entities across the full initial match-border footprint plus starter-chest edge offsets.
# Relies on dynamic center (radius 142 block footprint -> x=-142, z=-142 from center, size dx=284, dz=284)

# 1. Summon temporary helper marker and move to configured center
execute positioned 0 60 0 run summon minecraft:marker ~ ~ ~ {Tags:["mcbr_clear_drops_helper"]}
execute store result entity @e[type=minecraft:marker,tag=mcbr_clear_drops_helper,limit=1] Pos[0] double 1 run scoreboard players get $arena_center_x mcbr.config
execute store result entity @e[type=minecraft:marker,tag=mcbr_clear_drops_helper,limit=1] Pos[2] double 1 run scoreboard players get $arena_center_z mcbr.config

# 2. Clear dropped entities relative to the helper position
execute at @e[type=minecraft:marker,tag=mcbr_clear_drops_helper,limit=1] positioned ~-142 60 ~-142 run kill @e[type=minecraft:item,dx=284,dy=67,dz=284]
execute at @e[type=minecraft:marker,tag=mcbr_clear_drops_helper,limit=1] positioned ~-142 60 ~-142 run kill @e[type=minecraft:experience_orb,dx=284,dy=67,dz=284]
execute at @e[type=minecraft:marker,tag=mcbr_clear_drops_helper,limit=1] positioned ~-142 60 ~-142 run kill @e[type=minecraft:arrow,dx=284,dy=67,dz=284]
execute at @e[type=minecraft:marker,tag=mcbr_clear_drops_helper,limit=1] positioned ~-142 60 ~-142 run kill @e[type=minecraft:spectral_arrow,dx=284,dy=67,dz=284]
execute at @e[type=minecraft:marker,tag=mcbr_clear_drops_helper,limit=1] positioned ~-142 60 ~-142 run kill @e[type=minecraft:trident,dx=284,dy=67,dz=284]

# 3. Clean up helper
kill @e[type=minecraft:marker,tag=mcbr_clear_drops_helper]