# Core round reset logic shared by manual and automatic game flow.
# Before returning everyone to the lobby, run one final cleanup pass for starter chest artifacts and dropped combat entities.
function mcbr:map/forceload_arena
function mcbr:map/clear_arena_drops
function mcbr:loot/cleanup_spawn_caches
function mcbr:map/forceload_arena_remove

scoreboard players set $state mcbr.state 0
scoreboard players set $countdown_ticks mcbr.timer 0
scoreboard players set $end_ticks mcbr.timer 0
scoreboard players set $end_lock mcbr.tmp 0

tag @a remove mcbr_playing
tag @a remove mcbr_alive
scoreboard players set @a mcbr.alive 0
scoreboard players set @a mcbr.team 0
scoreboard players set @a mcbr.deaths 0
execute as @a run function mcbr:player/cleanup
team join mcbr_lobby @a

function mcbr:map/send_all_to_lobby
function mcbr:map/reset_border

tellraw @a [{"text":"[mcbr] Reset complete. Back to lobby.","color":"green"}]