# Copy internal fake-player scores to display-safe names for tellraw score components.

scoreboard players operation mcbr_state mcbr.debug = $state mcbr.state
scoreboard players operation mcbr_arena_restore mcbr.debug = $arena_restore_enabled mcbr.config
scoreboard players operation mcbr_chest_refill mcbr.debug = $chest_refill_enabled mcbr.config
scoreboard players operation mcbr_min_players mcbr.debug = $min_players mcbr.config
scoreboard players operation mcbr_max_players mcbr.debug = $max_players mcbr.config
scoreboard players operation mcbr_countdown_seconds mcbr.debug = $countdown_seconds mcbr.config
scoreboard players operation mcbr_initial_border mcbr.debug = $initial_border mcbr.config
scoreboard players operation mcbr_final_border mcbr.debug = $final_border mcbr.config
scoreboard players operation mcbr_shrink_seconds mcbr.debug = $shrink_seconds mcbr.config
scoreboard players operation mcbr_lobby_x mcbr.debug = $lobby_x mcbr.config
scoreboard players operation mcbr_lobby_y mcbr.debug = $lobby_y mcbr.config
scoreboard players operation mcbr_lobby_z mcbr.debug = $lobby_z mcbr.config
scoreboard players operation mcbr_center_x mcbr.debug = $center_x mcbr.config
scoreboard players operation mcbr_center_z mcbr.debug = $center_z mcbr.config
