# Clear all field chest blocks at the 50 candidate positions before the next round rebuild.
forceload add 928 928 1071 1039
kill @e[type=minecraft:marker,tag=mcbr_chest_candidate]
function mcbr:loot/spawn_candidates_50
execute as @e[type=minecraft:marker,tag=mcbr_chest_candidate] at @s if block ~ ~ ~ minecraft:chest run data remove block ~ ~ ~ LootTable
execute as @e[type=minecraft:marker,tag=mcbr_chest_candidate] at @s if block ~ ~ ~ minecraft:chest run data merge block ~ ~ ~ {Items:[]}
execute as @e[type=minecraft:marker,tag=mcbr_chest_candidate] at @s if block ~ ~ ~ minecraft:chest run setblock ~ ~ ~ air
kill @e[type=minecraft:marker,tag=mcbr_chest_candidate]
forceload remove 928 928 1071 1039
