# fill_airdrop.mcfunction
# Places a red shulker box at the landed position and assigns the airdrop loot table.

setblock ~ ~ ~ minecraft:red_shulker_box replace
data merge block ~ ~ ~ {LootTable:"mcbr:chests/br_airdrop"}
