# Dynamic candidates are scanned and permanently stored.
# No need to clear and re-summon fixed candidates.
function mcbr:map/forceload_arena
tellraw @a [{"text":"[mcbr] Using scanned terrain-adaptive chest candidates.","color":"yellow"}]
function mcbr:map/forceload_arena_remove

