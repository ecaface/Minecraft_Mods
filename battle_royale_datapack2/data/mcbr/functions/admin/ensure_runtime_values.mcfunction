# Backfill required runtime config without overwriting existing values.

execute unless score $state mcbr.state matches 0..3 run scoreboard players set $state mcbr.state 0
execute unless score $min_players mcbr.config matches 0.. run scoreboard players set $min_players mcbr.config 1
execute unless score $max_players mcbr.config matches 1.. run scoreboard players set $max_players mcbr.config 4
execute unless score $countdown_seconds mcbr.config matches 0.. run scoreboard players set $countdown_seconds mcbr.config 3
execute unless score $chest_refill_enabled mcbr.config matches 0.. run scoreboard players set $chest_refill_enabled mcbr.config 1
execute unless score $chest_refill_interval mcbr.config matches 0.. run scoreboard players set $chest_refill_interval mcbr.config 0
execute unless score $arena_restore_enabled mcbr.config matches 0.. run scoreboard players set $arena_restore_enabled mcbr.config 0
execute unless score $end_delay_seconds mcbr.config matches 1.. run scoreboard players set $end_delay_seconds mcbr.config 8
execute unless score $end_ticks_default mcbr.config matches 1.. run scoreboard players set $end_ticks_default mcbr.config 160
execute unless score $initial_border mcbr.config matches 1.. run scoreboard players set $initial_border mcbr.config 256
execute unless score $final_border mcbr.config matches 1.. run scoreboard players set $final_border mcbr.config 32
execute unless score $shrink_seconds mcbr.config matches 1.. run scoreboard players set $shrink_seconds mcbr.config 420
execute unless score $spread_distance mcbr.config matches 0.. run scoreboard players set $spread_distance mcbr.config 32
execute unless score $spread_range mcbr.config matches 1.. run scoreboard players set $spread_range mcbr.config 96
execute unless score $lobby_y mcbr.config matches 1.. run scoreboard players set $lobby_y mcbr.config 240
