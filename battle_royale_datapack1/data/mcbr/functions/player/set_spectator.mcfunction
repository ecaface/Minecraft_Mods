# Eliminate a player from the active round.

scoreboard players set @s mcbr.alive 0
scoreboard players set @s mcbr.deaths 0
tag @s remove mcbr_alive
gamemode spectator @s
tellraw @a [{"text":"[mcbr] ","color":"gold"},{"selector":"@s","color":"red"},{"text":" was eliminated.","color":"gray"}]
