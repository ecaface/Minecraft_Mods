package com.mkmod.mcbr.config;

import net.minecraftforge.common.ForgeConfigSpec;

public final class BrModConfig {
    public static final ForgeConfigSpec SPEC;

    public static final ForgeConfigSpec.IntValue MIN_PLAYERS;
    public static final ForgeConfigSpec.IntValue COUNTDOWN_SECONDS;
    public static final ForgeConfigSpec.IntValue END_DELAY_SECONDS;
    public static final ForgeConfigSpec.IntValue INITIAL_BORDER_SIZE;
    public static final ForgeConfigSpec.IntValue FINAL_BORDER_SIZE;
    public static final ForgeConfigSpec.IntValue SHRINK_SECONDS;
    public static final ForgeConfigSpec.IntValue LOBBY_X;
    public static final ForgeConfigSpec.IntValue LOBBY_Y;
    public static final ForgeConfigSpec.IntValue LOBBY_Z;
    public static final ForgeConfigSpec.IntValue CENTER_X;
    public static final ForgeConfigSpec.IntValue CENTER_Z;
    public static final ForgeConfigSpec.IntValue SPREAD_DISTANCE;
    public static final ForgeConfigSpec.IntValue SPREAD_RANGE;
    public static final ForgeConfigSpec.BooleanValue TEAM_MODE;
    public static final ForgeConfigSpec.BooleanValue CHEST_REFILL_ENABLED;

    static {
        ForgeConfigSpec.Builder builder = new ForgeConfigSpec.Builder();

        builder.push("general");
        MIN_PLAYERS = builder.comment("Minimum players required to start a match")
                .defineInRange("minPlayers", 2, 1, 64);
        COUNTDOWN_SECONDS = builder.comment("Countdown duration before match start in seconds")
                .defineInRange("countdownSeconds", 10, 1, 120);
        END_DELAY_SECONDS = builder.comment("Delay before returning players to the lobby in seconds")
                .defineInRange("endDelaySeconds", 8, 1, 120);
        TEAM_MODE = builder.comment("Recommended to keep false for phase 1")
                .define("teamMode", false);
        CHEST_REFILL_ENABLED = builder.comment("Enable chest refill behavior")
                .define("chestRefillEnabled", true);
        builder.pop();

        builder.push("map");
        INITIAL_BORDER_SIZE = builder.comment("Initial world border diameter")
                .defineInRange("initialBorderSize", 256, 16, 10000);
        FINAL_BORDER_SIZE = builder.comment("Final world border diameter")
                .defineInRange("finalBorderSize", 32, 1, 10000);
        SHRINK_SECONDS = builder.comment("Border shrink duration in seconds")
                .defineInRange("shrinkSeconds", 300, 1, 7200);
        LOBBY_X = builder.defineInRange("lobbyX", 0, -30000000, 30000000);
        LOBBY_Y = builder.defineInRange("lobbyY", 100, -64, 320);
        LOBBY_Z = builder.defineInRange("lobbyZ", 0, -30000000, 30000000);
        CENTER_X = builder.defineInRange("centerX", 0, -30000000, 30000000);
        CENTER_Z = builder.defineInRange("centerZ", 0, -30000000, 30000000);
        SPREAD_DISTANCE = builder.comment("Minimum distance between spread players")
                .defineInRange("spreadDistance", 32, 4, 10000);
        SPREAD_RANGE = builder.comment("Maximum spread range from center")
                .defineInRange("spreadRange", 96, 4, 10000);
        builder.pop();

        SPEC = builder.build();
    }

    private BrModConfig() {
    }
}