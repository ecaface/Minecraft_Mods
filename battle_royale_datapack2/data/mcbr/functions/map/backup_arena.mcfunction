# Backup the expanded chest-route combat area used by the 50 candidate field chest system.
# Coordinates are relative to the dynamic center of the arena.

tellraw @a [{"text":"[mcbr] Arena backup 1/8: preparing chunks...","color":"aqua"}]

# 1. Summon temporary restore helper marker and move to configured center
execute positioned 0 60 0 run summon minecraft:marker ~ ~ ~ {Tags:["mcbr_restore_helper"]}
execute store result entity @e[type=minecraft:marker,tag=mcbr_restore_helper,limit=1] Pos[0] double 1 run scoreboard players get $arena_center_x mcbr.config
execute store result entity @e[type=minecraft:marker,tag=mcbr_restore_helper,limit=1] Pos[2] double 1 run scoreboard players get $arena_center_z mcbr.config

# 2. Force load the scanning and backup areas relative to the center
execute at @e[tag=mcbr_restore_helper,limit=1] run forceload add ~-72 ~-72 ~71 ~39
execute at @e[tag=mcbr_restore_helper,limit=1] run forceload add ~856 ~856 ~999 ~967

# 3. Clone bands from live to backup
# North Band
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-72 60 ~-72 ~-57 127 ~-57 ~856 60 ~856 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-56 60 ~-72 ~-41 127 ~-57 ~872 60 ~856 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-40 60 ~-72 ~-25 127 ~-57 ~888 60 ~856 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-24 60 ~-72 ~-9 127 ~-57 ~904 60 ~856 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-8 60 ~-72 ~7 127 ~-57 ~920 60 ~856 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~8 60 ~-72 ~23 127 ~-57 ~936 60 ~856 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~24 60 ~-72 ~39 127 ~-57 ~952 60 ~856 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~40 60 ~-72 ~55 127 ~-57 ~968 60 ~856 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~56 60 ~-72 ~71 127 ~-57 ~984 60 ~856 replace
tellraw @a [{"text":"[mcbr] Arena backup 2/8: north band copied.","color":"aqua"}]

# Upper-Mid Band
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-72 60 ~-56 ~-57 127 ~-41 ~856 60 ~872 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-56 60 ~-56 ~-41 127 ~-41 ~872 60 ~872 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-40 60 ~-56 ~-25 127 ~-41 ~888 60 ~872 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-24 60 ~-56 ~-9 127 ~-41 ~904 60 ~872 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-8 60 ~-56 ~7 127 ~-41 ~920 60 ~872 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~8 60 ~-56 ~23 127 ~-41 ~936 60 ~872 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~24 60 ~-56 ~39 127 ~-41 ~952 60 ~872 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~40 60 ~-56 ~55 127 ~-41 ~968 60 ~872 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~56 60 ~-56 ~71 127 ~-41 ~984 60 ~872 replace
tellraw @a [{"text":"[mcbr] Arena backup 3/8: upper-mid band copied.","color":"aqua"}]

# Center-North Band
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-72 60 ~-40 ~-57 127 ~-25 ~856 60 ~888 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-56 60 ~-40 ~-41 127 ~-25 ~872 60 ~888 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-40 60 ~-40 ~-25 127 ~-25 ~888 60 ~888 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-24 60 ~-40 ~-9 127 ~-25 ~904 60 ~888 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-8 60 ~-40 ~7 127 ~-25 ~920 60 ~888 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~8 60 ~-40 ~23 127 ~-25 ~936 60 ~888 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~24 60 ~-40 ~39 127 ~-25 ~952 60 ~888 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~40 60 ~-40 ~55 127 ~-25 ~968 60 ~888 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~56 60 ~-40 ~71 127 ~-25 ~984 60 ~888 replace
tellraw @a [{"text":"[mcbr] Arena backup 4/8: center-north band copied.","color":"aqua"}]

# Center Band
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-72 60 ~-24 ~-57 127 ~-9 ~856 60 ~904 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-56 60 ~-24 ~-41 127 ~-9 ~872 60 ~904 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-40 60 ~-24 ~-25 127 ~-9 ~888 60 ~904 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-24 60 ~-24 ~-9 127 ~-9 ~904 60 ~904 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-8 60 ~-24 ~7 127 ~-9 ~920 60 ~904 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~8 60 ~-24 ~23 127 ~-9 ~936 60 ~904 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~24 60 ~-24 ~39 127 ~-9 ~952 60 ~904 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~40 60 ~-24 ~55 127 ~-9 ~968 60 ~904 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~56 60 ~-24 ~71 127 ~-9 ~984 60 ~904 replace
tellraw @a [{"text":"[mcbr] Arena backup 5/8: center band copied.","color":"aqua"}]

# Center-South Band
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-72 60 ~-8 ~-57 127 ~7 ~856 60 ~920 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-56 60 ~-8 ~-41 127 ~7 ~872 60 ~920 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-40 60 ~-8 ~-25 127 ~7 ~888 60 ~920 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-24 60 ~-8 ~-9 127 ~7 ~904 60 ~920 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-8 60 ~-8 ~7 127 ~7 ~920 60 ~920 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~8 60 ~-8 ~23 127 ~7 ~936 60 ~920 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~24 60 ~-8 ~39 127 ~7 ~952 60 ~920 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~40 60 ~-8 ~55 127 ~7 ~968 60 ~920 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~56 60 ~-8 ~71 127 ~7 ~984 60 ~920 replace
tellraw @a [{"text":"[mcbr] Arena backup 6/8: center-south band copied.","color":"aqua"}]

# South Band (Z: 1008..1023)
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-72 60 ~8 ~-57 127 ~23 ~856 60 ~936 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-56 60 ~8 ~-41 127 ~23 ~872 60 ~936 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-40 60 ~8 ~-25 127 ~23 ~888 60 ~936 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-24 60 ~8 ~-9 127 ~23 ~904 60 ~936 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-8 60 ~8 ~7 127 ~23 ~920 60 ~936 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~8 60 ~8 ~23 127 ~23 ~936 60 ~936 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~24 60 ~8 ~39 127 ~23 ~952 60 ~936 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~40 60 ~8 ~55 127 ~23 ~968 60 ~936 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~56 60 ~8 ~71 127 ~23 ~984 60 ~936 replace
tellraw @a [{"text":"[mcbr] Arena backup 7/8: south band copied.","color":"aqua"}]

# Far-South Band (Z: 1024..1039)
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-72 60 ~24 ~-57 127 ~39 ~856 60 ~952 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-56 60 ~24 ~-41 127 ~39 ~872 60 ~952 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-40 60 ~24 ~-25 127 ~39 ~888 60 ~952 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-24 60 ~24 ~-9 127 ~39 ~904 60 ~952 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~-8 60 ~24 ~7 127 ~39 ~920 60 ~952 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~8 60 ~24 ~23 127 ~39 ~936 60 ~952 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~24 60 ~24 ~39 127 ~39 ~952 60 ~952 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~40 60 ~24 ~55 127 ~39 ~968 60 ~952 replace
execute at @e[tag=mcbr_restore_helper,limit=1] run clone ~56 60 ~24 ~71 127 ~39 ~984 60 ~952 replace
tellraw @a [{"text":"[mcbr] Arena backup 8/8: finalizing...","color":"aqua"}]

# 4. Clean up force load and helper marker
execute at @e[tag=mcbr_restore_helper,limit=1] run forceload remove ~-72 ~-72 ~71 ~39
execute at @e[tag=mcbr_restore_helper,limit=1] run forceload remove ~856 ~856 ~999 ~967
kill @e[tag=mcbr_restore_helper]

tellraw @a [{"text":"[mcbr] Arena backup region refreshed.","color":"aqua"}]
