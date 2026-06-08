# Eliminate dead players using deathCount.
execute if score $state mcbr.state matches 2 unless score $end_lock mcbr.tmp matches 1 as @a[tag=mcbr_playing,scores={mcbr.deaths=1..}] run function mcbr:player/set_spectator

# Also catch manual spectator changes.
execute if score $state mcbr.state matches 2 unless score $end_lock mcbr.tmp matches 1 as @a[tag=mcbr_playing,gamemode=spectator,scores={mcbr.alive=1..}] run function mcbr:player/set_spectator
