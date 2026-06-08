# player/assign_teams.mcfunction
# Assigns playing players to teams Red (1) and Blue (2) as evenly as possible.

# 1. Clean up existing team membership
team leave @a[tag=mcbr_playing]
scoreboard players set @a[tag=mcbr_playing] mcbr.team 0

# 2. Assign teams round-robin (for up to 8 players)
# Alternating selection: Red -> Blue -> Red -> Blue ...
execute as @r[tag=mcbr_playing,team=] run team join mcbr_team_1 @s
execute as @a[tag=mcbr_playing,team=mcbr_team_1] run scoreboard players set @s mcbr.team 1

execute as @r[tag=mcbr_playing,team=] run team join mcbr_team_2 @s
execute as @a[tag=mcbr_playing,team=mcbr_team_2] run scoreboard players set @s mcbr.team 2

execute as @r[tag=mcbr_playing,team=] run team join mcbr_team_1 @s
execute as @a[tag=mcbr_playing,team=mcbr_team_1] run scoreboard players set @s mcbr.team 1

execute as @r[tag=mcbr_playing,team=] run team join mcbr_team_2 @s
execute as @a[tag=mcbr_playing,team=mcbr_team_2] run scoreboard players set @s mcbr.team 2

execute as @r[tag=mcbr_playing,team=] run team join mcbr_team_1 @s
execute as @a[tag=mcbr_playing,team=mcbr_team_1] run scoreboard players set @s mcbr.team 1

execute as @r[tag=mcbr_playing,team=] run team join mcbr_team_2 @s
execute as @a[tag=mcbr_playing,team=mcbr_team_2] run scoreboard players set @s mcbr.team 2

execute as @r[tag=mcbr_playing,team=] run team join mcbr_team_1 @s
execute as @a[tag=mcbr_playing,team=mcbr_team_1] run scoreboard players set @s mcbr.team 1

execute as @r[tag=mcbr_playing,team=] run team join mcbr_team_2 @s
execute as @a[tag=mcbr_playing,team=mcbr_team_2] run scoreboard players set @s mcbr.team 2

# 3. Print assigned team summary
tellraw @a [{"text":"[mcbr] Teams assigned:","color":"gold"}]
tellraw @a [{"text":"- ","color":"gray"},{"text":"Red Team: ","color":"red"},{"selector":"@a[team=mcbr_team_1]"}]
tellraw @a [{"text":"- ","color":"gray"},{"text":"Blue Team: ","color":"blue"},{"selector":"@a[team=mcbr_team_2]"}]
