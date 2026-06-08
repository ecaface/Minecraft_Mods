tellraw @a [{"text":"[mcbr] Arena restore 2/5: restoring north-west region...","color":"aqua"}]
function mcbr:map/arena_clone_from_backup_q1
forceload remove 1856 1856 1999 1999
forceload remove 864 864 1007 1007
tellraw @a [{"text":"[mcbr] Arena restore 3/5: restoring north-east region...","color":"aqua"}]
forceload add 2000 1856 2143 1999
forceload add 1008 864 1151 1007
function mcbr:map/restore_arena_q2
