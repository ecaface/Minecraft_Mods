# game/trigger_airdrop.mcfunction
# Triggers an airdrop by summoning a dropper at the dynamic center, spreading it within the active border range, and sending it to Y=150.

# 1. Store current border size in score
execute store result score $border_size mcbr.tmp run worldborder get

# 2. Summon dropper at the center coordinates
# We first summon a temporary center marker to use as spread center
execute positioned 0 0 0 run summon minecraft:marker ~ ~ ~ {Tags:["mcbr_center_marker"]}
execute store result entity @e[type=minecraft:marker,tag=mcbr_center_marker,limit=1] Pos[0] double 1 run scoreboard players get $center_x mcbr.config
execute store result entity @e[type=minecraft:marker,tag=mcbr_center_marker,limit=1] Pos[2] double 1 run scoreboard players get $center_z mcbr.config

# Summon dropper at center marker position (high up initially)
execute at @e[type=minecraft:marker,tag=mcbr_center_marker,limit=1] run summon minecraft:armor_stand ~ ~ ~ {Tags:["mcbr_airdrop_dropper"],Invisible:1b,NoGravity:1b,Marker:0b}

# 3. Spread the dropper relative to the center marker based on current border size
# If border is large (Phase 1, size >= 200), spread up to 90 blocks radius
execute at @e[type=minecraft:marker,tag=mcbr_center_marker,limit=1] if score $border_size mcbr.tmp matches 200.. run spreadplayers ~ ~ 10 90 false @e[type=minecraft:armor_stand,tag=mcbr_airdrop_dropper,limit=1]

# If border is medium (Phase 2, size 100..199), spread up to 45 blocks radius
execute at @e[type=minecraft:marker,tag=mcbr_center_marker,limit=1] if score $border_size mcbr.tmp matches 100..199 run spreadplayers ~ ~ 10 45 false @e[type=minecraft:armor_stand,tag=mcbr_airdrop_dropper,limit=1]

# If border is small (Phase 3/final, size < 100), spread up to 15 blocks radius
execute at @e[type=minecraft:marker,tag=mcbr_center_marker,limit=1] if score $border_size mcbr.tmp matches ..99 run spreadplayers ~ ~ 5 15 false @e[type=minecraft:armor_stand,tag=mcbr_airdrop_dropper,limit=1]

# 4. Teleport the dropper straight back up to Y=150 (since spreadplayers teleports to ground level)
execute as @e[type=minecraft:armor_stand,tag=mcbr_airdrop_dropper] run tp @s ~ 150 ~

# 5. Clean up temporary center marker
kill @e[type=minecraft:marker,tag=mcbr_center_marker]

# 6. Global chat announcement
tellraw @a [{"text":"[mcbr] 하늘에서 보급품 수송선이 보급 상자를 낙하시켰습니다! 낙하점을 주시하세요.","color":"gold"}]
