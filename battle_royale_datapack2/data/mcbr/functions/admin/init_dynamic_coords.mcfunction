# admin/init_dynamic_coords.mcfunction
# Initializes lobby and combat center coordinates based on the first player's initial spawn point.

# 1. Read first player's position (spawn location)
execute store result score $spawn_x mcbr.tmp run data get entity @s Pos[0]
execute store result score $spawn_z mcbr.tmp run data get entity @s Pos[2]

# 2. Set lobby position (directly at spawn point, Y=120)
scoreboard players operation $lobby_x mcbr.config = $spawn_x mcbr.tmp
scoreboard players set $lobby_y mcbr.config 120
scoreboard players operation $lobby_z mcbr.config = $spawn_z mcbr.tmp

# 3. Set combat center (X+1000, Z+1000)
scoreboard players operation $center_x mcbr.config = $spawn_x mcbr.tmp
scoreboard players add $center_x mcbr.config 1000
scoreboard players operation $center_z mcbr.config = $spawn_z mcbr.tmp
scoreboard players add $center_z mcbr.config 1000

# 4. Set arena center for backup/restore (matches combat center)
scoreboard players operation $arena_center_x mcbr.config = $center_x mcbr.config
scoreboard players operation $arena_center_z mcbr.config = $center_z mcbr.config

# 5. Set configuration as initialized
scoreboard players set $config_initialized mcbr.tmp 1

# 6. Global announcement and build the lobby platform automatically!
tellraw @a [{"text":"[mcbr] Dynamic base coordinates initialized! Spawn X=","color":"gold"},{"score":{"name":"$spawn_x","objective":"mcbr.tmp"},"color":"white"},{"text":", Z=","color":"gold"},{"score":{"name":"$spawn_z","objective":"mcbr.tmp"},"color":"white"}]
tellraw @a [{"text":"[mcbr] Creating dynamic lobby platform...","color":"gold"}]
function mcbr:map/build_lobby_platform

# 7. Automatically generate chest candidates for the new map after a 5-second delay to allow chunks to load
schedule function mcbr:map/generate_chest_candidates 100t replace
