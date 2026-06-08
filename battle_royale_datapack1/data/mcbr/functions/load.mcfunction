# MC Battle Royale load
# Safe to run on /reload. Objective creation may print "already exists" warnings on reload.

scoreboard objectives add mcbr.state dummy
scoreboard objectives add mcbr.timer dummy
scoreboard objectives add mcbr.alive dummy
scoreboard objectives add mcbr.team dummy
scoreboard objectives add mcbr.config dummy
scoreboard objectives add mcbr.tmp dummy
scoreboard objectives add mcbr.debug dummy
scoreboard objectives add mcbr.join dummy
scoreboard objectives add mcbr.scx dummy
scoreboard objectives add mcbr.scy dummy
scoreboard objectives add mcbr.scz dummy
scoreboard objectives add mcbr.ssx dummy
scoreboard objectives add mcbr.ssy dummy
scoreboard objectives add mcbr.ssz dummy
scoreboard objectives add mcbr.sgx dummy
scoreboard objectives add mcbr.sgy dummy
scoreboard objectives add mcbr.sgz dummy
scoreboard objectives add mcbr.deaths deathCount

team add mcbr_lobby
team modify mcbr_lobby friendlyFire false
team modify mcbr_lobby collisionRule always
team modify mcbr_lobby seeFriendlyInvisibles true

# State values
# 0 = waiting
# 1 = countdown
# 2 = in_game
# 3 = ended
scoreboard players set $state mcbr.state 0

execute unless score $config_initialized mcbr.tmp matches 1 run function mcbr:load_config_defaults

# Temporary counters reset
scoreboard players set $countdown_ticks mcbr.timer 0
scoreboard players set $end_ticks mcbr.timer 0
scoreboard players set $alive_count mcbr.tmp 0
scoreboard players set $active_count mcbr.tmp 0
scoreboard players set $end_lock mcbr.tmp 0
scoreboard players set $solo_debug mcbr.debug 0
scoreboard players set $next_join mcbr.tmp 0

tellraw @a [{"text":"[mcbr] Datapack loaded. Use /function mcbr:admin/start_game to begin.","color":"green"}]
