package com.mkmod.mcbr.loot;

import com.mkmod.mcbr.game.BrGamePhase;
import com.mkmod.mcbr.game.BrLootTier;
import com.mkmod.mcbr.game.BrMatchManager;
import net.minecraft.core.BlockPos;
import net.minecraft.nbt.CompoundTag;
import net.minecraft.resources.ResourceLocation;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.util.RandomSource;
import net.minecraft.world.Container;
import net.minecraft.world.item.Item;
import net.minecraft.world.item.ItemStack;
import net.minecraft.world.item.Items;
import net.minecraft.world.level.block.entity.BlockEntity;
import net.minecraft.world.level.block.entity.RandomizableContainerBlockEntity;
import net.minecraftforge.registries.ForgeRegistries;

import java.util.List;

public final class BrLootService {
    private static final BrLootService INSTANCE = new BrLootService();

    private static final String TACZ_GUN_ITEM = "tacz:modern_kinetic_gun";
    private static final String TACZ_AMMO_ITEM = "tacz:ammo";
    private static final String MCBR_LOOT_TAG = "mcbr_looted";

    private final List<LootTemplate> commonPool = List.of(
            plain("minecraft:bread", 1, 3),
            plain("minecraft:cooked_beef", 1, 3),
            plain("minecraft:leather_chestplate", 1, 1),
            plain("minecraft:stone_sword", 1, 1),
            ammo("tacz:9mm", 12, 24),
            ammo("tacz:45acp", 10, 20),
            gun("tacz:glock_17"),
            gun("tacz:m1911"),
            gun("tacz:uzi")
    );

    private final List<LootTemplate> uncommonPool = List.of(
            plain("minecraft:golden_apple", 1, 1),
            plain("minecraft:shield", 1, 1),
            plain("minecraft:iron_chestplate", 1, 1),
            plain("minecraft:ender_pearl", 1, 2),
            ammo("tacz:9mm", 16, 32),
            ammo("tacz:45acp", 16, 28),
            ammo("tacz:556x45", 16, 28),
            ammo("tacz:12g", 6, 12),
            gun("tacz:hk_mp5a5"),
            gun("tacz:ump45"),
            gun("tacz:m870"),
            gun("tacz:m4a1")
    );

    private final List<LootTemplate> rarePool = List.of(
            plain("minecraft:golden_apple", 1, 2),
            plain("minecraft:diamond_chestplate", 1, 1),
            plain("minecraft:ender_pearl", 2, 4),
            ammo("tacz:556x45", 24, 40),
            ammo("tacz:762x39", 20, 36),
            ammo("tacz:308", 10, 20),
            ammo("tacz:12g", 10, 18),
            gun("tacz:ak47"),
            gun("tacz:scar_l"),
            gun("tacz:mk14"),
            gun("tacz:m1014")
    );

    private final List<LootTemplate> airdropPool = List.of(
            plain("minecraft:golden_apple", 2, 3),
            plain("minecraft:diamond_chestplate", 1, 1),
            plain("minecraft:ender_pearl", 2, 4),
            ammo("tacz:556x45", 32, 48),
            ammo("tacz:762x39", 32, 48),
            ammo("tacz:308", 20, 32),
            ammo("tacz:50bmg", 6, 12),
            gun("tacz:scar_h"),
            gun("tacz:m95"),
            gun("tacz:ai_awp"),
            gun("tacz:m249")
    );

    public static BrLootService get() {
        return INSTANCE;
    }

    public void fillContainerIfNeeded(ServerPlayer player, BlockPos pos) {
        BrMatchManager manager = BrMatchManager.get();
        if (manager.getPhase() != BrGamePhase.IN_GAME || !manager.isPlaying(player)) {
            return;
        }

        BlockEntity blockEntity = player.serverLevel().getBlockEntity(pos);
        if (!(blockEntity instanceof RandomizableContainerBlockEntity container)) {
            return;
        }

        CompoundTag persistentData = blockEntity.getPersistentData();
        if (persistentData.getBoolean(MCBR_LOOT_TAG)) {
            return;
        }

        // Check if the container already has a vanilla/datapack loot table configured.
        // If it does, we let vanilla loot generation unpack it when the player opens it,
        // and avoid double-filling the container with random Java loot.
        if (container.saveWithoutMetadata().contains("LootTable")) {
            persistentData.putBoolean(MCBR_LOOT_TAG, true);
            blockEntity.setChanged();
            return;
        }

        if (!isReallyEmpty(container)) {
            persistentData.putBoolean(MCBR_LOOT_TAG, true);
            blockEntity.setChanged();
            return;
        }

        BrLootTier tier = chooseTier(pos);
        populateContainer(container, tier, player.getRandom());
        persistentData.putBoolean(MCBR_LOOT_TAG, true);
        container.setChanged();
    }

    private BrLootTier chooseTier(BlockPos pos) {
        int marker = Math.abs(pos.getX() + pos.getZ()) % 100;
        if (marker >= 99) {
            return BrLootTier.AIRDROP;
        }
        if (marker >= 95) {
            return BrLootTier.RARE;
        }
        if (marker >= 65) {
            return BrLootTier.UNCOMMON;
        }
        return BrLootTier.COMMON;
    }

    private void populateContainer(Container container, BrLootTier tier, RandomSource random) {
        List<LootTemplate> pool = switch (tier) {
            case COMMON -> commonPool;
            case UNCOMMON -> uncommonPool;
            case RARE -> rarePool;
            case AIRDROP -> airdropPool;
        };

        int rolls = switch (tier) {
            case COMMON -> 3;
            case UNCOMMON -> 4;
            case RARE -> 4;
            case AIRDROP -> 5;
        };

        for (int i = 0; i < rolls; i++) {
            LootTemplate entry = pool.get(random.nextInt(pool.size()));
            ItemStack stack = entry.create(random);
            if (stack.isEmpty()) {
                continue;
            }

            int slot = random.nextInt(container.getContainerSize());
            container.setItem(slot, stack);
        }
    }

    private static LootTemplate plain(String itemId, int minCount, int maxCount) {
        return new LootTemplate(itemId, null, null, minCount, maxCount);
    }

    private static LootTemplate gun(String gunId) {
        return new LootTemplate(TACZ_GUN_ITEM, gunId, null, 1, 1);
    }

    private static LootTemplate ammo(String ammoId, int minCount, int maxCount) {
        return new LootTemplate(TACZ_AMMO_ITEM, null, ammoId, minCount, maxCount);
    }

    private static Item resolveItem(String itemId) {
        ResourceLocation key = ResourceLocation.tryParse(itemId);
        if (key == null) {
            return Items.AIR;
        }

        Item item = ForgeRegistries.ITEMS.getValue(key);
        return item != null ? item : Items.AIR;
    }

    private boolean isReallyEmpty(Container container) {
        for (int i = 0; i < container.getContainerSize(); i++) {
            if (!container.getItem(i).isEmpty()) {
                return false;
            }
        }
        return true;
    }

    private record LootTemplate(String itemId, String gunId, String ammoId, int minCount, int maxCount) {
        private ItemStack create(RandomSource random) {
            Item item = resolveItem(itemId);
            if (item == Items.AIR) {
                return ItemStack.EMPTY;
            }

            int count = minCount == maxCount ? minCount : minCount + random.nextInt((maxCount - minCount) + 1);
            ItemStack stack = new ItemStack(item, count);
            CompoundTag tag = stack.getOrCreateTag();

            if (gunId != null) {
                tag.putString("GunId", gunId);
            }

            if (ammoId != null) {
                tag.putString("AmmoId", ammoId);
            }

            if (tag.isEmpty()) {
                stack.setTag(null);
            }

            return stack;
        }
    }
}
