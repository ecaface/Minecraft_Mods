# End the match and announce the result.

scoreboard players set $end_lock mcbr.tmp 1
scoreboard players set $state mcbr.state 3
scoreboard players operation $end_ticks mcbr.timer = $end_ticks_default mcbr.config

# Freeze combat immediately so late damage cannot kill the winner during end delay.
gamemode adventure @a[tag=mcbr_playing,gamemode=!spectator]
effect give @a[tag=mcbr_playing,gamemode=!spectator] minecraft:resistance 10 255 true

tellraw @a [{"text":"[mcbr] Match ended.","color":"gold"}]
title @a title {"text":"Match Over","color":"gold"}

# Award one win point before returning players to the lobby.
execute if score $team_mode mcbr.config matches 0 if score $alive_count mcbr.tmp matches 1 as @a[tag=mcbr_playing,scores={mcbr.alive=1..},limit=1] run scoreboard players add @s mcbr.wins 1
execute if score $team_mode mcbr.config matches 1 if score $alive_teams_count mcbr.tmp matches 1 as @a[tag=mcbr_playing,scores={mcbr.alive=1..}] run scoreboard players add @s mcbr.wins 1

# Winner message if one player/team is still alive.
# A. Solo mode winner message
execute if score $team_mode mcbr.config matches 0 if entity @a[tag=mcbr_playing,scores={mcbr.alive=1..},limit=1] if score $alive_count mcbr.tmp matches 1 run tellraw @a [{"text":"[mcbr] Winner: ","color":"gold"},{"selector":"@a[tag=mcbr_playing,scores={mcbr.alive=1..},limit=1]","color":"green"}]

# B. Team mode winner message
execute if score $team_mode mcbr.config matches 1 if score $alive_teams_count mcbr.tmp matches 1 if entity @a[tag=mcbr_playing,scores={mcbr.alive=1..},team=mcbr_team_1,limit=1] run tellraw @a [{"text":"[mcbr] Winning Team: ","color":"gold"},{"text":"Red Team","color":"red"}]
execute if score $team_mode mcbr.config matches 1 if score $alive_teams_count mcbr.tmp matches 1 if entity @a[tag=mcbr_playing,scores={mcbr.alive=1..},team=mcbr_team_2,limit=1] run tellraw @a [{"text":"[mcbr] Winning Team: ","color":"gold"},{"text":"Blue Team","color":"blue"}]

# Draw message if nobody survives.
execute if score $team_mode mcbr.config matches 0 if score $alive_count mcbr.tmp matches 0 run tellraw @a [{"text":"[mcbr] No winner this round.","color":"red"}]
execute if score $team_mode mcbr.config matches 1 if score $alive_teams_count mcbr.tmp matches 0 run tellraw @a [{"text":"[mcbr] No winning team this round.","color":"red"}]
