# Clear all field chest blocks at the scanned dynamic candidate positions.
function mcbr:map/forceload_arena
execute as @e[type=minecraft:marker,tag=mcbr_chest_candidate] at @s if block ~ ~ ~ minecraft:chest run setblock ~ ~ ~ air
function mcbr:map/forceload_arena_remove

