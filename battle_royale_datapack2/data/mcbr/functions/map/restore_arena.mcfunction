# Restore the expanded chest-route combat area used by the 50 candidate field chest system.
# Coordinates are relative to the dynamic center of the arena.

tellraw @a [{"text":"[mcbr] Arena restore 1/8: clearing dropped entities...","color":"aqua"}]

# 1. Summon temporary restore helper marker and move to configured center
execute positioned 0 60 0 run summon minecraft:marker ~ ~ ~ {Tags:["mcbr_restore_helper"]}
execute store result entity @e[type=minecraft:marker,tag=mcbr_restore_helper,limit=1] Pos[0] double 1 run scoreboard players get $arena_center_x mcbr.config
execute store result entity @e[type=minecraft:marker,tag=mcbr_restore_helper,limit=1] Pos[2] double 1 run scoreboard players get $arena_center_z mcbr.config

# 2. Clear dropped entities inside the dynamic combat border area
execute at @e[tag=mcbr_restore_helper,limit=1] positioned ~-142 60 ~-142 run kill @e[type=minecraft:item,dx=284,dy=67,dz=284]
execute at @e[tag=mcbr_restore_helper,limit=1] positioned ~-142 60 ~-142 run kill @e[type=minecraft:experience_orb,dx=284,dy=67,dz=284]
execute at @e[tag=mcbr_restore_helper,limit=1] positioned ~-142 60 ~-142 run kill @e[type=minecraft:arrow,dx=284,dy=67,dz=284]
execute at @e[tag=mcbr_restore_helper,limit=1] positioned ~-142 60 ~-142 run kill @e[type=minecraft:spectral_arrow,dx=284,dy=67,dz=284]
execute at @e[tag=mcbr_restore_helper,limit=1] positioned ~-142 60 ~-142 run kill @e[type=minecraft:trident,dx=284,dy=67,dz=284]

# 3. Force load the scanning and backup areas relative to the center
execute at @e[tag=mcbr_restore_helper,limit=1] run forceload add ~856 ~856 ~999 ~967
execute at @e[tag=mcbr_restore_helper,limit=1] run forceload add ~-72 ~-72 ~71 ~39

# 4. Clone bands back from backup to live
# North Band
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~856 60 ~856 ~871 127 ~871 ~-72 60 ~-72 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~872 60 ~856 ~887 127 ~871 ~-56 60 ~-72 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~888 60 ~856 ~903 127 ~871 ~-40 60 ~-72 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~904 60 ~856 ~919 127 ~871 ~-24 60 ~-72 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~920 60 ~856 ~935 127 ~871 ~-8 60 ~-72 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~936 60 ~856 ~951 127 ~871 ~8 60 ~-72 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~952 60 ~856 ~967 127 ~871 ~24 60 ~-72 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~968 60 ~856 ~983 127 ~871 ~40 60 ~-72 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~984 60 ~856 ~999 127 ~871 ~56 60 ~-72 replace
tellraw @a [{"text":"[mcbr] Arena restore 2/8: north band restored.","color":"aqua"}]

# Upper-Mid Band
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~856 60 ~872 ~871 127 ~887 ~-72 60 ~-56 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~872 60 ~872 ~887 127 ~887 ~-56 60 ~-56 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~888 60 ~872 ~903 127 ~887 ~-40 60 ~-56 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~904 60 ~872 ~919 127 ~887 ~-24 60 ~-56 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~920 60 ~872 ~935 127 ~887 ~-8 60 ~-56 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~936 60 ~872 ~951 127 ~887 ~8 60 ~-56 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~952 60 ~872 ~967 127 ~887 ~24 60 ~-56 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~968 60 ~872 ~983 127 ~887 ~40 60 ~-56 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~984 60 ~872 ~999 127 ~887 ~56 60 ~-56 replace
tellraw @a [{"text":"[mcbr] Arena restore 3/8: upper-mid band restored.","color":"aqua"}]

# Center-North Band
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~856 60 ~888 ~871 127 ~903 ~-72 60 ~-40 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~872 60 ~888 ~887 127 ~903 ~-56 60 ~-40 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~888 60 ~888 ~903 127 ~903 ~-40 60 ~-40 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~904 60 ~888 ~919 127 ~903 ~-24 60 ~-40 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~920 60 ~888 ~935 127 ~903 ~-8 60 ~-40 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~936 60 ~888 ~951 127 ~903 ~8 60 ~-40 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~952 60 ~888 ~967 127 ~903 ~24 60 ~-40 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~968 60 ~888 ~983 127 ~903 ~40 60 ~-40 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~984 60 ~888 ~999 127 ~903 ~56 60 ~-40 replace
tellraw @a [{"text":"[mcbr] Arena restore 4/8: center-north band restored.","color":"aqua"}]

# Center Band
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~856 60 ~904 ~871 127 ~919 ~-72 60 ~-24 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~872 60 ~904 ~887 127 ~919 ~-56 60 ~-24 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~888 60 ~904 ~903 127 ~919 ~-40 60 ~-24 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~904 60 ~904 ~919 127 ~919 ~-24 60 ~-24 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~920 60 ~904 ~935 127 ~919 ~-8 60 ~-24 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~936 60 ~904 ~951 127 ~919 ~8 60 ~-24 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~952 60 ~904 ~967 127 ~919 ~24 60 ~-24 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~968 60 ~904 ~983 127 ~919 ~40 60 ~-24 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~984 60 ~904 ~999 127 ~919 ~56 60 ~-24 replace
tellraw @a [{"text":"[mcbr] Arena restore 5/8: center band restored.","color":"aqua"}]

# Center-South Band
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~856 60 ~920 ~871 127 ~935 ~-72 60 ~-8 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~872 60 ~920 ~887 127 ~935 ~-56 60 ~-8 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~888 60 ~920 ~903 127 ~935 ~-40 60 ~-8 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~904 60 ~920 ~919 127 ~935 ~-24 60 ~-8 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~920 60 ~920 ~935 127 ~935 ~-8 60 ~-8 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~936 60 ~920 ~951 127 ~935 ~8 60 ~-8 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~952 60 ~920 ~967 127 ~935 ~24 60 ~-8 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~968 60 ~920 ~983 127 ~935 ~40 60 ~-8 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~984 60 ~920 ~999 127 ~935 ~56 60 ~-8 replace
tellraw @a [{"text":"[mcbr] Arena restore 6/8: center-south band restored.","color":"aqua"}]

# South Band (Z: 1008..1023)
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~856 60 ~936 ~871 127 ~951 ~-72 60 ~8 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~872 60 ~936 ~887 127 ~951 ~-56 60 ~8 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~888 60 ~936 ~903 127 ~951 ~-40 60 ~8 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~904 60 ~936 ~919 127 ~951 ~-24 60 ~8 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~920 60 ~936 ~935 127 ~951 ~-8 60 ~8 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~936 60 ~936 ~951 127 ~951 ~8 60 ~8 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~952 60 ~936 ~967 127 ~951 ~24 60 ~8 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~968 60 ~936 ~983 127 ~951 ~40 60 ~8 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~984 60 ~936 ~999 127 ~951 ~56 60 ~8 replace
tellraw @a [{"text":"[mcbr] Arena restore 7/8: south band restored.","color":"aqua"}]

# Far-South Band (Z: 1024..1039)
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~856 60 ~952 ~871 127 ~967 ~-72 60 ~24 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~872 60 ~952 ~887 127 ~967 ~-56 60 ~24 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~888 60 ~952 ~903 127 ~967 ~-40 60 ~24 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~904 60 ~952 ~919 127 ~967 ~-24 60 ~24 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~920 60 ~952 ~935 127 ~967 ~-8 60 ~24 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~936 60 ~952 ~951 127 ~967 ~8 60 ~24 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~952 60 ~952 ~967 127 ~967 ~24 60 ~24 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~968 60 ~952 ~983 127 ~967 ~40 60 ~24 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~984 60 ~952 ~999 127 ~967 ~56 60 ~24 replace
tellraw @a [{"text":"[mcbr] Arena restore 8/8: final cleanup and chest refill...","color":"aqua"}]

# 5. Clean up force load, dropped items, and helper marker
execute at @e[tag=mcbr_restore_helper,limit=1] run forceload remove ~856 ~856 ~999 ~967
execute at @e[tag=mcbr_restore_helper,limit=1] run forceload remove ~-72 ~-72 ~71 ~39

execute at @e[tag=mcbr_restore_helper,limit=1] positioned ~-142 60 ~-142 run kill @e[type=minecraft:item,dx=284,dy=67,dz=284]
execute at @e[tag=mcbr_restore_helper,limit=1] positioned ~-142 60 ~-142 run kill @e[type=minecraft:experience_orb,dx=284,dy=67,dz=284]
execute at @e[tag=mcbr_restore_helper,limit=1] positioned ~-142 60 ~-142 run kill @e[type=minecraft:arrow,dx=284,dy=67,dz=284]
execute at @e[tag=mcbr_restore_helper,limit=1] positioned ~-142 60 ~-142 run kill @e[type=minecraft:spectral_arrow,dx=284,dy=67,dz=284]
execute at @e[tag=mcbr_restore_helper,limit=1] positioned ~-142 60 ~-142 run kill @e[type=minecraft:trident,dx=284,dy=67,dz=284]

kill @e[tag=mcbr_restore_helper]

execute if score $chest_refill_enabled mcbr.config matches 1 run function mcbr:core/refill_chests
tellraw @a [{"text":"[mcbr] Arena restored from backup region.","color":"aqua"}]
