# Admin helper: build the dynamic lobby platform at the configured high-altitude lobby position.
# Warning: clears a small area around the lobby before rebuilding it.

execute if entity @s run function mcbr:admin/set_dynamic_coords
function mcbr:map/build_lobby_platform
function mcbr:map/backup_arena
gamerule doImmediateRespawn true
scoreboard players set $arena_restore_enabled mcbr.config 1
execute if entity @s run tag @a remove mcbr_host
execute if entity @s run tag @s add mcbr_host
execute if entity @s run tp @s @e[type=minecraft:marker,tag=mcbr_lobby_spawn,limit=1]
tellraw @a [{"text":"[mcbr] Lobby built, arena backup refreshed, and arena restore enabled.","color":"green"}]
