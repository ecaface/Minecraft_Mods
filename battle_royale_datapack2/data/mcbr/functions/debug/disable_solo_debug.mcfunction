# Restore normal winner detection.

scoreboard players set $solo_debug mcbr.debug 0
tellraw @a [{"text":"[mcbr] Solo debug disabled. Normal winner detection restored.","color":"green"}]
