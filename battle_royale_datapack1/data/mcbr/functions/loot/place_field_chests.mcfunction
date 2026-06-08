# Prepare the 50 chest candidates for the dynamic field-chest system.
# Actual activation, chest creation/removal, and loot assignment happen in assign_field_loot.

forceload add 928 928 1071 1027
kill @e[type=minecraft:marker,tag=mcbr_chest_candidate]

function mcbr:loot/spawn_candidates_50

# Remove duplicate overlapping markers at the same coordinates (e.g. from chunk loading lag or manual commands)
execute as @e[type=minecraft:marker,tag=mcbr_chest_candidate] at @s run tag @e[type=minecraft:marker,tag=mcbr_chest_candidate,distance=..0.1,limit=1,sort=nearest] add mcbr_keep
kill @e[type=minecraft:marker,tag=mcbr_chest_candidate,tag=!mcbr_keep]
tag @e[type=minecraft:marker,tag=mcbr_keep] remove mcbr_keep

tellraw @a [{"text":"[mcbr] Field chest candidates prepared.","color":"yellow"}]
