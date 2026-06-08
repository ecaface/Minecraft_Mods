# Fill the already-placed starter chest with the player's assigned loadout.

execute if entity @s[tag=mcbr_spawn_glock] run data merge block ~ ~ ~ {LootTable:"mcbr:chests/br_spawn_glock"}
execute if entity @s[tag=mcbr_spawn_m1911] run data merge block ~ ~ ~ {LootTable:"mcbr:chests/br_spawn_m1911"}
execute if entity @s[tag=mcbr_spawn_p320] run data merge block ~ ~ ~ {LootTable:"mcbr:chests/br_spawn_p320"}
execute if entity @s[tag=mcbr_spawn_cz75] run data merge block ~ ~ ~ {LootTable:"mcbr:chests/br_spawn_cz75"}
execute if entity @s[tag=mcbr_spawn_deagle] run data merge block ~ ~ ~ {LootTable:"mcbr:chests/br_spawn_deagle"}
execute unless entity @s[tag=mcbr_spawn_glock] unless entity @s[tag=mcbr_spawn_m1911] unless entity @s[tag=mcbr_spawn_p320] unless entity @s[tag=mcbr_spawn_cz75] unless entity @s[tag=mcbr_spawn_deagle] run data merge block ~ ~ ~ {LootTable:"mcbr:chests/br_spawn_glock"}
