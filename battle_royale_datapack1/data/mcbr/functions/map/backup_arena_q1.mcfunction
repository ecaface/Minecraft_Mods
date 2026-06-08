tellraw @a [{"text":"[mcbr] Arena backup 2/5: copying north-west region...","color":"aqua"}]
function mcbr:map/arena_clone_to_backup_q1
forceload remove 864 864 1007 1007
forceload remove 1856 1856 1999 1999
tellraw @a [{"text":"[mcbr] Arena backup 3/5: copying north-east region...","color":"aqua"}]
forceload add 1008 864 1151 1007
forceload add 2000 1856 2143 1999
function mcbr:map/backup_arena_q2
