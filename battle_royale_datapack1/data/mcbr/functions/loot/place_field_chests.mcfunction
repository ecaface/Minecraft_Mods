# Prepare the 50 chest candidates for the dynamic field-chest system.
# Actual activation, chest creation/removal, and loot assignment happen in assign_field_loot.

forceload add 928 928 1071 1027
kill @e[type=minecraft:marker,tag=mcbr_chest_candidate]

function mcbr:loot/spawn_candidates_50

tellraw @a [{"text":"[mcbr] Field chest candidates prepared.","color":"yellow"}]
