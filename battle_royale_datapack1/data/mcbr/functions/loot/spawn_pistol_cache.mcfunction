# Try several nearby starter chest positions and fall back near the player's feet.

scoreboard players set @s mcbr.tmp 0

# Preferred positions first: 2 blocks away, then 1 block away, then slightly behind.
execute if score @s mcbr.tmp matches 0 if block ~2 ~ ~ minecraft:air if block ~2 ~1 ~ minecraft:air run function mcbr:loot/spawn_pistol_cache_place_east_far
execute if score @s mcbr.tmp matches 0 if block ~-2 ~ ~ minecraft:air if block ~-2 ~1 ~ minecraft:air run function mcbr:loot/spawn_pistol_cache_place_west_far
execute if score @s mcbr.tmp matches 0 if block ~ ~ ~2 minecraft:air if block ~ ~1 ~2 minecraft:air run function mcbr:loot/spawn_pistol_cache_place_south_far
execute if score @s mcbr.tmp matches 0 if block ~ ~ ~-2 minecraft:air if block ~ ~1 ~-2 minecraft:air run function mcbr:loot/spawn_pistol_cache_place_north_far

execute if score @s mcbr.tmp matches 0 if block ~1 ~ ~ minecraft:air if block ~1 ~1 ~ minecraft:air run function mcbr:loot/spawn_pistol_cache_place_east_near
execute if score @s mcbr.tmp matches 0 if block ~-1 ~ ~ minecraft:air if block ~-1 ~1 ~ minecraft:air run function mcbr:loot/spawn_pistol_cache_place_west_near
execute if score @s mcbr.tmp matches 0 if block ~ ~ ~1 minecraft:air if block ~ ~1 ~1 minecraft:air run function mcbr:loot/spawn_pistol_cache_place_south_near
execute if score @s mcbr.tmp matches 0 if block ~ ~ ~-1 minecraft:air if block ~ ~1 ~-1 minecraft:air run function mcbr:loot/spawn_pistol_cache_place_north_near

# Final fallback: place it next to the player on a forced pad even if the spot is awkward.
execute if score @s mcbr.tmp matches 0 run function mcbr:loot/spawn_pistol_cache_place_fallback
