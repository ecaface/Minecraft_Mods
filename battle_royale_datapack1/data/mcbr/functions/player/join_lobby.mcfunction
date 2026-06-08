# Send a player to the lobby in a clean state.

tag @s remove mcbr_playing
tag @s remove mcbr_alive
scoreboard players set @s mcbr.alive 0
scoreboard players set @s mcbr.team 0
scoreboard players set @s mcbr.deaths 0
function mcbr:map/send_self_to_lobby
team join mcbr_lobby @s
