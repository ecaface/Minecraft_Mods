# Remove previous round starter chest artifacts before arena restore/refill.
# Exact score-tracked cleanup is the primary path; marker cleanup remains as a fallback.

execute as @a run function mcbr:loot/cleanup_spawn_cache_from_scores

execute as @e[type=marker,tag=mcbr_spawn_cache_chest] at @s if block ~ ~ ~ minecraft:chest run data remove block ~ ~ ~ LootTable
execute as @e[type=marker,tag=mcbr_spawn_cache_chest] at @s if block ~ ~ ~ minecraft:chest run data merge block ~ ~ ~ {Items:[]}
execute as @e[type=marker,tag=mcbr_spawn_cache_chest] at @s if block ~ ~ ~ minecraft:chest run setblock ~ ~ ~ air
execute as @e[type=marker,tag=mcbr_spawn_cache_support] at @s if block ~ ~ ~ minecraft:stone_bricks run setblock ~ ~ ~ air
execute as @e[type=marker,tag=mcbr_spawn_cache_glow] at @s if block ~ ~ ~ minecraft:glowstone run setblock ~ ~ ~ air

kill @e[type=marker,tag=mcbr_spawn_cache_chest]
kill @e[type=marker,tag=mcbr_spawn_cache_support]
kill @e[type=marker,tag=mcbr_spawn_cache_glow]
