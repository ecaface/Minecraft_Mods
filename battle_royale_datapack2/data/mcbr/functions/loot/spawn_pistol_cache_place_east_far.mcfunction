setblock ~2 ~-1 ~ minecraft:stone_bricks
setblock ~2 ~ ~ minecraft:air
setblock ~2 ~1 ~ minecraft:air
setblock ~2 ~ ~ minecraft:chest[facing=south]
execute positioned ~2 ~ ~ run function mcbr:loot/spawn_pistol_cache_fill_here
setblock ~1 ~-1 ~ minecraft:glowstone
execute align xyz positioned ~2 ~ ~ run summon marker ~0.5 ~0.5 ~0.5 {Tags:["mcbr_spawn_cache_chest"]}
execute align xyz positioned ~2 ~-1 ~ run summon marker ~0.5 ~0.5 ~0.5 {Tags:["mcbr_spawn_cache_support"]}
execute align xyz positioned ~1 ~-1 ~ run summon marker ~0.5 ~0.5 ~0.5 {Tags:["mcbr_spawn_cache_glow"]}
execute store result score @s mcbr.scx run data get entity @s Pos[0] 1
scoreboard players add @s mcbr.scx 2
execute store result score @s mcbr.scy run data get entity @s Pos[1] 1
execute store result score @s mcbr.scz run data get entity @s Pos[2] 1
execute store result score @s mcbr.ssx run data get entity @s Pos[0] 1
scoreboard players add @s mcbr.ssx 2
execute store result score @s mcbr.ssy run data get entity @s Pos[1] 1
scoreboard players remove @s mcbr.ssy 1
execute store result score @s mcbr.ssz run data get entity @s Pos[2] 1
execute store result score @s mcbr.sgx run data get entity @s Pos[0] 1
scoreboard players add @s mcbr.sgx 1
execute store result score @s mcbr.sgy run data get entity @s Pos[1] 1
scoreboard players remove @s mcbr.sgy 1
execute store result score @s mcbr.sgz run data get entity @s Pos[2] 1
scoreboard players set @s mcbr.tmp 1
