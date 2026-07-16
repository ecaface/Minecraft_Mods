# Hard deployment guard used immediately before starter chests are placed.

function mcbr:admin/ensure_combat_center
kill @e[type=minecraft:marker,tag=mcbr_deploy_center_temp]

execute positioned 0 200 0 run summon minecraft:marker ~ ~ ~ {Tags:["mcbr_deploy_center_temp"]}
execute store result entity @e[type=minecraft:marker,tag=mcbr_deploy_center_temp,limit=1] Pos[0] double 1 run scoreboard players get $center_x mcbr.config
execute store result entity @e[type=minecraft:marker,tag=mcbr_deploy_center_temp,limit=1] Pos[2] double 1 run scoreboard players get $center_z mcbr.config

effect give @a[tag=mcbr_playing] minecraft:slow_falling 15 0 true
tp @a[tag=mcbr_playing] @e[type=minecraft:marker,tag=mcbr_deploy_center_temp,limit=1]
execute at @e[type=minecraft:marker,tag=mcbr_deploy_center_temp,limit=1] run spreadplayers ~ ~ 1 64 false @a[tag=mcbr_playing]

kill @e[type=minecraft:marker,tag=mcbr_deploy_center_temp]
