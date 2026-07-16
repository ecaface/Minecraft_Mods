# player/init_player.mcfunction
# Handles player initialization when they first join the world.

# 1. Increment join counter and assign join order
scoreboard players add $join_counter mcbr.tmp 1
scoreboard players operation @s mcbr.join = $join_counter mcbr.tmp
scoreboard players set @s mcbr.wins 0

# 2. Handle game state lobby routing.
# Lobby construction is intentionally manual via mcbr:admin/build_lobby.
execute if score $state mcbr.state matches 0 run function mcbr:player/join_lobby
execute if score $state mcbr.state matches 1..3 run function mcbr:player/join_during_match

# 3. Mark player as initialized
tag @s add mcbr_initialized
