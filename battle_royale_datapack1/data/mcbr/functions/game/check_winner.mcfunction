# Count active survivors.

scoreboard players set $alive_count mcbr.tmp 0
execute as @a[tag=mcbr_playing,scores={mcbr.alive=1..}] run scoreboard players add $alive_count mcbr.tmp 1

execute if score $state mcbr.state matches 2 unless score $end_lock mcbr.tmp matches 1 if score $alive_count mcbr.tmp matches 1 unless score $solo_debug mcbr.debug matches 1 run function mcbr:game/end_game
execute if score $state mcbr.state matches 2 unless score $end_lock mcbr.tmp matches 1 if score $alive_count mcbr.tmp matches 0 run function mcbr:game/end_game
