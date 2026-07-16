# Set lobby and combat coordinates from the executing player's current position.

execute store result score $spawn_x mcbr.tmp run data get entity @s Pos[0]
execute store result score $spawn_z mcbr.tmp run data get entity @s Pos[2]

scoreboard players operation $lobby_x mcbr.config = $spawn_x mcbr.tmp
scoreboard players set $lobby_y mcbr.config 240
scoreboard players operation $lobby_z mcbr.config = $spawn_z mcbr.tmp

scoreboard players operation $center_x mcbr.config = $spawn_x mcbr.tmp
scoreboard players add $center_x mcbr.config 1000
scoreboard players operation $center_z mcbr.config = $spawn_z mcbr.tmp
scoreboard players add $center_z mcbr.config 1000

scoreboard players operation $arena_center_x mcbr.config = $center_x mcbr.config
scoreboard players operation $arena_center_z mcbr.config = $center_z mcbr.config
