# Backfill scoreboard values that debug/status displays without overwriting existing config.

execute store success score mcbr_has_state mcbr.debug run scoreboard players get $state mcbr.state
execute if score mcbr_has_state mcbr.debug matches 0 run scoreboard players set $state mcbr.state 0
execute store success score mcbr_has_arena_restore mcbr.debug run scoreboard players get $arena_restore_enabled mcbr.config
execute if score mcbr_has_arena_restore mcbr.debug matches 0 run scoreboard players set $arena_restore_enabled mcbr.config 0
execute store success score mcbr_has_chest_refill mcbr.debug run scoreboard players get $chest_refill_enabled mcbr.config
execute if score mcbr_has_chest_refill mcbr.debug matches 0 run scoreboard players set $chest_refill_enabled mcbr.config 1
execute store success score mcbr_has_min_players mcbr.debug run scoreboard players get $min_players mcbr.config
execute if score mcbr_has_min_players mcbr.debug matches 0 run scoreboard players set $min_players mcbr.config 1
execute store success score mcbr_has_max_players mcbr.debug run scoreboard players get $max_players mcbr.config
execute if score mcbr_has_max_players mcbr.debug matches 0 run scoreboard players set $max_players mcbr.config 4
execute store success score mcbr_has_countdown mcbr.debug run scoreboard players get $countdown_seconds mcbr.config
execute if score mcbr_has_countdown mcbr.debug matches 0 run scoreboard players set $countdown_seconds mcbr.config 3
execute store success score mcbr_has_initial_border mcbr.debug run scoreboard players get $initial_border mcbr.config
execute if score mcbr_has_initial_border mcbr.debug matches 0 run scoreboard players set $initial_border mcbr.config 256
execute store success score mcbr_has_final_border mcbr.debug run scoreboard players get $final_border mcbr.config
execute if score mcbr_has_final_border mcbr.debug matches 0 run scoreboard players set $final_border mcbr.config 32
execute store success score mcbr_has_shrink_seconds mcbr.debug run scoreboard players get $shrink_seconds mcbr.config
execute if score mcbr_has_shrink_seconds mcbr.debug matches 0 run scoreboard players set $shrink_seconds mcbr.config 420
execute store success score mcbr_has_lobby_x mcbr.debug run scoreboard players get $lobby_x mcbr.config
execute if score mcbr_has_lobby_x mcbr.debug matches 0 run scoreboard players set $lobby_x mcbr.config 0
execute store success score mcbr_has_lobby_y mcbr.debug run scoreboard players get $lobby_y mcbr.config
execute if score mcbr_has_lobby_y mcbr.debug matches 0 run scoreboard players set $lobby_y mcbr.config 240
execute unless score $lobby_y mcbr.config matches 1.. run scoreboard players set $lobby_y mcbr.config 240
execute store success score mcbr_has_lobby_z mcbr.debug run scoreboard players get $lobby_z mcbr.config
execute if score mcbr_has_lobby_z mcbr.debug matches 0 run scoreboard players set $lobby_z mcbr.config 0
execute store success score mcbr_has_center_x mcbr.debug run scoreboard players get $center_x mcbr.config
execute if score mcbr_has_center_x mcbr.debug matches 0 run scoreboard players set $center_x mcbr.config 1000
execute store success score mcbr_has_center_z mcbr.debug run scoreboard players get $center_z mcbr.config
execute if score mcbr_has_center_z mcbr.debug matches 0 run scoreboard players set $center_z mcbr.config 1000
