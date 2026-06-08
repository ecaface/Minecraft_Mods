package com.mkmod.mcbr.util;

import net.minecraft.commands.CommandSourceStack;
import net.minecraft.server.MinecraftServer;

public final class BrCommandUtil {
    private BrCommandUtil() {
    }

    public static void runServerCommand(MinecraftServer server, String command) {
        CommandSourceStack source = server.createCommandSourceStack()
                .withPermission(4)
                .withSuppressedOutput();
        server.getCommands().performPrefixedCommand(source, command);
    }
}
