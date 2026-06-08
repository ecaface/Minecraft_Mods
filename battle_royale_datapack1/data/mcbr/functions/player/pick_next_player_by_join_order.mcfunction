# 참가자가 아닌 접속자 중 로그인 순서가 가장 빠른 1명을 뽑아 이번 판 참가자로 지정한다.

tag @a remove mcbr_next_pick

execute if entity @a[gamemode=!spectator,tag=!mcbr_playing,limit=1] store result score $next_join mcbr.tmp run scoreboard players get @a[gamemode=!spectator,tag=!mcbr_playing,limit=1] mcbr.join
execute as @a[gamemode=!spectator,tag=!mcbr_playing] if score @s mcbr.join < $next_join mcbr.tmp run scoreboard players operation $next_join mcbr.tmp = @s mcbr.join
execute as @a[gamemode=!spectator,tag=!mcbr_playing] if score @s mcbr.join = $next_join mcbr.tmp run tag @s add mcbr_next_pick
tag @a[tag=mcbr_next_pick,sort=arbitrary,limit=1] add mcbr_playing
tag @a remove mcbr_next_pick
