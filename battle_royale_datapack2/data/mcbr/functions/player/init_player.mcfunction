# player/init_player.mcfunction
# Handles player initialization when they first join the world.

# 1. Increment join counter and assign join order
scoreboard players add $join_counter mcbr.tmp 1
scoreboard players operation @s mcbr.join = $join_counter mcbr.tmp

# 2. If this is the very first player, initialize dynamic coordinates based on their current spawn point!
execute if score $config_initialized mcbr.tmp matches 0 run function mcbr:admin/init_dynamic_coords

# 3. Handle game state lobby routing
execute if score $state mcbr.state matches 0 run function mcbr:player/join_lobby
execute if score $state mcbr.state matches 1..3 run function mcbr:player/join_during_match

# 4. Mark player as initialized
tag @s add mcbr_initialized
