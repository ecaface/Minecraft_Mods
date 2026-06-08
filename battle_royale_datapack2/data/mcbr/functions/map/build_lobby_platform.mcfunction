# Build a simple floating lobby platform dynamically at the configured lobby coords.
# Warning: clears a local area around the lobby before rebuilding.

# 1. Summon temporary lobby builder marker at the config coordinates:
execute positioned 0 0 0 run summon minecraft:marker ~ ~ ~ {Tags:["mcbr_lobby_builder"]}
execute store result entity @e[type=minecraft:marker,tag=mcbr_lobby_builder,limit=1] Pos[0] double 1 run scoreboard players get $lobby_x mcbr.config
execute store result entity @e[type=minecraft:marker,tag=mcbr_lobby_builder,limit=1] Pos[1] double 1 run scoreboard players get $lobby_y mcbr.config
execute store result entity @e[type=minecraft:marker,tag=mcbr_lobby_builder,limit=1] Pos[2] double 1 run scoreboard players get $lobby_z mcbr.config

# 2. Clear the working area around the lobby relative to the builder marker
execute at @e[type=minecraft:marker,tag=mcbr_lobby_builder,limit=1] run fill ~-12 ~-2 ~-12 ~12 ~8 ~12 air

# 3. Main floor and outer frame relative to builder marker
execute at @e[type=minecraft:marker,tag=mcbr_lobby_builder,limit=1] run fill ~-8 ~-1 ~-8 ~8 ~-1 ~8 minecraft:spruce_planks
execute at @e[type=minecraft:marker,tag=mcbr_lobby_builder,limit=1] run fill ~-8 ~-1 ~-8 ~8 ~-1 ~-8 minecraft:stone_bricks
execute at @e[type=minecraft:marker,tag=mcbr_lobby_builder,limit=1] run fill ~-8 ~-1 ~8 ~8 ~-1 ~8 minecraft:stone_bricks
execute at @e[type=minecraft:marker,tag=mcbr_lobby_builder,limit=1] run fill ~-8 ~-1 ~-8 ~-8 ~-1 ~8 minecraft:stone_bricks
execute at @e[type=minecraft:marker,tag=mcbr_lobby_builder,limit=1] run fill ~8 ~-1 ~-8 ~8 ~-1 ~8 minecraft:stone_bricks

# 4. Four support pillars for the floating look
execute at @e[type=minecraft:marker,tag=mcbr_lobby_builder,limit=1] run fill ~-7 ~-6 ~-7 ~-7 ~-2 ~-7 minecraft:stone_bricks
execute at @e[type=minecraft:marker,tag=mcbr_lobby_builder,limit=1] run fill ~7 ~-6 ~-7 ~7 ~-2 ~-7 minecraft:stone_bricks
execute at @e[type=minecraft:marker,tag=mcbr_lobby_builder,limit=1] run fill ~-7 ~-6 ~7 ~-7 ~-2 ~7 minecraft:stone_bricks
execute at @e[type=minecraft:marker,tag=mcbr_lobby_builder,limit=1] run fill ~7 ~-6 ~7 ~7 ~-2 ~7 minecraft:stone_bricks

# 5. Fully enclosed perimeter walls
execute at @e[type=minecraft:marker,tag=mcbr_lobby_builder,limit=1] run fill ~-8 ~0 ~-8 ~8 ~2 ~-8 minecraft:glass
execute at @e[type=minecraft:marker,tag=mcbr_lobby_builder,limit=1] run fill ~-8 ~0 ~8 ~8 ~2 ~8 minecraft:glass
execute at @e[type=minecraft:marker,tag=mcbr_lobby_builder,limit=1] run fill ~-8 ~0 ~-7 ~-8 ~2 ~7 minecraft:glass
execute at @e[type=minecraft:marker,tag=mcbr_lobby_builder,limit=1] run fill ~8 ~0 ~-7 ~8 ~2 ~7 minecraft:glass

# 6. Lighting points
execute at @e[type=minecraft:marker,tag=mcbr_lobby_builder,limit=1] run setblock ~-6 ~-1 ~-6 minecraft:sea_lantern
execute at @e[type=minecraft:marker,tag=mcbr_lobby_builder,limit=1] run setblock ~6 ~-1 ~-6 minecraft:sea_lantern
execute at @e[type=minecraft:marker,tag=mcbr_lobby_builder,limit=1] run setblock ~-6 ~-1 ~6 minecraft:sea_lantern
execute at @e[type=minecraft:marker,tag=mcbr_lobby_builder,limit=1] run setblock ~6 ~-1 ~6 minecraft:sea_lantern
execute at @e[type=minecraft:marker,tag=mcbr_lobby_builder,limit=1] run setblock ~0 ~-1 ~0 minecraft:sea_lantern

# 7. Center marker where players gather
execute at @e[type=minecraft:marker,tag=mcbr_lobby_builder,limit=1] run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:polished_andesite
execute at @e[type=minecraft:marker,tag=mcbr_lobby_builder,limit=1] run setblock ~0 ~-1 ~0 minecraft:beacon

# 8. Small info wall on the north side
execute at @e[type=minecraft:marker,tag=mcbr_lobby_builder,limit=1] run fill ~-3 ~0 ~-6 ~3 ~3 ~-6 minecraft:stone_bricks
execute at @e[type=minecraft:marker,tag=mcbr_lobby_builder,limit=1] run fill ~-2 ~1 ~-5 ~2 ~2 ~-5 minecraft:air

# 9. Sign line placeholders
execute at @e[type=minecraft:marker,tag=mcbr_lobby_builder,limit=1] run setblock ~0 ~0 ~-4 minecraft:oak_sign{front_text:{messages:['{"text":"Ethan Battle Royale","color":"gold"}','{"text":"Wait in lobby","color":"yellow"}','{"text":"Use /function","color":"gray"}','{"text":"mcbr:admin/start_game","color":"green"}']}} replace
execute at @e[type=minecraft:marker,tag=mcbr_lobby_builder,limit=1] run setblock ~-2 ~0 ~-4 minecraft:oak_sign{front_text:{messages:['{"text":"Combat Zone","color":"red"}','{"text":"Center: Dynamic","color":"white"}','{"text":"Random start","color":"white"}','{"text":"Worldborder enabled","color":"white"}']}} replace
execute at @e[type=minecraft:marker,tag=mcbr_lobby_builder,limit=1] run setblock ~2 ~0 ~-4 minecraft:oak_sign{front_text:{messages:['{"text":"Phase 2","color":"aqua"}','{"text":"Solo/Team modes","color":"white"}','{"text":"TACZ chest loot","color":"white"}','{"text":"Return here on reset","color":"white"}']}} replace

# 10. Host start pedestal on the south side
execute at @e[type=minecraft:marker,tag=mcbr_lobby_builder,limit=1] run setblock ~0 ~-1 ~5 minecraft:iron_block
execute at @e[type=minecraft:marker,tag=mcbr_lobby_builder,limit=1] run setblock ~0 ~0 ~5 minecraft:lever[face=floor,facing=north,powered=false]
execute at @e[type=minecraft:marker,tag=mcbr_lobby_builder,limit=1] run setblock ~0 ~0 ~4 minecraft:oak_sign{front_text:{messages:['{"text":"Host Start","color":"gold"}','{"text":"Host stands here","color":"yellow"}','{"text":"Flip lever to start","color":"green"}','{"text":"Only host works","color":"gray"}']}} replace

# 11. Spawn-safe top slab markers near the center
execute at @e[type=minecraft:marker,tag=mcbr_lobby_builder,limit=1] run setblock ~-2 ~0 ~0 minecraft:spruce_slab[type=top]
execute at @e[type=minecraft:marker,tag=mcbr_lobby_builder,limit=1] run setblock ~2 ~0 ~0 minecraft:spruce_slab[type=top]
execute at @e[type=minecraft:marker,tag=mcbr_lobby_builder,limit=1] run setblock ~0 ~0 ~-2 minecraft:spruce_slab[type=top]
execute at @e[type=minecraft:marker,tag=mcbr_lobby_builder,limit=1] run setblock ~0 ~0 ~2 minecraft:spruce_slab[type=top]

# 12. Create permanent lobby spawn marker
execute at @e[type=minecraft:marker,tag=mcbr_lobby_builder,limit=1] run kill @e[type=minecraft:marker,tag=mcbr_lobby_spawn]
execute at @e[type=minecraft:marker,tag=mcbr_lobby_builder,limit=1] run summon minecraft:marker ~0 ~0.5 ~0 {Tags:["mcbr_lobby_spawn"]}

# Clean up lobby builder
kill @e[type=minecraft:marker,tag=mcbr_lobby_builder]
