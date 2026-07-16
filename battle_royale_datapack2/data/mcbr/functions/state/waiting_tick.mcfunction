# Waiting state
# Keep non-participants in a clean lobby state.
# Round start in waiting state is lever-only. Do not auto-start on player count.

gamemode adventure @a[tag=!mcbr_playing,gamemode=!spectator]
team join mcbr_lobby @a[tag=!mcbr_playing]
scoreboard objectives setdisplay sidebar mcbr.wins

# Lobby host lever checked relative to lobby spawn marker
execute at @e[type=minecraft:marker,tag=mcbr_lobby_spawn,limit=1] if block ~ ~ ~5 minecraft:lever[face=floor,facing=north,powered=true] positioned ~ ~ ~5 if entity @a[tag=mcbr_host,distance=..3] run function mcbr:admin/start_game_from_lobby_lever
