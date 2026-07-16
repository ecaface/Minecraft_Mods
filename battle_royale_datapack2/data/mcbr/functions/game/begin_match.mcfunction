# Start the live match.

scoreboard players set $state mcbr.state 2
time set day

# Ensure participants are in the combat field before starter chests are placed.
function mcbr:map/deploy_players_to_field

title @a[tag=mcbr_playing] title {"text":"Fight!","color":"red"}
title @a[tag=mcbr_playing] subtitle {"text":"Loot chests and survive the border.","color":"gold"}
tellraw @a [{"text":"[mcbr] Match started.","color":"green"}]

# Live participants fight in survival.
team leave @a[tag=mcbr_playing]
gamemode survival @a[tag=mcbr_playing]

# Assign unique starter weapons before placing nearby starter chests.
function mcbr:game/assign_spawn_loadouts

# Give each player a nearby starter chest for early-game stability.
execute as @a[tag=mcbr_playing] at @s run function mcbr:loot/spawn_pistol_cache

# Start the configured Phase 1 border shrink.
function mcbr:game/border_control
