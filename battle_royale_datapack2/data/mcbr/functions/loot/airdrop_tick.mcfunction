# loot/airdrop_tick.mcfunction
# Handles the active falling phase of the airdrop dropper armor stand.
# Run from tick.mcfunction.

# 1. Run falling particle effect (small flame and smoke)
execute as @e[type=minecraft:armor_stand,tag=mcbr_airdrop_dropper] at @s run particle minecraft:small_flame ~ ~1 ~ 0.2 0.5 0.2 0.05 5
execute as @e[type=minecraft:armor_stand,tag=mcbr_airdrop_dropper] at @s run particle minecraft:smoke ~ ~1 ~ 0.2 0.5 0.2 0.05 10

# 2. Teleport the dropper downward by 1 block for smooth descent
execute as @e[type=minecraft:armor_stand,tag=mcbr_airdrop_dropper] at @s run tp @s ~ ~-1 ~

# 3. Check landing condition (if the block below is solid ground)
execute as @e[type=minecraft:armor_stand,tag=mcbr_airdrop_dropper] at @s unless block ~ ~-1 ~ minecraft:air unless block ~ ~-1 ~ minecraft:cave_air unless block ~ ~-1 ~ minecraft:void_air unless block ~ ~-1 ~ minecraft:water unless block ~ ~-1 ~ minecraft:lava unless block ~ ~-1 ~ #minecraft:leaves unless block ~ ~-1 ~ minecraft:grass unless block ~ ~-1 ~ minecraft:tall_grass unless block ~ ~-1 ~ minecraft:fern unless block ~ ~-1 ~ minecraft:large_fern unless block ~ ~-1 ~ minecraft:snow run function mcbr:loot/airdrop_land
