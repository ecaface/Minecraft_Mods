# raycast_downward.mcfunction
# Recursively teleports the probe downward if the block below is passable.

# Fail-safe: if the probe is below Y=30, kill it and stop.
execute store result score @s mcbr.tmp run data get entity @s Pos[1]
execute if score @s mcbr.tmp matches ..30 run kill @s


# Teleport downward if the block below is passable.
execute if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute if block ~ ~-1 ~ minecraft:cave_air run tp @s ~ ~-1 ~
execute if block ~ ~-1 ~ minecraft:void_air run tp @s ~ ~-1 ~
execute if block ~ ~-1 ~ minecraft:water run tp @s ~ ~-1 ~
execute if block ~ ~-1 ~ minecraft:lava run tp @s ~ ~-1 ~
execute if block ~ ~-1 ~ #minecraft:leaves run tp @s ~ ~-1 ~
execute if block ~ ~-1 ~ minecraft:grass run tp @s ~ ~-1 ~
execute if block ~ ~-1 ~ minecraft:tall_grass run tp @s ~ ~-1 ~
execute if block ~ ~-1 ~ minecraft:fern run tp @s ~ ~-1 ~
execute if block ~ ~-1 ~ minecraft:large_fern run tp @s ~ ~-1 ~
execute if block ~ ~-1 ~ minecraft:snow run tp @s ~ ~-1 ~

# Run recursion at the updated position.
execute at @s if block ~ ~-1 ~ minecraft:air run function mcbr:map/raycast_downward
execute at @s if block ~ ~-1 ~ minecraft:cave_air run function mcbr:map/raycast_downward
execute at @s if block ~ ~-1 ~ minecraft:void_air run function mcbr:map/raycast_downward
execute at @s if block ~ ~-1 ~ minecraft:water run function mcbr:map/raycast_downward
execute at @s if block ~ ~-1 ~ minecraft:lava run function mcbr:map/raycast_downward
execute at @s if block ~ ~-1 ~ #minecraft:leaves run function mcbr:map/raycast_downward
execute at @s if block ~ ~-1 ~ minecraft:grass run function mcbr:map/raycast_downward
execute at @s if block ~ ~-1 ~ minecraft:tall_grass run function mcbr:map/raycast_downward
execute at @s if block ~ ~-1 ~ minecraft:fern run function mcbr:map/raycast_downward
execute at @s if block ~ ~-1 ~ minecraft:large_fern run function mcbr:map/raycast_downward
execute at @s if block ~ ~-1 ~ minecraft:snow run function mcbr:map/raycast_downward

# If the block below is solid ground (landed!), execute the registration logic at the landed position.
execute at @s unless block ~ ~-1 ~ minecraft:air unless block ~ ~-1 ~ minecraft:cave_air unless block ~ ~-1 ~ minecraft:void_air unless block ~ ~-1 ~ minecraft:water unless block ~ ~-1 ~ minecraft:lava unless block ~ ~-1 ~ #minecraft:leaves unless block ~ ~-1 ~ minecraft:grass unless block ~ ~-1 ~ minecraft:tall_grass unless block ~ ~-1 ~ minecraft:fern unless block ~ ~-1 ~ minecraft:large_fern unless block ~ ~-1 ~ minecraft:snow run function mcbr:map/register_chest_candidate
