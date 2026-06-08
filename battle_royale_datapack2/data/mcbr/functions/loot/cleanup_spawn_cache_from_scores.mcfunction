# Exact starter cache cleanup using recorded per-player coordinates.
# This is the primary cleanup path; marker cleanup is retained as a fallback.

# 1. Clean chest
execute if score @s mcbr.scy matches 50..150 run summon marker ~ ~ ~ {Tags:["mcbr_spawn_cleanup_tmp"]}
execute if score @s mcbr.scy matches 50..150 store result entity @e[type=marker,tag=mcbr_spawn_cleanup_tmp,sort=nearest,limit=1,distance=..1] Pos[0] double 1 run scoreboard players get @s mcbr.scx
execute if score @s mcbr.scy matches 50..150 store result entity @e[type=marker,tag=mcbr_spawn_cleanup_tmp,sort=nearest,limit=1,distance=..1] Pos[1] double 1 run scoreboard players get @s mcbr.scy
execute if score @s mcbr.scy matches 50..150 store result entity @e[type=marker,tag=mcbr_spawn_cleanup_tmp,sort=nearest,limit=1,distance=..1] Pos[2] double 1 run scoreboard players get @s mcbr.scz
execute if score @s mcbr.scy matches 50..150 as @e[type=marker,tag=mcbr_spawn_cleanup_tmp,sort=nearest,limit=1,distance=..1] at @s if block ~ ~ ~ minecraft:chest run data remove block ~ ~ ~ LootTable
execute if score @s mcbr.scy matches 50..150 as @e[type=marker,tag=mcbr_spawn_cleanup_tmp,sort=nearest,limit=1,distance=..1] at @s if block ~ ~ ~ minecraft:chest run data merge block ~ ~ ~ {Items:[]}
execute if score @s mcbr.scy matches 50..150 as @e[type=marker,tag=mcbr_spawn_cleanup_tmp,sort=nearest,limit=1,distance=..1] at @s if block ~ ~ ~ minecraft:chest run setblock ~ ~ ~ air

# 2. Clean support bricks
execute if score @s mcbr.ssy matches 50..150 store result entity @e[type=marker,tag=mcbr_spawn_cleanup_tmp,sort=nearest,limit=1,distance=..1] Pos[0] double 1 run scoreboard players get @s mcbr.ssx
execute if score @s mcbr.ssy matches 50..150 store result entity @e[type=marker,tag=mcbr_spawn_cleanup_tmp,sort=nearest,limit=1,distance=..1] Pos[1] double 1 run scoreboard players get @s mcbr.ssy
execute if score @s mcbr.ssy matches 50..150 store result entity @e[type=marker,tag=mcbr_spawn_cleanup_tmp,sort=nearest,limit=1,distance=..1] Pos[2] double 1 run scoreboard players get @s mcbr.ssz
execute if score @s mcbr.ssy matches 50..150 as @e[type=marker,tag=mcbr_spawn_cleanup_tmp,sort=nearest,limit=1,distance=..1] at @s if block ~ ~ ~ minecraft:stone_bricks run setblock ~ ~ ~ air

# 3. Clean light block
execute if score @s mcbr.sgy matches 50..150 store result entity @e[type=marker,tag=mcbr_spawn_cleanup_tmp,sort=nearest,limit=1,distance=..1] Pos[0] double 1 run scoreboard players get @s mcbr.sgx
execute if score @s mcbr.sgy matches 50..150 store result entity @e[type=marker,tag=mcbr_spawn_cleanup_tmp,sort=nearest,limit=1,distance=..1] Pos[1] double 1 run scoreboard players get @s mcbr.sgy
execute if score @s mcbr.sgy matches 50..150 store result entity @e[type=marker,tag=mcbr_spawn_cleanup_tmp,sort=nearest,limit=1,distance=..1] Pos[2] double 1 run scoreboard players get @s mcbr.sgz
execute if score @s mcbr.sgy matches 50..150 as @e[type=marker,tag=mcbr_spawn_cleanup_tmp,sort=nearest,limit=1,distance=..1] at @s if block ~ ~ ~ minecraft:glowstone run setblock ~ ~ ~ air

# Reset scoreboard coords
scoreboard players set @s mcbr.scx 0
scoreboard players set @s mcbr.scy 0
scoreboard players set @s mcbr.scz 0
scoreboard players set @s mcbr.ssx 0
scoreboard players set @s mcbr.ssy 0
scoreboard players set @s mcbr.ssz 0
scoreboard players set @s mcbr.sgx 0
scoreboard players set @s mcbr.sgy 0
scoreboard players set @s mcbr.sgz 0

kill @e[type=marker,tag=mcbr_spawn_cleanup_tmp]
