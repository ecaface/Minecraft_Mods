# Internal helper: the lobby was validated, so initialize the round.

scoreboard players set $state mcbr.state 1
scoreboard players set $twenty mcbr.tmp 20
scoreboard players operation $countdown_ticks_default mcbr.config = $countdown_seconds mcbr.config
scoreboard players operation $countdown_ticks_default mcbr.config *= $twenty mcbr.tmp
scoreboard players operation $countdown_ticks mcbr.timer = $countdown_ticks_default mcbr.config
scoreboard players set $end_lock mcbr.tmp 0

# Clear previous match state.
tag @a remove mcbr_playing
tag @a remove mcbr_alive
tag @a remove mcbr_next_pick
scoreboard players set @a mcbr.alive 0
scoreboard players set @a mcbr.team 0
scoreboard players set @a mcbr.deaths 0

# 최대 인원까지만 로그인 순서가 빠른 플레이어부터 참가자로 선정한다.
execute if score $max_players mcbr.config matches 1.. run function mcbr:player/pick_next_player_by_join_order
execute if score $max_players mcbr.config matches 2.. run function mcbr:player/pick_next_player_by_join_order
execute if score $max_players mcbr.config matches 3.. run function mcbr:player/pick_next_player_by_join_order
execute if score $max_players mcbr.config matches 4.. run function mcbr:player/pick_next_player_by_join_order
execute if score $max_players mcbr.config matches 5.. run function mcbr:player/pick_next_player_by_join_order
execute if score $max_players mcbr.config matches 6.. run function mcbr:player/pick_next_player_by_join_order
execute if score $max_players mcbr.config matches 7.. run function mcbr:player/pick_next_player_by_join_order
execute if score $max_players mcbr.config matches 8.. run function mcbr:player/pick_next_player_by_join_order

tag @a[tag=mcbr_playing] add mcbr_alive
scoreboard players set @a[tag=mcbr_playing] mcbr.alive 1
execute as @a[tag=mcbr_playing] run function mcbr:player/cleanup
execute as @a[tag=!mcbr_playing,gamemode=!spectator] run function mcbr:player/join_lobby

# Put participants in adventure during countdown so nobody starts fighting early.
gamemode adventure @a[tag=mcbr_playing]

tellraw @a [{"text":"[mcbr] Match countdown started.","color":"yellow"}]
title @a[tag=mcbr_playing] title {"text":"Battle Royale","color":"gold"}
title @a[tag=mcbr_playing] subtitle [{"text":"Match begins in ","color":"yellow"},{"score":{"name":"$countdown_seconds","objective":"mcbr.config"},"color":"gold"},{"text":" seconds","color":"yellow"}]
