# Admin helper: build the default lobby platform at 0 100 0.
# Warning: clears a small area around the lobby before rebuilding it.

function mcbr:map/build_lobby_platform
function mcbr:map/backup_arena
gamerule doImmediateRespawn true
scoreboard players set $arena_restore_enabled mcbr.config 1
execute if entity @s run tag @a remove mcbr_host
execute if entity @s run tag @s add mcbr_host
execute if entity @s run tp @s 0 100 0
tellraw @a [{"text":"[mcbr] Lobby built, arena backup refreshed, and arena restore enabled.","color":"green"}]
