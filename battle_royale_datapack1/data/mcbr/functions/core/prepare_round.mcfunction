# Unified round preparation path.
# Stage 1 only preloads the full initial match border so entity-based cleanup can see starter chests and death drops.
# Stage 2 runs one tick later in prepare_round_continue.

forceload add 858 858 1142 1142
schedule function mcbr:core/prepare_round_continue 1t replace