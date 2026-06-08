# 경기 중 신규 접속자는 현재 판에 참가시키지 않고 관전자 대기 상태로 둔다.

tag @s remove mcbr_playing
tag @s remove mcbr_alive
scoreboard players set @s mcbr.alive 0
scoreboard players set @s mcbr.team 0
scoreboard players set @s mcbr.deaths 0
gamemode spectator @s
tp @s 1000 120 1000
tellraw @s [{"text":"[mcbr] 경기가 진행 중입니다. 이번 판은 관전 상태로 대기합니다.","color":"yellow"}]
