# Small delay before the round resets to lobby.

scoreboard players remove $end_ticks mcbr.timer 1
execute if score $end_ticks mcbr.timer matches ..0 run function mcbr:game/reset_game
