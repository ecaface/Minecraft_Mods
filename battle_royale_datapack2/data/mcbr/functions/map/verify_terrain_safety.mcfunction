# verify_terrain_safety.mcfunction
# Verifies if the landed candidate position is safe for a chest.

# 1. Check if the block where the chest would spawn (~ ~ ~) and the block above it (~ ~1 ~) are safe (air or replaceable decoration blocks).
# This prevents chests spawning inside solid rocks, walls, or tree trunks, while allowing them on grass fields.
# 2. We tag the probe with 'mcbr_candidate_safe' if it passes these safety checks.

tag @s remove mcbr_candidate_safe
tag @s remove mcbr_temp_y0_safe
tag @s remove mcbr_temp_y1_safe

# Check ground block (~ ~ ~) - must be air, cave_air, void_air, grass, tall_grass, fern, large_fern, or snow
execute if block ~ ~ ~ minecraft:air run tag @s add mcbr_temp_y0_safe
execute if block ~ ~ ~ minecraft:cave_air run tag @s add mcbr_temp_y0_safe
execute if block ~ ~ ~ minecraft:void_air run tag @s add mcbr_temp_y0_safe
execute if block ~ ~ ~ minecraft:grass run tag @s add mcbr_temp_y0_safe
execute if block ~ ~ ~ minecraft:tall_grass run tag @s add mcbr_temp_y0_safe
execute if block ~ ~ ~ minecraft:fern run tag @s add mcbr_temp_y0_safe
execute if block ~ ~ ~ minecraft:large_fern run tag @s add mcbr_temp_y0_safe
execute if block ~ ~ ~ minecraft:snow run tag @s add mcbr_temp_y0_safe

# Check upper block (~ ~1 ~) - must be air, cave_air, void_air, grass, tall_grass, fern, large_fern, or snow
execute if block ~ ~1 ~ minecraft:air run tag @s add mcbr_temp_y1_safe
execute if block ~ ~1 ~ minecraft:cave_air run tag @s add mcbr_temp_y1_safe
execute if block ~ ~1 ~ minecraft:void_air run tag @s add mcbr_temp_y1_safe
execute if block ~ ~1 ~ minecraft:grass run tag @s add mcbr_temp_y1_safe
execute if block ~ ~1 ~ minecraft:tall_grass run tag @s add mcbr_temp_y1_safe
execute if block ~ ~1 ~ minecraft:fern run tag @s add mcbr_temp_y1_safe
execute if block ~ ~1 ~ minecraft:large_fern run tag @s add mcbr_temp_y1_safe
execute if block ~ ~1 ~ minecraft:snow run tag @s add mcbr_temp_y1_safe

# If both are safe, tag the probe as safe
execute if entity @s[tag=mcbr_temp_y0_safe,tag=mcbr_temp_y1_safe] run tag @s add mcbr_candidate_safe

# Clean up temp tags
tag @s remove mcbr_temp_y0_safe
tag @s remove mcbr_temp_y1_safe

# --- Advanced Safety Filtering: Cliff / Ledge Check ---
# Check if North, South, East, or West has a steep drop of 3+ blocks.
tag @s remove mcbr_cliff_detected

# North cliff check
execute if block ~ ~-1 ~-1 minecraft:air if block ~ ~-2 ~-1 minecraft:air if block ~ ~-3 ~-1 minecraft:air run tag @s add mcbr_cliff_detected
execute if block ~ ~-1 ~-1 minecraft:cave_air if block ~ ~-2 ~-1 minecraft:cave_air if block ~ ~-3 ~-1 minecraft:cave_air run tag @s add mcbr_cliff_detected

# South cliff check
execute if block ~ ~-1 ~1 minecraft:air if block ~ ~-2 ~1 minecraft:air if block ~ ~-3 ~1 minecraft:air run tag @s add mcbr_cliff_detected
execute if block ~ ~-1 ~1 minecraft:cave_air if block ~ ~-2 ~1 minecraft:cave_air if block ~ ~-3 ~1 minecraft:cave_air run tag @s add mcbr_cliff_detected

# East cliff check
execute if block ~-1 ~-1 ~ minecraft:air if block ~-1 ~-2 ~ minecraft:air if block ~-1 ~-3 ~ minecraft:air run tag @s add mcbr_cliff_detected
execute if block ~-1 ~-1 ~ minecraft:cave_air if block ~-1 ~-2 ~ minecraft:cave_air if block ~-1 ~-3 ~ minecraft:cave_air run tag @s add mcbr_cliff_detected

# West cliff check
execute if block ~1 ~-1 ~ minecraft:air if block ~1 ~-2 ~ minecraft:air if block ~1 ~-3 ~ minecraft:air run tag @s add mcbr_cliff_detected
execute if block ~1 ~-1 ~ minecraft:cave_air if block ~1 ~-2 ~ minecraft:cave_air if block ~1 ~-3 ~ minecraft:cave_air run tag @s add mcbr_cliff_detected

# If a cliff is detected next to the chest, it's not safe
execute if entity @s[tag=mcbr_cliff_detected] run tag @s remove mcbr_candidate_safe
tag @s remove mcbr_cliff_detected

# If the candidate is safe, run the commit registration function at the probe's position.
execute if entity @s[tag=mcbr_candidate_safe] run function mcbr:map/register_chest_candidate_commit

