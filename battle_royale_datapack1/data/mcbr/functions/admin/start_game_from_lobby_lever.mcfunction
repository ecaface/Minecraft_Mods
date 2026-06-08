execute if score $state mcbr.state matches 0 run setblock 0 100 5 minecraft:lever[face=floor,facing=north,powered=false]
execute if score $state mcbr.state matches 0 run function mcbr:admin/start_game
