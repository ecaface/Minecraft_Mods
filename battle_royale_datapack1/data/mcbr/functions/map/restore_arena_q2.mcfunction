function mcbr:map/arena_clone_from_backup_q2
forceload remove 2000 1856 2143 1999
forceload remove 1008 864 1151 1007
tellraw @a [{"text":"[mcbr] Arena restore 4/5: restoring south-west region...","color":"aqua"}]
forceload add 1856 2000 1999 2143
forceload add 864 1008 1007 1151
function mcbr:map/restore_arena_q3
