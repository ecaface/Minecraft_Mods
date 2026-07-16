# Ensure combat center stays separated from the high-altitude lobby.

execute store success score mcbr_has_center_x mcbr.debug run scoreboard players get $center_x mcbr.config
execute store success score mcbr_has_center_z mcbr.debug run scoreboard players get $center_z mcbr.config
execute if score mcbr_has_center_x mcbr.debug matches 0 run scoreboard players operation $center_x mcbr.config = $lobby_x mcbr.config
execute if score mcbr_has_center_x mcbr.debug matches 0 run scoreboard players add $center_x mcbr.config 1000
execute if score mcbr_has_center_z mcbr.debug matches 0 run scoreboard players operation $center_z mcbr.config = $lobby_z mcbr.config
execute if score mcbr_has_center_z mcbr.debug matches 0 run scoreboard players add $center_z mcbr.config 1000

scoreboard players operation $combat_center_needs_fix mcbr.tmp = $center_x mcbr.config
scoreboard players operation $combat_center_needs_fix mcbr.tmp -= $lobby_x mcbr.config
execute if score $combat_center_needs_fix mcbr.tmp matches 0 run scoreboard players set $combat_center_needs_fix mcbr.tmp 1
execute unless score $combat_center_needs_fix mcbr.tmp matches 1 run scoreboard players set $combat_center_needs_fix mcbr.tmp 0

scoreboard players operation $combat_center_z_delta mcbr.tmp = $center_z mcbr.config
scoreboard players operation $combat_center_z_delta mcbr.tmp -= $lobby_z mcbr.config
execute unless score $combat_center_z_delta mcbr.tmp matches 0 run scoreboard players set $combat_center_needs_fix mcbr.tmp 0

execute if score $combat_center_needs_fix mcbr.tmp matches 1 run scoreboard players operation $center_x mcbr.config = $lobby_x mcbr.config
execute if score $combat_center_needs_fix mcbr.tmp matches 1 run scoreboard players add $center_x mcbr.config 1000
execute if score $combat_center_needs_fix mcbr.tmp matches 1 run scoreboard players operation $center_z mcbr.config = $lobby_z mcbr.config
execute if score $combat_center_needs_fix mcbr.tmp matches 1 run scoreboard players add $center_z mcbr.config 1000

scoreboard players operation $arena_center_x mcbr.config = $center_x mcbr.config
scoreboard players operation $arena_center_z mcbr.config = $center_z mcbr.config
