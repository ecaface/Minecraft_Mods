# Count active survivors.
scoreboard players set $alive_count mcbr.tmp 0
execute as @a[tag=mcbr_playing,scores={mcbr.alive=1..}] run scoreboard players add $alive_count mcbr.tmp 1

# Check team survival if team mode is enabled.
scoreboard players set $alive_teams_count mcbr.tmp 0
execute if score $team_mode mcbr.config matches 1 if entity @a[tag=mcbr_playing,scores={mcbr.alive=1..},team=mcbr_team_1] run scoreboard players add $alive_teams_count mcbr.tmp 1
execute if score $team_mode mcbr.config matches 1 if entity @a[tag=mcbr_playing,scores={mcbr.alive=1..},team=mcbr_team_2] run scoreboard players add $alive_teams_count mcbr.tmp 1

# End game condition check
# A. Solo mode end checks
execute if score $team_mode mcbr.config matches 0 if score $state mcbr.state matches 2 unless score $end_lock mcbr.tmp matches 1 if score $alive_count mcbr.tmp matches 1 unless score $solo_debug mcbr.debug matches 1 run function mcbr:game/end_game
execute if score $team_mode mcbr.config matches 0 if score $state mcbr.state matches 2 unless score $end_lock mcbr.tmp matches 1 if score $alive_count mcbr.tmp matches 0 run function mcbr:game/end_game

# B. Team mode end checks
execute if score $team_mode mcbr.config matches 1 if score $state mcbr.state matches 2 unless score $end_lock mcbr.tmp matches 1 if score $alive_teams_count mcbr.tmp matches 1 unless score $solo_debug mcbr.debug matches 1 run function mcbr:game/end_game
execute if score $team_mode mcbr.config matches 1 if score $state mcbr.state matches 2 unless score $end_lock mcbr.tmp matches 1 if score $alive_teams_count mcbr.tmp matches 0 run function mcbr:game/end_game
