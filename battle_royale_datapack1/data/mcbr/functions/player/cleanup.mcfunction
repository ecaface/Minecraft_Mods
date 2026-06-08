# Reset a player to a clean match-ready state.

clear @s
effect clear @s
attribute @s minecraft:generic.max_health base set 60
xp set @s 0 levels
xp set @s 0 points
effect give @s minecraft:instant_health 1 20 true
effect give @s minecraft:saturation 1 10 true
give @s minecraft:bread 4
