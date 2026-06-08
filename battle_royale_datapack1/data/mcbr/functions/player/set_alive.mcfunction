# Mark a player as an active participant.

tag @s add mcbr_playing
tag @s add mcbr_alive
scoreboard players set @s mcbr.alive 1
scoreboard players set @s mcbr.deaths 0
gamemode survival @s
