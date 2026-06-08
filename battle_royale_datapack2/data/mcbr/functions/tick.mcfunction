# Main state dispatcher

execute as @a[tag=!mcbr_initialized] run function mcbr:player/init_player

execute if score $state mcbr.state matches 0 run function mcbr:state/waiting_tick
execute if score $state mcbr.state matches 1 run function mcbr:state/countdown_tick
execute if score $state mcbr.state matches 2 run function mcbr:state/in_game_tick
execute if score $state mcbr.state matches 3 run function mcbr:state/ended_tick

# Tick falling airdrops
execute if entity @e[type=minecraft:armor_stand,tag=mcbr_airdrop_dropper] run function mcbr:loot/airdrop_tick

