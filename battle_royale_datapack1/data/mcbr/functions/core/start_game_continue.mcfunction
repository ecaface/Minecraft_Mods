# Core continuation after reset. Countdown starts while arena restore runs in the background.
scoreboard players set $active_count mcbr.tmp 0
execute as @a[gamemode=!spectator] run scoreboard players add $active_count mcbr.tmp 1

execute unless score $active_count mcbr.tmp >= $min_players mcbr.config run tellraw @a [{"text":"[mcbr] Not enough players to start.","color":"red"}]
execute if score $active_count mcbr.tmp > $max_players mcbr.config run tellraw @a [{"text":"[mcbr] Too many players connected. Extra players will remain in the lobby.","color":"yellow"}]
execute if score $active_count mcbr.tmp >= $min_players mcbr.config run function mcbr:admin/start_game_ready
