# 경기 중 신규 접속자는 현재 판에 참가시키지 않고 관전자 대기 상태로 둔다.

tag @s remove mcbr_playing
tag @s remove mcbr_alive
scoreboard players set @s mcbr.alive 0
scoreboard players set @s mcbr.team 0
scoreboard players set @s mcbr.deaths 0
gamemode spectator @s
# Teleport to the dynamic combat center
execute positioned 0 120 0 run summon minecraft:marker ~ ~ ~ {Tags:["mcbr_spec_tp_temp"]}
execute store result entity @e[type=minecraft:marker,tag=mcbr_spec_tp_temp,limit=1] Pos[0] double 1 run scoreboard players get $center_x mcbr.config
execute store result entity @e[type=minecraft:marker,tag=mcbr_spec_tp_temp,limit=1] Pos[2] double 1 run scoreboard players get $center_z mcbr.config
tp @s @e[type=minecraft:marker,tag=mcbr_spec_tp_temp,limit=1]
kill @e[type=minecraft:marker,tag=mcbr_spec_tp_temp]
tellraw @s [{"text":"[mcbr] 경기가 진행 중입니다. 이번 판은 관전 상태로 대기합니다.","color":"yellow"}]
