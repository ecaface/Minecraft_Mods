# Keep a solo match running for smoke tests.

scoreboard players set $solo_debug mcbr.debug 1
tellraw @a [{"text":"[mcbr] Solo debug enabled. A 1-player match will not end immediately.","color":"yellow"}]
