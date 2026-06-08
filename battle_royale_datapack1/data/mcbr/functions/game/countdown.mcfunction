# Called every tick while state = countdown.

scoreboard players remove $countdown_ticks mcbr.timer 1

# Show a title once per second.
execute if score $countdown_ticks mcbr.timer matches 200 run title @a[tag=mcbr_playing] title {"text":"10","color":"gold"}
execute if score $countdown_ticks mcbr.timer matches 180 run title @a[tag=mcbr_playing] title {"text":"9","color":"gold"}
execute if score $countdown_ticks mcbr.timer matches 160 run title @a[tag=mcbr_playing] title {"text":"8","color":"gold"}
execute if score $countdown_ticks mcbr.timer matches 140 run title @a[tag=mcbr_playing] title {"text":"7","color":"gold"}
execute if score $countdown_ticks mcbr.timer matches 120 run title @a[tag=mcbr_playing] title {"text":"6","color":"gold"}
execute if score $countdown_ticks mcbr.timer matches 100 run title @a[tag=mcbr_playing] title {"text":"5","color":"gold"}
execute if score $countdown_ticks mcbr.timer matches 80 run title @a[tag=mcbr_playing] title {"text":"4","color":"gold"}
execute if score $countdown_ticks mcbr.timer matches 60 run title @a[tag=mcbr_playing] title {"text":"3","color":"red"}
execute if score $countdown_ticks mcbr.timer matches 40 run title @a[tag=mcbr_playing] title {"text":"2","color":"red"}
execute if score $countdown_ticks mcbr.timer matches 20 run title @a[tag=mcbr_playing] title {"text":"1","color":"red"}

execute if score $countdown_ticks mcbr.timer matches 200 run title @a[tag=mcbr_playing] subtitle {"text":"Prepare for deployment","color":"yellow"}
execute if score $countdown_ticks mcbr.timer matches 100 run title @a[tag=mcbr_playing] subtitle {"text":"Halfway there","color":"yellow"}
execute if score $countdown_ticks mcbr.timer matches 20 run title @a[tag=mcbr_playing] subtitle {"text":"Go on zero","color":"red"}

execute if score $countdown_ticks mcbr.timer matches 0 run function mcbr:game/spread_players
execute if score $countdown_ticks mcbr.timer matches 0 run function mcbr:game/begin_match
