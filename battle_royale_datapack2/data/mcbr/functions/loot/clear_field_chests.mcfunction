# Clear all field chest blocks at the scanned dynamic candidate positions.
forceload add 880 880 1120 1120
execute as @e[type=minecraft:marker,tag=mcbr_chest_candidate] at @s if block ~ ~ ~ minecraft:chest run setblock ~ ~ ~ air
forceload remove 880 880 1120 1120

