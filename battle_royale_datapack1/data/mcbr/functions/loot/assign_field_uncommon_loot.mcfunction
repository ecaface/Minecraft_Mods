# Assign 2 unique uncommon-tier guns from a 6-gun rotation pool.

execute if score $uncommon_rotation mcbr.tmp matches 0 as @e[type=minecraft:marker,tag=mcbr_chest_uncommon,tag=mcbr_uncommon_slot1] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_uncommon_ai_awp"}
execute if score $uncommon_rotation mcbr.tmp matches 0 as @e[type=minecraft:marker,tag=mcbr_chest_uncommon,tag=mcbr_uncommon_slot2] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_uncommon_m249"}
execute if score $uncommon_rotation mcbr.tmp matches 1 as @e[type=minecraft:marker,tag=mcbr_chest_uncommon,tag=mcbr_uncommon_slot1] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_uncommon_m249"}
execute if score $uncommon_rotation mcbr.tmp matches 1 as @e[type=minecraft:marker,tag=mcbr_chest_uncommon,tag=mcbr_uncommon_slot2] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_uncommon_m95"}
execute if score $uncommon_rotation mcbr.tmp matches 2 as @e[type=minecraft:marker,tag=mcbr_chest_uncommon,tag=mcbr_uncommon_slot1] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_uncommon_m95"}
execute if score $uncommon_rotation mcbr.tmp matches 2 as @e[type=minecraft:marker,tag=mcbr_chest_uncommon,tag=mcbr_uncommon_slot2] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_uncommon_mk14"}
execute if score $uncommon_rotation mcbr.tmp matches 3 as @e[type=minecraft:marker,tag=mcbr_chest_uncommon,tag=mcbr_uncommon_slot1] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_uncommon_mk14"}
execute if score $uncommon_rotation mcbr.tmp matches 3 as @e[type=minecraft:marker,tag=mcbr_chest_uncommon,tag=mcbr_uncommon_slot2] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_uncommon_scar_h"}
execute if score $uncommon_rotation mcbr.tmp matches 4 as @e[type=minecraft:marker,tag=mcbr_chest_uncommon,tag=mcbr_uncommon_slot1] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_uncommon_scar_h"}
execute if score $uncommon_rotation mcbr.tmp matches 4 as @e[type=minecraft:marker,tag=mcbr_chest_uncommon,tag=mcbr_uncommon_slot2] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_uncommon_fn_fal"}
execute if score $uncommon_rotation mcbr.tmp matches 5 as @e[type=minecraft:marker,tag=mcbr_chest_uncommon,tag=mcbr_uncommon_slot1] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_uncommon_fn_fal"}
execute if score $uncommon_rotation mcbr.tmp matches 5 as @e[type=minecraft:marker,tag=mcbr_chest_uncommon,tag=mcbr_uncommon_slot2] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_uncommon_ai_awp"}
