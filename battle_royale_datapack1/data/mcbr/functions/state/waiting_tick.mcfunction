# Waiting state
# Keep non-participants in a clean lobby state.
# Round start in waiting state is lever-only. Do not auto-start on player count.

gamemode adventure @a[tag=!mcbr_playing,gamemode=!spectator]
team join mcbr_lobby @a[tag=!mcbr_playing]

# Lobby host lever at 0 100 5.
execute if block 0 100 5 minecraft:lever[face=floor,facing=north,powered=true] if entity @a[tag=mcbr_host,x=0,y=100,z=5,distance=..3] run function mcbr:admin/start_game_from_lobby_lever
