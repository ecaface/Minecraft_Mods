# Live match loop

function mcbr:game/check_death_or_spectator
function mcbr:game/check_winner

# Periodic chest refill timer check
execute if score $chest_refill_interval mcbr.config matches 1.. run function mcbr:game/periodic_refill_timer
