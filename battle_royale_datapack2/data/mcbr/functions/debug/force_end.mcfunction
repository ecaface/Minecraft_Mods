# Force the match into the end state.

execute if score $state mcbr.state matches 2 run function mcbr:game/end_game
execute unless score $state mcbr.state matches 2 run tellraw @s [{"text":"[mcbr] No active match to force-end.","color":"red"}]
