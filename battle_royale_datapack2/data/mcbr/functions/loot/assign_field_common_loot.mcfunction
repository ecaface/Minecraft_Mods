# Assign 8 unique common-tier guns from a 16-gun rotation pool.

execute if score $common_rotation mcbr.tmp matches 0 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot1] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_uzi"}
execute if score $common_rotation mcbr.tmp matches 0 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot2] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_mp5"}
execute if score $common_rotation mcbr.tmp matches 0 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot3] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_ump45"}
execute if score $common_rotation mcbr.tmp matches 0 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot4] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_vector45"}
execute if score $common_rotation mcbr.tmp matches 0 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot5] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_p90"}
execute if score $common_rotation mcbr.tmp matches 0 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot6] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_m870"}
execute if score $common_rotation mcbr.tmp matches 0 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot7] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_spas12"}
execute if score $common_rotation mcbr.tmp matches 0 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot8] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_m4a1"}

execute if score $common_rotation mcbr.tmp matches 1 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot1] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_mp5"}
execute if score $common_rotation mcbr.tmp matches 1 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot2] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_ump45"}
execute if score $common_rotation mcbr.tmp matches 1 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot3] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_vector45"}
execute if score $common_rotation mcbr.tmp matches 1 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot4] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_p90"}
execute if score $common_rotation mcbr.tmp matches 1 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot5] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_m870"}
execute if score $common_rotation mcbr.tmp matches 1 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot6] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_spas12"}
execute if score $common_rotation mcbr.tmp matches 1 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot7] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_m4a1"}
execute if score $common_rotation mcbr.tmp matches 1 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot8] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_ak47"}

execute if score $common_rotation mcbr.tmp matches 2 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot1] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_ump45"}
execute if score $common_rotation mcbr.tmp matches 2 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot2] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_vector45"}
execute if score $common_rotation mcbr.tmp matches 2 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot3] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_p90"}
execute if score $common_rotation mcbr.tmp matches 2 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot4] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_m870"}
execute if score $common_rotation mcbr.tmp matches 2 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot5] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_spas12"}
execute if score $common_rotation mcbr.tmp matches 2 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot6] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_m4a1"}
execute if score $common_rotation mcbr.tmp matches 2 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot7] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_ak47"}
execute if score $common_rotation mcbr.tmp matches 2 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot8] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_aug"}

execute if score $common_rotation mcbr.tmp matches 3 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot1] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_vector45"}
execute if score $common_rotation mcbr.tmp matches 3 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot2] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_p90"}
execute if score $common_rotation mcbr.tmp matches 3 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot3] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_m870"}
execute if score $common_rotation mcbr.tmp matches 3 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot4] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_spas12"}
execute if score $common_rotation mcbr.tmp matches 3 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot5] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_m4a1"}
execute if score $common_rotation mcbr.tmp matches 3 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot6] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_ak47"}
execute if score $common_rotation mcbr.tmp matches 3 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot7] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_aug"}
execute if score $common_rotation mcbr.tmp matches 3 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot8] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_g36k"}

execute if score $common_rotation mcbr.tmp matches 4 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot1] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_p90"}
execute if score $common_rotation mcbr.tmp matches 4 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot2] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_m870"}
execute if score $common_rotation mcbr.tmp matches 4 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot3] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_spas12"}
execute if score $common_rotation mcbr.tmp matches 4 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot4] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_m4a1"}
execute if score $common_rotation mcbr.tmp matches 4 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot5] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_ak47"}
execute if score $common_rotation mcbr.tmp matches 4 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot6] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_aug"}
execute if score $common_rotation mcbr.tmp matches 4 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot7] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_g36k"}
execute if score $common_rotation mcbr.tmp matches 4 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot8] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_hk416d"}

execute if score $common_rotation mcbr.tmp matches 5 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot1] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_m870"}
execute if score $common_rotation mcbr.tmp matches 5 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot2] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_spas12"}
execute if score $common_rotation mcbr.tmp matches 5 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot3] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_m4a1"}
execute if score $common_rotation mcbr.tmp matches 5 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot4] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_ak47"}
execute if score $common_rotation mcbr.tmp matches 5 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot5] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_aug"}
execute if score $common_rotation mcbr.tmp matches 5 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot6] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_g36k"}
execute if score $common_rotation mcbr.tmp matches 5 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot7] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_hk416d"}
execute if score $common_rotation mcbr.tmp matches 5 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot8] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_scar_l"}

execute if score $common_rotation mcbr.tmp matches 6 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot1] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_spas12"}
execute if score $common_rotation mcbr.tmp matches 6 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot2] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_m4a1"}
execute if score $common_rotation mcbr.tmp matches 6 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot3] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_ak47"}
execute if score $common_rotation mcbr.tmp matches 6 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot4] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_aug"}
execute if score $common_rotation mcbr.tmp matches 6 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot5] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_g36k"}
execute if score $common_rotation mcbr.tmp matches 6 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot6] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_hk416d"}
execute if score $common_rotation mcbr.tmp matches 6 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot7] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_scar_l"}
execute if score $common_rotation mcbr.tmp matches 6 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot8] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_rpk"}

execute if score $common_rotation mcbr.tmp matches 7 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot1] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_m4a1"}
execute if score $common_rotation mcbr.tmp matches 7 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot2] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_ak47"}
execute if score $common_rotation mcbr.tmp matches 7 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot3] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_aug"}
execute if score $common_rotation mcbr.tmp matches 7 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot4] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_g36k"}
execute if score $common_rotation mcbr.tmp matches 7 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot5] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_hk416d"}
execute if score $common_rotation mcbr.tmp matches 7 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot6] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_scar_l"}
execute if score $common_rotation mcbr.tmp matches 7 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot7] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_rpk"}
execute if score $common_rotation mcbr.tmp matches 7 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot8] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_aa12"}

execute if score $common_rotation mcbr.tmp matches 8 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot1] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_ak47"}
execute if score $common_rotation mcbr.tmp matches 8 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot2] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_aug"}
execute if score $common_rotation mcbr.tmp matches 8 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot3] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_g36k"}
execute if score $common_rotation mcbr.tmp matches 8 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot4] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_hk416d"}
execute if score $common_rotation mcbr.tmp matches 8 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot5] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_scar_l"}
execute if score $common_rotation mcbr.tmp matches 8 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot6] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_rpk"}
execute if score $common_rotation mcbr.tmp matches 8 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot7] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_aa12"}
execute if score $common_rotation mcbr.tmp matches 8 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot8] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_m1014"}

execute if score $common_rotation mcbr.tmp matches 9 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot1] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_aug"}
execute if score $common_rotation mcbr.tmp matches 9 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot2] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_g36k"}
execute if score $common_rotation mcbr.tmp matches 9 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot3] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_hk416d"}
execute if score $common_rotation mcbr.tmp matches 9 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot4] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_scar_l"}
execute if score $common_rotation mcbr.tmp matches 9 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot5] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_rpk"}
execute if score $common_rotation mcbr.tmp matches 9 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot6] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_aa12"}
execute if score $common_rotation mcbr.tmp matches 9 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot7] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_m1014"}
execute if score $common_rotation mcbr.tmp matches 9 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot8] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_uzi"}

execute if score $common_rotation mcbr.tmp matches 10 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot1] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_g36k"}
execute if score $common_rotation mcbr.tmp matches 10 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot2] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_hk416d"}
execute if score $common_rotation mcbr.tmp matches 10 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot3] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_scar_l"}
execute if score $common_rotation mcbr.tmp matches 10 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot4] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_rpk"}
execute if score $common_rotation mcbr.tmp matches 10 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot5] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_aa12"}
execute if score $common_rotation mcbr.tmp matches 10 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot6] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_m1014"}
execute if score $common_rotation mcbr.tmp matches 10 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot7] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_uzi"}
execute if score $common_rotation mcbr.tmp matches 10 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot8] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_mp5"}

execute if score $common_rotation mcbr.tmp matches 11 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot1] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_hk416d"}
execute if score $common_rotation mcbr.tmp matches 11 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot2] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_scar_l"}
execute if score $common_rotation mcbr.tmp matches 11 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot3] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_rpk"}
execute if score $common_rotation mcbr.tmp matches 11 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot4] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_aa12"}
execute if score $common_rotation mcbr.tmp matches 11 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot5] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_m1014"}
execute if score $common_rotation mcbr.tmp matches 11 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot6] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_uzi"}
execute if score $common_rotation mcbr.tmp matches 11 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot7] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_mp5"}
execute if score $common_rotation mcbr.tmp matches 11 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot8] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_ump45"}

execute if score $common_rotation mcbr.tmp matches 12 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot1] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_scar_l"}
execute if score $common_rotation mcbr.tmp matches 12 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot2] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_rpk"}
execute if score $common_rotation mcbr.tmp matches 12 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot3] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_aa12"}
execute if score $common_rotation mcbr.tmp matches 12 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot4] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_m1014"}
execute if score $common_rotation mcbr.tmp matches 12 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot5] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_uzi"}
execute if score $common_rotation mcbr.tmp matches 12 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot6] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_mp5"}
execute if score $common_rotation mcbr.tmp matches 12 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot7] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_ump45"}
execute if score $common_rotation mcbr.tmp matches 12 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot8] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_vector45"}

execute if score $common_rotation mcbr.tmp matches 13 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot1] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_rpk"}
execute if score $common_rotation mcbr.tmp matches 13 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot2] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_aa12"}
execute if score $common_rotation mcbr.tmp matches 13 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot3] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_m1014"}
execute if score $common_rotation mcbr.tmp matches 13 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot4] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_uzi"}
execute if score $common_rotation mcbr.tmp matches 13 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot5] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_mp5"}
execute if score $common_rotation mcbr.tmp matches 13 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot6] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_ump45"}
execute if score $common_rotation mcbr.tmp matches 13 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot7] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_vector45"}
execute if score $common_rotation mcbr.tmp matches 13 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot8] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_p90"}

execute if score $common_rotation mcbr.tmp matches 14 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot1] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_aa12"}
execute if score $common_rotation mcbr.tmp matches 14 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot2] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_m1014"}
execute if score $common_rotation mcbr.tmp matches 14 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot3] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_uzi"}
execute if score $common_rotation mcbr.tmp matches 14 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot4] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_mp5"}
execute if score $common_rotation mcbr.tmp matches 14 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot5] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_ump45"}
execute if score $common_rotation mcbr.tmp matches 14 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot6] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_vector45"}
execute if score $common_rotation mcbr.tmp matches 14 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot7] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_p90"}
execute if score $common_rotation mcbr.tmp matches 14 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot8] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_m870"}

execute if score $common_rotation mcbr.tmp matches 15 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot1] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_m1014"}
execute if score $common_rotation mcbr.tmp matches 15 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot2] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_uzi"}
execute if score $common_rotation mcbr.tmp matches 15 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot3] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_mp5"}
execute if score $common_rotation mcbr.tmp matches 15 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot4] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_ump45"}
execute if score $common_rotation mcbr.tmp matches 15 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot5] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_vector45"}
execute if score $common_rotation mcbr.tmp matches 15 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot6] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_p90"}
execute if score $common_rotation mcbr.tmp matches 15 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot7] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_m870"}
execute if score $common_rotation mcbr.tmp matches 15 as @e[type=minecraft:marker,tag=mcbr_chest_common,tag=mcbr_common_slot8] at @s run data merge block ~ ~ ~ {LootTable:"mcbr:chests/field_common_spas12"}
