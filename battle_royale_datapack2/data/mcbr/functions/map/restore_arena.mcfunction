# Restore the expanded chest-route combat area dynamically.
# Coordinates are relative to the dynamic center of the arena.

tellraw @a [{"text":"[mcbr] Arena restore 1/12: clearing dropped entities...","color":"aqua"}]

# 1. Summon temporary restore helper marker and move to configured center
execute positioned 0 60 0 run summon minecraft:marker ~ ~ ~ {Tags:["mcbr_restore_helper"]}
execute store result entity @e[type=minecraft:marker,tag=mcbr_restore_helper,limit=1] Pos[0] double 1 run scoreboard players get $arena_center_x mcbr.config
execute store result entity @e[type=minecraft:marker,tag=mcbr_restore_helper,limit=1] Pos[2] double 1 run scoreboard players get $arena_center_z mcbr.config

# 2. Clear dropped entities inside the dynamic combat border area (Z: -88..87, X: -88..87)
execute at @e[tag=mcbr_restore_helper,limit=1] positioned ~-88 60 ~-88 run kill @e[type=minecraft:item,dx=175,dy=67,dz=175]
execute at @e[tag=mcbr_restore_helper,limit=1] positioned ~-88 60 ~-88 run kill @e[type=minecraft:experience_orb,dx=175,dy=67,dz=175]
execute at @e[tag=mcbr_restore_helper,limit=1] positioned ~-88 60 ~-88 run kill @e[type=minecraft:arrow,dx=175,dy=67,dz=175]
execute at @e[tag=mcbr_restore_helper,limit=1] positioned ~-88 60 ~-88 run kill @e[type=minecraft:spectral_arrow,dx=175,dy=67,dz=175]
execute at @e[tag=mcbr_restore_helper,limit=1] positioned ~-88 60 ~-88 run kill @e[type=minecraft:trident,dx=175,dy=67,dz=175]

# 3. Force load the scanning and backup areas relative to the center
execute at @e[tag=mcbr_restore_helper,limit=1] run forceload add ~904 ~904 ~1064 ~1064
execute at @e[tag=mcbr_restore_helper,limit=1] run forceload add ~-88 ~-88 ~87 ~87

# Band 1: Northmost Z1 (Z: 904 -> -88..-73)
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~904 60 ~904 ~919 127 ~919 ~-88 60 ~-88 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~920 60 ~904 ~935 127 ~919 ~-72 60 ~-88 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~936 60 ~904 ~951 127 ~919 ~-56 60 ~-88 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~952 60 ~904 ~967 127 ~919 ~-40 60 ~-88 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~968 60 ~904 ~983 127 ~919 ~-24 60 ~-88 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~984 60 ~904 ~999 127 ~919 ~-8 60 ~-88 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1000 60 ~904 ~1015 127 ~919 ~8 60 ~-88 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1016 60 ~904 ~1031 127 ~919 ~24 60 ~-88 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1032 60 ~904 ~1047 127 ~919 ~40 60 ~-88 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1048 60 ~904 ~1063 127 ~919 ~56 60 ~-88 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1064 60 ~904 ~1079 127 ~919 ~72 60 ~-88 replace
tellraw @a [{"text":"[mcbr] Arena restore 2/12: Northmost Z1 band restored.","color":"aqua"}]

# Band 2: North Z2 (Z: 920 -> -72..-57)
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~904 60 ~920 ~919 127 ~935 ~-88 60 ~-72 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~920 60 ~920 ~935 127 ~935 ~-72 60 ~-72 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~936 60 ~920 ~951 127 ~935 ~-56 60 ~-72 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~952 60 ~920 ~967 127 ~935 ~-40 60 ~-72 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~968 60 ~920 ~983 127 ~935 ~-24 60 ~-72 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~984 60 ~920 ~999 127 ~935 ~-8 60 ~-72 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1000 60 ~920 ~1015 127 ~935 ~8 60 ~-72 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1016 60 ~920 ~1031 127 ~935 ~24 60 ~-72 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1032 60 ~920 ~1047 127 ~935 ~40 60 ~-72 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1048 60 ~920 ~1063 127 ~935 ~56 60 ~-72 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1064 60 ~920 ~1079 127 ~935 ~72 60 ~-72 replace
tellraw @a [{"text":"[mcbr] Arena restore 3/12: North Z2 band restored.","color":"aqua"}]

# Band 3: Upper-Mid-North Z3 (Z: 936 -> -56..-41)
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~904 60 ~936 ~919 127 ~951 ~-88 60 ~-56 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~920 60 ~936 ~935 127 ~951 ~-72 60 ~-56 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~936 60 ~936 ~951 127 ~951 ~-56 60 ~-56 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~952 60 ~936 ~967 127 ~951 ~-40 60 ~-56 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~968 60 ~936 ~983 127 ~951 ~-24 60 ~-56 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~984 60 ~936 ~999 127 ~951 ~-8 60 ~-56 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1000 60 ~936 ~1015 127 ~951 ~8 60 ~-56 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1016 60 ~936 ~1031 127 ~951 ~24 60 ~-56 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1032 60 ~936 ~1047 127 ~951 ~40 60 ~-56 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1048 60 ~936 ~1063 127 ~951 ~56 60 ~-56 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1064 60 ~936 ~1079 127 ~951 ~72 60 ~-56 replace
tellraw @a [{"text":"[mcbr] Arena restore 4/12: Upper-Mid-North Z3 band restored.","color":"aqua"}]

# Band 4: Upper-Mid Z4 (Z: 952 -> -40..-25)
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~904 60 ~952 ~919 127 ~967 ~-88 60 ~-40 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~920 60 ~952 ~935 127 ~967 ~-72 60 ~-40 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~936 60 ~952 ~951 127 ~967 ~-56 60 ~-40 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~952 60 ~952 ~967 127 ~967 ~-40 60 ~-40 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~968 60 ~952 ~983 127 ~967 ~-24 60 ~-40 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~984 60 ~952 ~999 127 ~967 ~-8 60 ~-40 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1000 60 ~952 ~1015 127 ~967 ~8 60 ~-40 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1016 60 ~952 ~1031 127 ~967 ~24 60 ~-40 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1032 60 ~952 ~1047 127 ~967 ~40 60 ~-40 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1048 60 ~952 ~1063 127 ~967 ~56 60 ~-40 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1064 60 ~952 ~1079 127 ~967 ~72 60 ~-40 replace
tellraw @a [{"text":"[mcbr] Arena restore 5/12: Upper-Mid Z4 band restored.","color":"aqua"}]

# Band 5: Center-North Z5 (Z: 968 -> -24..-9)
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~904 60 ~968 ~919 127 ~983 ~-88 60 ~-24 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~920 60 ~968 ~935 127 ~983 ~-72 60 ~-24 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~936 60 ~968 ~951 127 ~983 ~-56 60 ~-24 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~952 60 ~968 ~967 127 ~983 ~-40 60 ~-24 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~968 60 ~968 ~983 127 ~983 ~-24 60 ~-24 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~984 60 ~968 ~999 127 ~983 ~-8 60 ~-24 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1000 60 ~968 ~1015 127 ~983 ~8 60 ~-24 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1016 60 ~968 ~1031 127 ~983 ~24 60 ~-24 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1032 60 ~968 ~1047 127 ~983 ~40 60 ~-24 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1048 60 ~968 ~1063 127 ~983 ~56 60 ~-24 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1064 60 ~968 ~1079 127 ~983 ~72 60 ~-24 replace
tellraw @a [{"text":"[mcbr] Arena restore 6/12: Center-North Z5 band restored.","color":"aqua"}]

# Band 6: Center Z6 (Z: 984 -> -8..7)
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~904 60 ~984 ~919 127 ~999 ~-88 60 ~-8 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~920 60 ~984 ~935 127 ~999 ~-72 60 ~-8 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~936 60 ~984 ~951 127 ~999 ~-56 60 ~-8 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~952 60 ~984 ~967 127 ~999 ~-40 60 ~-8 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~968 60 ~984 ~983 127 ~999 ~-24 60 ~-8 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~984 60 ~984 ~999 127 ~999 ~-8 60 ~-8 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1000 60 ~984 ~1015 127 ~999 ~8 60 ~-8 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1016 60 ~984 ~1031 127 ~999 ~24 60 ~-8 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1032 60 ~984 ~1047 127 ~999 ~40 60 ~-8 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1048 60 ~984 ~1063 127 ~999 ~56 60 ~-8 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1064 60 ~984 ~1079 127 ~999 ~72 60 ~-8 replace
tellraw @a [{"text":"[mcbr] Arena restore 7/12: Center Z6 band restored.","color":"aqua"}]

# Band 7: Center-South Z7 (Z: 1000 -> 8..23)
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~904 60 ~1000 ~919 127 ~1015 ~-88 60 ~8 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~920 60 ~1000 ~935 127 ~1015 ~-72 60 ~8 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~936 60 ~1000 ~951 127 ~1015 ~-56 60 ~8 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~952 60 ~1000 ~967 127 ~1015 ~-40 60 ~8 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~968 60 ~1000 ~983 127 ~1015 ~-24 60 ~8 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~984 60 ~1000 ~999 127 ~1015 ~-8 60 ~8 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1000 60 ~1000 ~1015 127 ~1015 ~8 60 ~8 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1016 60 ~1000 ~1031 127 ~1015 ~24 60 ~8 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1032 60 ~1000 ~1047 127 ~1015 ~40 60 ~8 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1048 60 ~1000 ~1063 127 ~1015 ~56 60 ~8 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1064 60 ~1000 ~1079 127 ~1015 ~72 60 ~8 replace
tellraw @a [{"text":"[mcbr] Arena restore 8/12: Center-South Z7 band restored.","color":"aqua"}]

# Band 8: Lower-Mid Z8 (Z: 1016 -> 24..39)
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~904 60 ~1016 ~919 127 ~1031 ~-88 60 ~24 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~920 60 ~1016 ~935 127 ~1031 ~-72 60 ~24 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~936 60 ~1016 ~951 127 ~1031 ~-56 60 ~24 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~952 60 ~1016 ~967 127 ~1031 ~-40 60 ~24 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~968 60 ~1016 ~983 127 ~1031 ~-24 60 ~24 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~984 60 ~1016 ~999 127 ~1031 ~-8 60 ~24 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1000 60 ~1016 ~1015 127 ~1031 ~8 60 ~24 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1016 60 ~1016 ~1031 127 ~1031 ~24 60 ~24 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1032 60 ~1016 ~1047 127 ~1031 ~40 60 ~24 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1048 60 ~1016 ~1063 127 ~1031 ~56 60 ~24 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1064 60 ~1016 ~1079 127 ~1031 ~72 60 ~24 replace
tellraw @a [{"text":"[mcbr] Arena restore 9/12: Lower-Mid Z8 band restored.","color":"aqua"}]

# Band 9: Lower-Mid-South Z9 (Z: 1032 -> 40..55)
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~904 60 ~1032 ~919 127 ~1047 ~-88 60 ~40 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~920 60 ~1032 ~935 127 ~1047 ~-72 60 ~40 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~936 60 ~1032 ~951 127 ~1047 ~-56 60 ~40 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~952 60 ~1032 ~967 127 ~1047 ~-40 60 ~40 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~968 60 ~1032 ~983 127 ~1047 ~-24 60 ~40 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~984 60 ~1032 ~999 127 ~1047 ~-8 60 ~40 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1000 60 ~1032 ~1015 127 ~1047 ~8 60 ~40 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1016 60 ~1032 ~1031 127 ~1047 ~24 60 ~40 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1032 60 ~1032 ~1047 127 ~1047 ~40 60 ~40 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1048 60 ~1032 ~1063 127 ~1047 ~56 60 ~40 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1064 60 ~1032 ~1079 127 ~1047 ~72 60 ~40 replace
tellraw @a [{"text":"[mcbr] Arena restore 10/12: Lower-Mid-South Z9 band restored.","color":"aqua"}]

# Band 10: South Z10 (Z: 1048 -> 56..71)
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~904 60 ~1048 ~919 127 ~1063 ~-88 60 ~56 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~920 60 ~1048 ~935 127 ~1063 ~-72 60 ~56 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~936 60 ~1048 ~951 127 ~1063 ~-56 60 ~56 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~952 60 ~1048 ~967 127 ~1063 ~-40 60 ~56 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~968 60 ~1048 ~983 127 ~1063 ~-24 60 ~56 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~984 60 ~1048 ~999 127 ~1063 ~-8 60 ~56 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1000 60 ~1048 ~1015 127 ~1063 ~8 60 ~56 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1016 60 ~1048 ~1031 127 ~1063 ~24 60 ~56 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1032 60 ~1048 ~1047 127 ~1063 ~40 60 ~56 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1048 60 ~1048 ~1063 127 ~1063 ~56 60 ~56 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1064 60 ~1048 ~1079 127 ~1063 ~72 60 ~56 replace
tellraw @a [{"text":"[mcbr] Arena restore 11/12: South Z10 band restored.","color":"aqua"}]

# Band 11: Southmost Z11 (Z: 1064 -> 72..87)
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~904 60 ~1064 ~919 127 ~1079 ~-88 60 ~72 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~920 60 ~1064 ~935 127 ~1079 ~-72 60 ~72 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~936 60 ~1064 ~951 127 ~1079 ~-56 60 ~72 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~952 60 ~1064 ~967 127 ~1079 ~-40 60 ~72 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~968 60 ~1064 ~983 127 ~1079 ~-24 60 ~72 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~984 60 ~1064 ~999 127 ~1079 ~-8 60 ~72 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1000 60 ~1064 ~1015 127 ~1079 ~8 60 ~72 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1016 60 ~1064 ~1031 127 ~1079 ~24 60 ~72 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1032 60 ~1064 ~1047 127 ~1079 ~40 60 ~72 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1048 60 ~1064 ~1063 127 ~1079 ~56 60 ~72 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~1064 60 ~1064 ~1079 127 ~1079 ~72 60 ~72 replace
tellraw @a [{"text":"[mcbr] Arena restore 12/12: Southmost Z11 band restored.","color":"aqua"}]

# 5. Clean up force load, dropped items, and helper marker
execute at @e[tag=mcbr_restore_helper,limit=1] run forceload remove ~904 ~904 ~1064 ~1064
execute at @e[tag=mcbr_restore_helper,limit=1] run forceload remove ~-88 ~-88 ~87 ~87

execute at @e[tag=mcbr_restore_helper,limit=1] positioned ~-88 60 ~-88 run kill @e[type=minecraft:item,dx=175,dy=67,dz=175]
execute at @e[tag=mcbr_restore_helper,limit=1] positioned ~-88 60 ~-88 run kill @e[type=minecraft:experience_orb,dx=175,dy=67,dz=175]
execute at @e[tag=mcbr_restore_helper,limit=1] positioned ~-88 60 ~-88 run kill @e[type=minecraft:arrow,dx=175,dy=67,dz=175]
execute at @e[tag=mcbr_restore_helper,limit=1] positioned ~-88 60 ~-88 run kill @e[type=minecraft:spectral_arrow,dx=175,dy=67,dz=175]
execute at @e[tag=mcbr_restore_helper,limit=1] positioned ~-88 60 ~-88 run kill @e[type=minecraft:trident,dx=175,dy=67,dz=175]

kill @e[tag=mcbr_restore_helper]

execute if score $chest_refill_enabled mcbr.config matches 1 run function mcbr:core/refill_chests
tellraw @a [{"text":"[mcbr] Arena restored from backup region.","color":"aqua"}]
