execute if score $state mcbr.state matches 0 at @e[type=minecraft:marker,tag=mcbr_lobby_spawn,limit=1] run setblock ~ ~ ~5 minecraft:lever[face=floor,facing=north,powered=false]
execute if score $state mcbr.state matches 0 run function mcbr:admin/start_game
