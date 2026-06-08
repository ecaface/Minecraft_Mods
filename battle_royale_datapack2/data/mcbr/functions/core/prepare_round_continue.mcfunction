# Unified round preparation continuation.
# Runs one tick after prepare_round so the preloaded match-area chunks expose cleanup targets reliably.

function mcbr:map/reset_border
function mcbr:map/clear_arena_drops
function mcbr:loot/cleanup_spawn_caches
execute if score $arena_restore_enabled mcbr.config matches 1 run function mcbr:map/restore_arena
execute unless score $arena_restore_enabled mcbr.config matches 1 if score $chest_refill_enabled mcbr.config matches 1 run function mcbr:core/refill_chests
forceload remove 858 858 1142 1142

tellraw @a [{"text":"[mcbr] Round preparation complete.","color":"green"}]