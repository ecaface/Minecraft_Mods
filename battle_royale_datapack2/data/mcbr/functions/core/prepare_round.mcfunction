# Unified round preparation path.
# Stage 1 only preloads the full initial match border so entity-based cleanup can see starter chests and death drops.
# Stage 2 runs one tick later in prepare_round_continue.

function mcbr:map/forceload_arena
schedule function mcbr:core/prepare_round_continue 1t replace