# Assign 1 rare-tier gun from a 4-gun rotation pool.

execute if score $rare_rotation mcbr.tmp matches 0 as @e[type=minecraft:marker,tag=mcbr_chest_rare] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_rare_rpg7"}
execute if score $rare_rotation mcbr.tmp matches 1 as @e[type=minecraft:marker,tag=mcbr_chest_rare] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_rare_minigun"}
execute if score $rare_rotation mcbr.tmp matches 2 as @e[type=minecraft:marker,tag=mcbr_chest_rare] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_rare_m107"}
execute if score $rare_rotation mcbr.tmp matches 3 as @e[type=minecraft:marker,tag=mcbr_chest_rare] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_rare_m320"}
