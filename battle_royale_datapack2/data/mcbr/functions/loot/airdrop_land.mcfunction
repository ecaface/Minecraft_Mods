# loot/airdrop_land.mcfunction
# Executes when the airdrop dropper ArmorStand lands on solid ground.

# 1. Place shulker box and fill it using fill_airdrop
function mcbr:loot/fill_airdrop

# 2. Store coordinates in scoreboard for tellraw message
execute store result score $airdrop_x mcbr.tmp run data get entity @s Pos[0]
execute store result score $airdrop_z mcbr.tmp run data get entity @s Pos[2]

# 3. Print global announcement
tellraw @a [{"text":"[mcbr] 보급 상자가 공중에서 낙하하여 착지했습니다! (X=","color":"gold"},{"score":{"name":"$airdrop_x","objective":"mcbr.tmp"},"color":"white"},{"text":", Z=","color":"gold"},{"score":{"name":"$airdrop_z","objective":"mcbr.tmp"},"color":"white"},{"text":")","color":"gold"}]

# 4. Play explosion sound and summon smoke area effect cloud (emits smoke for 2 minutes)
execute at @s run playsound minecraft:entity.generic.explode master @a ~ ~ ~ 1.5 1.0
summon minecraft:area_effect_cloud ~ ~0.5 ~ {Tags:["mcbr_airdrop_smoke"],Duration:2400,Radius:0.2f,WaitTime:0,Particle:"minecraft:campfire_cosy_smoke"}

# 5. Clean up dropper armor stand
kill @s
