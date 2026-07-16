# Assign non-repeating starter weapons from the same round pool used by field chests.

tag @a[tag=mcbr_playing] remove mcbr_spawn_slot1
tag @a[tag=mcbr_playing] remove mcbr_spawn_slot2
tag @a[tag=mcbr_playing] remove mcbr_spawn_slot3
tag @a[tag=mcbr_playing] remove mcbr_spawn_slot4
tag @a[tag=mcbr_playing] remove mcbr_spawn_slot5
tag @a[tag=mcbr_playing] remove mcbr_spawn_glock
tag @a[tag=mcbr_playing] remove mcbr_spawn_m1911
tag @a[tag=mcbr_playing] remove mcbr_spawn_p320
tag @a[tag=mcbr_playing] remove mcbr_spawn_cz75
tag @a[tag=mcbr_playing] remove mcbr_spawn_deagle

execute as @a[tag=mcbr_playing] run function mcbr:loot/clear_weapon_slot_tags
execute as @a[tag=mcbr_playing,sort=random] run function mcbr:loot/assign_next_weapon_slot
