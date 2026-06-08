package com.mkmod.mcbr;

import com.mkmod.mcbr.command.BrCommands;
import com.mkmod.mcbr.game.BrMatchManager;
import com.mkmod.mcbr.loot.BrLootService;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.world.InteractionHand;
import net.minecraftforge.event.RegisterCommandsEvent;
import net.minecraftforge.event.TickEvent;
import net.minecraftforge.event.entity.living.LivingDeathEvent;
import net.minecraftforge.event.entity.player.PlayerEvent;
import net.minecraftforge.event.entity.player.PlayerInteractEvent;
import net.minecraftforge.eventbus.api.SubscribeEvent;

public final class BrServerEvents {
    @SubscribeEvent
    public void onRegisterCommands(RegisterCommandsEvent event) {
        BrCommands.register(event.getDispatcher());
    }

    @SubscribeEvent
    public void onServerTick(TickEvent.ServerTickEvent event) {
        if (event.phase != TickEvent.Phase.END) {
            return;
        }

        BrMatchManager.get().tick(event.getServer());
    }

    @SubscribeEvent
    public void onLivingDeath(LivingDeathEvent event) {
        if (event.getEntity() instanceof ServerPlayer player) {
            BrMatchManager.get().onPlayerDeath(player);
        }
    }

    @SubscribeEvent
    public void onPlayerRespawn(PlayerEvent.PlayerRespawnEvent event) {
        if (event.getEntity() instanceof ServerPlayer player) {
            BrMatchManager.get().onPlayerRespawn(player);
        }
    }

    @SubscribeEvent
    public void onPlayerLogin(PlayerEvent.PlayerLoggedInEvent event) {
        if (event.getEntity() instanceof ServerPlayer player) {
            BrMatchManager.get().onPlayerLogin(player);
        }
    }

    @SubscribeEvent
    public void onRightClickBlock(PlayerInteractEvent.RightClickBlock event) {
        if (!(event.getEntity() instanceof ServerPlayer player)) {
            return;
        }

        if (event.getHand() != InteractionHand.MAIN_HAND) {
            return;
        }

        BrLootService.get().fillContainerIfNeeded(player, event.getPos());
    }
}
