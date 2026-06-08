# Dynamic candidate-based chest assignment.
# Counts by active player count n:
# - common = n * 4
# - uncommon = (n - 1)^2 + 1
# - rare = floor(n / 2)
# Rare chests are chosen only from the central 10 candidates.
# Previous-round field chest cleanup is handled before this function runs.

scoreboard players set $active_count mcbr.tmp 0
execute as @a[gamemode=!spectator] run scoreboard players add $active_count mcbr.tmp 1
scoreboard players operation $chest_player_count mcbr.tmp = $active_count mcbr.tmp
execute if score $chest_player_count mcbr.tmp matches ..1 run scoreboard players set $chest_player_count mcbr.tmp 2
execute if score $chest_player_count mcbr.tmp matches 5.. run scoreboard players set $chest_player_count mcbr.tmp 4

tag @e[type=minecraft:marker] remove mcbr_chest_active
tag @e[type=minecraft:marker] remove mcbr_chest_common
tag @e[type=minecraft:marker] remove mcbr_chest_uncommon
tag @e[type=minecraft:marker] remove mcbr_chest_rare

# Rare selection from the central 10 only.
execute if score $chest_player_count mcbr.tmp matches 2..4 run tag @e[type=minecraft:marker,tag=mcbr_chest_center,sort=random,limit=1] add mcbr_chest_rare
execute if score $chest_player_count mcbr.tmp matches 4 run tag @e[type=minecraft:marker,tag=mcbr_chest_center,tag=!mcbr_chest_rare,sort=random,limit=1] add mcbr_chest_rare

# Uncommon selection
execute if score $chest_player_count mcbr.tmp matches 2 run tag @e[type=minecraft:marker,tag=mcbr_chest_candidate,tag=!mcbr_chest_rare,sort=random,limit=2] add mcbr_chest_uncommon
execute if score $chest_player_count mcbr.tmp matches 3 run tag @e[type=minecraft:marker,tag=mcbr_chest_candidate,tag=!mcbr_chest_rare,sort=random,limit=5] add mcbr_chest_uncommon
execute if score $chest_player_count mcbr.tmp matches 4 run tag @e[type=minecraft:marker,tag=mcbr_chest_candidate,tag=!mcbr_chest_rare,sort=random,limit=10] add mcbr_chest_uncommon

# Common selection
execute if score $chest_player_count mcbr.tmp matches 2 run tag @e[type=minecraft:marker,tag=mcbr_chest_candidate,tag=!mcbr_chest_rare,tag=!mcbr_chest_uncommon,sort=random,limit=8] add mcbr_chest_common
execute if score $chest_player_count mcbr.tmp matches 3 run tag @e[type=minecraft:marker,tag=mcbr_chest_candidate,tag=!mcbr_chest_rare,tag=!mcbr_chest_uncommon,sort=random,limit=12] add mcbr_chest_common
execute if score $chest_player_count mcbr.tmp matches 4 run tag @e[type=minecraft:marker,tag=mcbr_chest_candidate,tag=!mcbr_chest_rare,tag=!mcbr_chest_uncommon,sort=random,limit=16] add mcbr_chest_common

tag @e[type=minecraft:marker,tag=mcbr_chest_common] add mcbr_chest_active
tag @e[type=minecraft:marker,tag=mcbr_chest_uncommon] add mcbr_chest_active
tag @e[type=minecraft:marker,tag=mcbr_chest_rare] add mcbr_chest_active

# Create fresh chest blocks only for the active slots.
execute as @e[type=minecraft:marker,tag=mcbr_chest_active] at @s run setblock ~ ~ ~ minecraft:chest[facing=south]
execute as @e[type=minecraft:marker,tag=mcbr_chest_active] at @s run data remove block ~ ~ ~ LootTable
execute as @e[type=minecraft:marker,tag=mcbr_chest_active] at @s run data merge block ~ ~ ~ {Items:[]}

# Apply unified loot tables.
execute as @e[type=minecraft:marker,tag=mcbr_chest_common] at @s if block ~ ~ ~ minecraft:chest run data merge block ~ ~ ~ {LootTable:"mcbr:chests/br_common"}
execute as @e[type=minecraft:marker,tag=mcbr_chest_uncommon] at @s if block ~ ~ ~ minecraft:chest run data merge block ~ ~ ~ {LootTable:"mcbr:chests/br_uncommon"}
execute as @e[type=minecraft:marker,tag=mcbr_chest_rare] at @s if block ~ ~ ~ minecraft:chest run data merge block ~ ~ ~ {LootTable:"mcbr:chests/br_rare"}

kill @e[type=minecraft:marker,tag=mcbr_chest_candidate]
forceload remove 928 928 1071 1027
execute if score $chest_player_count mcbr.tmp matches 2 run tellraw @a [{"text":"[mcbr] Field chests active: common 8, uncommon 2, rare 1","color":"yellow"}]
execute if score $chest_player_count mcbr.tmp matches 3 run tellraw @a [{"text":"[mcbr] Field chests active: common 12, uncommon 5, rare 1","color":"yellow"}]
execute if score $chest_player_count mcbr.tmp matches 4 run tellraw @a [{"text":"[mcbr] Field chests active: common 16, uncommon 10, rare 2","color":"yellow"}]
tellraw @a [{"text":"[mcbr] Field chest loot assigned.","color":"yellow"}]

