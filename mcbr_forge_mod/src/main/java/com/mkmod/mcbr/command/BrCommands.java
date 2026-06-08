package com.mkmod.mcbr.command;

import com.mkmod.mcbr.game.BrMatchManager;
import com.mojang.brigadier.CommandDispatcher;
import net.minecraft.commands.CommandSourceStack;
import net.minecraft.commands.Commands;
import net.minecraft.network.chat.Component;

public final class BrCommands {
    private BrCommands() {
    }

    public static void register(CommandDispatcher<CommandSourceStack> dispatcher) {
        dispatcher.register(
                Commands.literal("mcbr")
                        .requires(source -> source.hasPermission(2))
                        .then(Commands.literal("start")
                                .executes(context -> {
                                    boolean started = BrMatchManager.get().startMatch(context.getSource());
                                    if (started) {
                                        context.getSource().sendSuccess(() -> Component.literal("mcbr countdown started."), true);
                                        return 1;
                                    }

                                    context.getSource().sendFailure(Component.literal("mcbr match could not be started."));
                                    return 0;
                                }))
                        .then(Commands.literal("reset")
                                .executes(context -> {
                                    BrMatchManager.get().resetMatch(context.getSource().getServer());
                                    context.getSource().sendSuccess(() -> Component.literal("mcbr match reset complete."), true);
                                    return 1;
                                }))
                        .then(Commands.literal("status")
                                .executes(context -> {
                                    BrMatchManager manager = BrMatchManager.get();
                                    context.getSource().sendSuccess(() -> Component.literal(
                                            "Phase=" + manager.getPhase() +
                                                    ", Participants=" + manager.getParticipantCount() +
                                                    ", Alive=" + manager.getAliveCount()), false);
                                    return 1;
                                }))
        );
    }
}