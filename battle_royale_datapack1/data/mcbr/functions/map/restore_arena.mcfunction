# Restore the full initial match-border combat area.
# Live arena:   x 864..1151, y 60..127, z 864..1151
# Backup arena: x 1856..2143, y 60..127, z 1856..2143

tellraw @a [{"text":"[mcbr] Arena restore 1/5: loading north-west region...","color":"aqua"}]
forceload add 1856 1856 1999 1999
forceload add 864 864 1007 1007
function mcbr:map/restore_arena_q1
