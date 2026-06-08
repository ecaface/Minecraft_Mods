# Backup the expanded chest-route combat area dynamically.
# Coordinates are relative to the dynamic center of the arena.

tellraw @a [{"text":"[mcbr] Arena backup 1/12: preparing chunks...","color":"aqua"}]

# 1. Summon temporary restore helper marker and move to configured center
execute positioned 0 60 0 run summon minecraft:marker ~ ~ ~ {Tags:["mcbr_restore_helper"]}
execute store result entity @e[type=minecraft:marker,tag=mcbr_restore_helper,limit=1] Pos[0] double 1 run scoreboard players get $arena_center_x mcbr.config
execute store result entity @e[type=minecraft:marker,tag=mcbr_restore_helper,limit=1] Pos[2] double 1 run scoreboard players get $arena_center_z mcbr.config

# 2. Force load the scanning and backup areas relative to the center
execute at @e[tag=mcbr_restore_helper,limit=1] run forceload add ~-88 ~-88 ~87 ~87
execute at @e[tag=mcbr_restore_helper,limit=1] run forceload add ~904 ~904 ~1064 ~1064

# Band 1: Northmost Z1 (Z: -88..-73 -> 904)
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-88 60 ~-88 ~-73 127 ~-73 ~904 60 ~904 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-72 60 ~-88 ~-57 127 ~-73 ~920 60 ~904 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-56 60 ~-88 ~-41 127 ~-73 ~936 60 ~904 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-40 60 ~-88 ~-25 127 ~-73 ~952 60 ~904 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-24 60 ~-88 ~-9 127 ~-73 ~968 60 ~904 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-8 60 ~-88 ~7 127 ~-73 ~984 60 ~904 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~8 60 ~-88 ~23 127 ~-73 ~1000 60 ~904 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~24 60 ~-88 ~39 127 ~-73 ~1016 60 ~904 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~40 60 ~-88 ~55 127 ~-73 ~1032 60 ~904 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~56 60 ~-88 ~71 127 ~-73 ~1048 60 ~904 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~72 60 ~-88 ~87 127 ~-73 ~1064 60 ~904 replace
tellraw @a [{"text":"[mcbr] Arena backup 2/12: Northmost Z1 band copied.","color":"aqua"}]

# Band 2: North Z2 (Z: -72..-57 -> 920)
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-88 60 ~-72 ~-73 127 ~-57 ~904 60 ~920 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-72 60 ~-72 ~-57 127 ~-57 ~920 60 ~920 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-56 60 ~-72 ~-41 127 ~-57 ~936 60 ~920 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-40 60 ~-72 ~-25 127 ~-57 ~952 60 ~920 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-24 60 ~-72 ~-9 127 ~-57 ~968 60 ~920 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-8 60 ~-72 ~7 127 ~-57 ~984 60 ~920 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~8 60 ~-72 ~23 127 ~-57 ~1000 60 ~920 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~24 60 ~-72 ~39 127 ~-57 ~1016 60 ~920 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~40 60 ~-72 ~55 127 ~-57 ~1032 60 ~920 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~56 60 ~-72 ~71 127 ~-57 ~1048 60 ~920 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~72 60 ~-72 ~87 127 ~-57 ~1064 60 ~920 replace
tellraw @a [{"text":"[mcbr] Arena backup 3/12: North Z2 band copied.","color":"aqua"}]

# Band 3: Upper-Mid-North Z3 (Z: -56..-41 -> 936)
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-88 60 ~-56 ~-73 127 ~-41 ~904 60 ~936 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-72 60 ~-56 ~-57 127 ~-41 ~920 60 ~936 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-56 60 ~-56 ~-41 127 ~-41 ~936 60 ~936 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-40 60 ~-56 ~-25 127 ~-41 ~952 60 ~936 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-24 60 ~-56 ~-9 127 ~-41 ~968 60 ~936 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-8 60 ~-56 ~7 127 ~-41 ~984 60 ~936 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~8 60 ~-56 ~23 127 ~-41 ~1000 60 ~936 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~24 60 ~-56 ~39 127 ~-41 ~1016 60 ~936 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~40 60 ~-56 ~55 127 ~-41 ~1032 60 ~936 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~56 60 ~-56 ~71 127 ~-41 ~1048 60 ~936 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~72 60 ~-56 ~87 127 ~-41 ~1064 60 ~936 replace
tellraw @a [{"text":"[mcbr] Arena backup 4/12: Upper-Mid-North Z3 band copied.","color":"aqua"}]

# Band 4: Upper-Mid Z4 (Z: -40..-25 -> 952)
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-88 60 ~-40 ~-73 127 ~-25 ~904 60 ~952 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-72 60 ~-40 ~-57 127 ~-25 ~920 60 ~952 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-56 60 ~-40 ~-41 127 ~-25 ~936 60 ~952 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-40 60 ~-40 ~-25 127 ~-25 ~952 60 ~952 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-24 60 ~-40 ~-9 127 ~-25 ~968 60 ~952 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-8 60 ~-40 ~7 127 ~-25 ~984 60 ~952 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~8 60 ~-40 ~23 127 ~-25 ~1000 60 ~952 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~24 60 ~-40 ~39 127 ~-25 ~1016 60 ~952 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~40 60 ~-40 ~55 127 ~-25 ~1032 60 ~952 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~56 60 ~-40 ~71 127 ~-25 ~1048 60 ~952 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~72 60 ~-40 ~87 127 ~-25 ~1064 60 ~952 replace
tellraw @a [{"text":"[mcbr] Arena backup 5/12: Upper-Mid Z4 band copied.","color":"aqua"}]

# Band 5: Center-North Z5 (Z: -24..-9 -> 968)
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-88 60 ~-24 ~-73 127 ~-9 ~904 60 ~968 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-72 60 ~-24 ~-57 127 ~-9 ~920 60 ~968 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-56 60 ~-24 ~-41 127 ~-9 ~936 60 ~968 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-40 60 ~-24 ~-25 127 ~-9 ~952 60 ~968 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-24 60 ~-24 ~-9 127 ~-9 ~968 60 ~968 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-8 60 ~-24 ~7 127 ~-9 ~984 60 ~968 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~8 60 ~-24 ~23 127 ~-9 ~1000 60 ~968 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~24 60 ~-24 ~39 127 ~-9 ~1016 60 ~968 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~40 60 ~-24 ~55 127 ~-9 ~1032 60 ~968 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~56 60 ~-24 ~71 127 ~-9 ~1048 60 ~968 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~72 60 ~-24 ~87 127 ~-9 ~1064 60 ~968 replace
tellraw @a [{"text":"[mcbr] Arena backup 6/12: Center-North Z5 band copied.","color":"aqua"}]

# Band 6: Center Z6 (Z: -8..7 -> 984)
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-88 60 ~-8 ~-73 127 ~7 ~904 60 ~984 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-72 60 ~-8 ~-57 127 ~7 ~920 60 ~984 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-56 60 ~-8 ~-41 127 ~7 ~936 60 ~984 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-40 60 ~-8 ~-25 127 ~7 ~952 60 ~984 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-24 60 ~-8 ~-9 127 ~7 ~968 60 ~984 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-8 60 ~-8 ~7 127 ~7 ~984 60 ~984 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~8 60 ~-8 ~23 127 ~7 ~1000 60 ~984 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~24 60 ~-8 ~39 127 ~7 ~1016 60 ~984 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~40 60 ~-8 ~55 127 ~7 ~1032 60 ~984 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~56 60 ~-8 ~71 127 ~7 ~1048 60 ~984 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~72 60 ~-8 ~87 127 ~7 ~1064 60 ~984 replace
tellraw @a [{"text":"[mcbr] Arena backup 7/12: Center Z6 band copied.","color":"aqua"}]

# Band 7: Center-South Z7 (Z: 8..23 -> 1000)
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-88 60 ~8 ~-73 127 ~23 ~904 60 ~1000 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-72 60 ~8 ~-57 127 ~23 ~920 60 ~1000 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-56 60 ~8 ~-41 127 ~23 ~936 60 ~1000 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-40 60 ~8 ~-25 127 ~23 ~952 60 ~1000 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-24 60 ~8 ~-9 127 ~23 ~968 60 ~1000 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-8 60 ~8 ~7 127 ~23 ~984 60 ~1000 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~8 60 ~8 ~23 127 ~23 ~1000 60 ~1000 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~24 60 ~8 ~39 127 ~23 ~1016 60 ~1000 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~40 60 ~8 ~55 127 ~23 ~1032 60 ~1000 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~56 60 ~8 ~71 127 ~23 ~1048 60 ~1000 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~72 60 ~8 ~87 127 ~23 ~1064 60 ~1000 replace
tellraw @a [{"text":"[mcbr] Arena backup 8/12: Center-South Z7 band copied.","color":"aqua"}]

# Band 8: Lower-Mid Z8 (Z: 24..39 -> 1016)
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-88 60 ~24 ~-73 127 ~39 ~904 60 ~1016 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-72 60 ~24 ~-57 127 ~39 ~920 60 ~1016 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-56 60 ~24 ~-41 127 ~39 ~936 60 ~1016 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-40 60 ~24 ~-25 127 ~39 ~952 60 ~1016 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-24 60 ~24 ~-9 127 ~39 ~968 60 ~1016 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-8 60 ~24 ~7 127 ~39 ~984 60 ~1016 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~8 60 ~24 ~23 127 ~39 ~1000 60 ~1016 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~24 60 ~24 ~39 127 ~39 ~1016 60 ~1016 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~40 60 ~24 ~55 127 ~39 ~1032 60 ~1016 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~56 60 ~24 ~71 127 ~39 ~1048 60 ~1016 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~72 60 ~24 ~87 127 ~39 ~1064 60 ~1016 replace
tellraw @a [{"text":"[mcbr] Arena backup 9/12: Lower-Mid Z8 band copied.","color":"aqua"}]

# Band 9: Lower-Mid-South Z9 (Z: 40..55 -> 1032)
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-88 60 ~40 ~-73 127 ~55 ~904 60 ~1032 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-72 60 ~40 ~-57 127 ~55 ~920 60 ~1032 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-56 60 ~40 ~-41 127 ~55 ~936 60 ~1032 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-40 60 ~40 ~-25 127 ~55 ~952 60 ~1032 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-24 60 ~40 ~-9 127 ~55 ~968 60 ~1032 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-8 60 ~40 ~7 127 ~55 ~984 60 ~1032 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~8 60 ~40 ~23 127 ~55 ~1000 60 ~1032 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~24 60 ~40 ~39 127 ~55 ~1016 60 ~1032 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~40 60 ~40 ~55 127 ~55 ~1032 60 ~1032 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~56 60 ~40 ~71 127 ~55 ~1048 60 ~1032 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~72 60 ~40 ~87 127 ~55 ~1064 60 ~1032 replace
tellraw @a [{"text":"[mcbr] Arena backup 10/12: Lower-Mid-South Z9 band copied.","color":"aqua"}]

# Band 10: South Z10 (Z: 56..71 -> 1048)
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-88 60 ~56 ~-73 127 ~71 ~904 60 ~1048 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-72 60 ~56 ~-57 127 ~71 ~920 60 ~1048 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-56 60 ~56 ~-41 127 ~71 ~936 60 ~1048 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-40 60 ~56 ~-25 127 ~71 ~952 60 ~1048 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-24 60 ~56 ~-9 127 ~71 ~968 60 ~1048 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-8 60 ~56 ~7 127 ~71 ~984 60 ~1048 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~8 60 ~56 ~23 127 ~71 ~1000 60 ~1048 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~24 60 ~56 ~39 127 ~71 ~1016 60 ~1048 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~40 60 ~56 ~55 127 ~71 ~1032 60 ~1048 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~56 60 ~56 ~71 127 ~71 ~1048 60 ~1048 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~72 60 ~56 ~87 127 ~71 ~1064 60 ~1048 replace
tellraw @a [{"text":"[mcbr] Arena backup 11/12: South Z10 band copied.","color":"aqua"}]

# Band 11: Southmost Z11 (Z: 72..87 -> 1064)
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-88 60 ~72 ~-73 127 ~87 ~904 60 ~1064 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-72 60 ~72 ~-57 127 ~87 ~920 60 ~1064 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-56 60 ~72 ~-41 127 ~87 ~936 60 ~1064 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-40 60 ~72 ~-25 127 ~87 ~952 60 ~1064 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-24 60 ~72 ~-9 127 ~87 ~968 60 ~1064 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-8 60 ~72 ~7 127 ~87 ~984 60 ~1064 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~8 60 ~72 ~23 127 ~87 ~1000 60 ~1064 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~24 60 ~72 ~39 127 ~87 ~1016 60 ~1064 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~40 60 ~72 ~55 127 ~87 ~1032 60 ~1064 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~56 60 ~72 ~71 127 ~87 ~1048 60 ~1064 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~72 60 ~72 ~87 127 ~87 ~1064 60 ~1064 replace
tellraw @a [{"text":"[mcbr] Arena backup 12/12: Southmost Z11 band copied.","color":"aqua"}]

# 4. Clean up force load and helper marker
execute at @e[tag=mcbr_restore_helper,limit=1] run forceload remove ~-88 ~-88 ~87 ~87
execute at @e[tag=mcbr_restore_helper,limit=1] run forceload remove ~904 ~904 ~1064 ~1064
kill @e[tag=mcbr_restore_helper]

tellraw @a [{"text":"[mcbr] Arena backup region refreshed.","color":"aqua"}]
