# Unified round preparation continuation.
# Runs one tick after prepare_round so the preloaded match-area chunks expose cleanup targets reliably.

tellraw @a [{"text":"[mcbr] Prepare round 1/5: clearing border-area drops...","color":"aqua"}]
function mcbr:map/clear_arena_drops

tellraw @a [{"text":"[mcbr] Prepare round 2/5: cleaning starter chests...","color":"aqua"}]
function mcbr:loot/cleanup_spawn_caches

tellraw @a [{"text":"[mcbr] Prepare round 3/5: clearing field chests...","color":"aqua"}]
function mcbr:loot/clear_field_chests

tellraw @a [{"text":"[mcbr] Prepare round 4/5: restoring arena blocks...","color":"aqua"}]
execute if score $arena_restore_enabled mcbr.config matches 1 run function mcbr:map/restore_arena

tellraw @a [{"text":"[mcbr] Prepare round 5/5: rebuilding field chests...","color":"aqua"}]
function mcbr:map/clear_arena_drops
execute if score $chest_refill_enabled mcbr.config matches 1 run function mcbr:core/refill_chests

forceload remove 858 858 1142 1142
tellraw @a [{"text":"[mcbr] Round preparation complete.","color":"green"}]
