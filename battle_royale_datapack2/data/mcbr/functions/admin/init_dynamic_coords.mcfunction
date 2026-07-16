# admin/init_dynamic_coords.mcfunction
# Initializes lobby and combat center coordinates based on the executing player's current position.

# 1. Set dynamic coordinates from the first player's current position.
function mcbr:admin/set_dynamic_coords

# 2. Global announcement only. Lobby construction is manual via admin/build_lobby.
tellraw @a [{"text":"[mcbr] Dynamic base coordinates initialized! Spawn X=","color":"gold"},{"score":{"name":"$spawn_x","objective":"mcbr.tmp"},"color":"white"},{"text":", Z=","color":"gold"},{"score":{"name":"$spawn_z","objective":"mcbr.tmp"},"color":"white"}]
