# Backup the full initial match-border combat area.
# Live arena:   x 864..1151, y 60..127, z 864..1151
# Backup arena: x 1856..2143, y 60..127, z 1856..2143

tellraw @a [{"text":"[mcbr] Arena backup 1/5: loading north-west region...","color":"aqua"}]
forceload add 864 864 1007 1007
forceload add 1856 1856 1999 1999
function mcbr:map/backup_arena_q1
