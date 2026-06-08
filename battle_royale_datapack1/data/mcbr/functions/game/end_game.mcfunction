# End the match and announce the result.

scoreboard players set $end_lock mcbr.tmp 1
scoreboard players set $state mcbr.state 3
scoreboard players operation $end_ticks mcbr.timer = $end_ticks_default mcbr.config

# Freeze combat immediately so late damage cannot kill the winner during end delay.
gamemode adventure @a[tag=mcbr_playing,gamemode=!spectator]
effect give @a[tag=mcbr_playing,gamemode=!spectator] minecraft:resistance 10 255 true

tellraw @a [{"text":"[mcbr] Match ended.","color":"gold"}]
title @a title {"text":"Match Over","color":"gold"}

# Winner message if one player is still alive.
execute if entity @a[tag=mcbr_playing,scores={mcbr.alive=1..},limit=1] if score $alive_count mcbr.tmp matches 1 run tellraw @a [{"text":"[mcbr] Winner: ","color":"gold"},{"selector":"@a[tag=mcbr_playing,scores={mcbr.alive=1..},limit=1]","color":"green"}]

# Draw message if nobody survives.
execute if score $alive_count mcbr.tmp matches 0 run tellraw @a [{"text":"[mcbr] No winner this round.","color":"red"}]
