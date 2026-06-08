setblock ~ ~-1 ~1 minecraft:stone_bricks
setblock ~ ~ ~1 minecraft:air
setblock ~ ~1 ~1 minecraft:air
setblock ~ ~ ~1 minecraft:chest[facing=south]
execute positioned ~ ~ ~1 run function mcbr:loot/spawn_pistol_cache_fill_here
execute align xyz positioned ~ ~ ~1 run summon marker ~0.5 ~0.5 ~0.5 {Tags:["mcbr_spawn_cache_chest"]}
execute align xyz positioned ~ ~-1 ~1 run summon marker ~0.5 ~0.5 ~0.5 {Tags:["mcbr_spawn_cache_support"]}
execute store result score @s mcbr.scx run data get entity @s Pos[0] 1
execute store result score @s mcbr.scy run data get entity @s Pos[1] 1
execute store result score @s mcbr.scz run data get entity @s Pos[2] 1
scoreboard players add @s mcbr.scz 1
execute store result score @s mcbr.ssx run data get entity @s Pos[0] 1
execute store result score @s mcbr.ssy run data get entity @s Pos[1] 1
scoreboard players remove @s mcbr.ssy 1
execute store result score @s mcbr.ssz run data get entity @s Pos[2] 1
scoreboard players add @s mcbr.ssz 1
scoreboard players set @s mcbr.sgx 0
scoreboard players set @s mcbr.sgy 0
scoreboard players set @s mcbr.sgz 0
scoreboard players set @s mcbr.tmp 1
