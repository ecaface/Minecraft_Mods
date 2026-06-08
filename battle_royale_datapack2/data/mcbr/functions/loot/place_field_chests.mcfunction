# Dynamic candidates are scanned and permanently stored.
# No need to clear and re-summon fixed candidates.
forceload add 880 880 1120 1120
tellraw @a [{"text":"[mcbr] Using scanned terrain-adaptive chest candidates.","color":"yellow"}]
forceload remove 880 880 1120 1120

