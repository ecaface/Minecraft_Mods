# Build a simple floating chest test ring around the combat zone center.
# Center: 1000 100 1000
# This is only for early loot / datapack verification.

# Clear the local work area.
fill 968 99 968 1032 106 1032 air

# Common pads.
fill 974 99 999 976 99 1001 minecraft:stone_bricks
setblock 975 100 1000 minecraft:chest[facing=south]
fill 1024 99 999 1026 99 1001 minecraft:stone_bricks
setblock 1025 100 1000 minecraft:chest[facing=south]
fill 999 99 974 1001 99 976 minecraft:stone_bricks
setblock 1000 100 975 minecraft:chest[facing=south]
fill 999 99 1024 1001 99 1026 minecraft:stone_bricks
setblock 1000 100 1025 minecraft:chest[facing=south]
fill 981 99 981 983 99 983 minecraft:stone_bricks
setblock 982 100 982 minecraft:chest[facing=south]
fill 1017 99 981 1019 99 983 minecraft:stone_bricks
setblock 1018 100 982 minecraft:chest[facing=south]
fill 981 99 1017 983 99 1019 minecraft:stone_bricks
setblock 982 100 1018 minecraft:chest[facing=south]
fill 1017 99 1017 1019 99 1019 minecraft:stone_bricks
setblock 1018 100 1018 minecraft:chest[facing=south]

# Uncommon pads.
fill 989 99 989 991 99 991 minecraft:polished_andesite
setblock 990 100 990 minecraft:chest[facing=south]
fill 1009 99 1009 1011 99 1011 minecraft:polished_andesite
setblock 1010 100 1010 minecraft:chest[facing=south]

# Rare pad.
fill 999 99 999 1001 99 1001 minecraft:chiseled_stone_bricks
setblock 1000 100 1000 minecraft:chest[facing=south]

# Lighting.
setblock 975 99 999 minecraft:sea_lantern
setblock 1025 99 999 minecraft:sea_lantern
setblock 999 99 975 minecraft:sea_lantern
setblock 999 99 1025 minecraft:sea_lantern
setblock 982 99 982 minecraft:sea_lantern
setblock 1018 99 982 minecraft:sea_lantern
setblock 982 99 1018 minecraft:sea_lantern
setblock 1018 99 1018 minecraft:sea_lantern
setblock 990 99 990 minecraft:sea_lantern
setblock 1010 99 1010 minecraft:sea_lantern
setblock 1000 99 1000 minecraft:sea_lantern
