# Phase 1 border reset profile.
# After the match, restore a large safe border so the separated lobby
# at the high-altitude lobby position is never outside the world border.

execute at @e[type=minecraft:marker,tag=mcbr_lobby_spawn,limit=1] run worldborder center ~ ~
worldborder set 59999968 0
