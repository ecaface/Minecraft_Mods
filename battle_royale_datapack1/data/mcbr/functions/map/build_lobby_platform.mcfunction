# Build a simple floating lobby platform at 0 100 0.
# This creates a 17x17 platform, glass rails, lighting, and a small info wall.
# Warning: clears a local area around the lobby before rebuilding.

# Clear the working area around the lobby.
fill -12 98 -12 12 108 12 air

# Main floor and outer frame.
fill -8 99 -8 8 99 8 minecraft:spruce_planks
fill -8 99 -8 8 99 -8 minecraft:stone_bricks
fill -8 99 8 8 99 8 minecraft:stone_bricks
fill -8 99 -8 -8 99 8 minecraft:stone_bricks
fill 8 99 -8 8 99 8 minecraft:stone_bricks

# Four support pillars for the floating look.
fill -7 94 -7 -7 98 -7 minecraft:stone_bricks
fill 7 94 -7 7 98 -7 minecraft:stone_bricks
fill -7 94 7 -7 98 7 minecraft:stone_bricks
fill 7 94 7 7 98 7 minecraft:stone_bricks

# Fully enclosed perimeter walls.
fill -8 100 -8 8 102 -8 minecraft:glass
fill -8 100 8 8 102 8 minecraft:glass
fill -8 100 -7 -8 102 7 minecraft:glass
fill 8 100 -7 8 102 7 minecraft:glass

# Lighting points.
setblock -6 99 -6 minecraft:sea_lantern
setblock 6 99 -6 minecraft:sea_lantern
setblock -6 99 6 minecraft:sea_lantern
setblock 6 99 6 minecraft:sea_lantern
setblock 0 99 0 minecraft:sea_lantern

# Center marker where players gather.
fill -1 99 -1 1 99 1 minecraft:polished_andesite
setblock 0 99 0 minecraft:beacon

# Small info wall on the north side.
fill -3 100 -6 3 103 -6 minecraft:stone_bricks
fill -2 101 -5 2 102 -5 minecraft:air

# Sign line placeholders for manual editing later.
setblock 0 100 -4 minecraft:oak_sign{front_text:{messages:['{"text":"Ethan Battle Royale","color":"gold"}','{"text":"Wait in lobby","color":"yellow"}','{"text":"Use /function","color":"gray"}','{"text":"mcbr:admin/start_game","color":"green"}']}} replace
setblock -2 100 -4 minecraft:oak_sign{front_text:{messages:['{"text":"Combat Zone","color":"red"}','{"text":"Center: 1000 1000","color":"white"}','{"text":"Random start","color":"white"}','{"text":"Worldborder enabled","color":"white"}']}} replace
setblock 2 100 -4 minecraft:oak_sign{front_text:{messages:['{"text":"Phase 1","color":"aqua"}','{"text":"Solo mode","color":"white"}','{"text":"TACZ chest loot","color":"white"}','{"text":"Return here on reset","color":"white"}']}} replace

# Host start pedestal on the south side.
setblock 0 99 5 minecraft:iron_block
setblock 0 100 5 minecraft:lever[face=floor,facing=north,powered=false]
setblock 0 100 4 minecraft:oak_sign{front_text:{messages:['{"text":"Host Start","color":"gold"}','{"text":"Host stands here","color":"yellow"}','{"text":"Flip lever to start","color":"green"}','{"text":"Only host works","color":"gray"}']}} replace

# Spawn-safe top slab markers near the center.
setblock -2 100 0 minecraft:spruce_slab[type=top]
setblock 2 100 0 minecraft:spruce_slab[type=top]
setblock 0 100 -2 minecraft:spruce_slab[type=top]
setblock 0 100 2 minecraft:spruce_slab[type=top]
