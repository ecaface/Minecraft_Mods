package com.mkmod.mcbr.game;

import com.mkmod.mcbr.config.BrModConfig;
import com.mkmod.mcbr.util.BrCommandUtil;
import net.minecraft.commands.CommandSourceStack;
import net.minecraft.network.chat.Component;
import net.minecraft.server.MinecraftServer;
import net.minecraft.server.level.ServerLevel;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.world.level.GameType;
import net.minecraft.world.level.Level;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.UUID;

public final class BrMatchManager {
    private static final BrMatchManager INSTANCE = new BrMatchManager();
    private static final String PLAYING_TAG = "mcbr_playing";
    private static final String ALIVE_TAG = "mcbr_alive";

    private final Set<UUID> participantIds = new HashSet<>();
    private final Set<UUID> aliveIds = new HashSet<>();
    private final Set<UUID> pendingSpectatorIds = new HashSet<>();

    private BrGamePhase phase = BrGamePhase.WAITING;
    private int countdownTicksRemaining;
    private int endTicksRemaining;

    private BrMatchManager() {
    }

    public static BrMatchManager get() {
        return INSTANCE;
    }

    public BrGamePhase getPhase() {
        return phase;
    }

    public int getParticipantCount() {
        return participantIds.size();
    }

    public int getAliveCount() {
        return aliveIds.size();
    }

    public boolean isPlaying(ServerPlayer player) {
        return participantIds.contains(player.getUUID());
    }

    public boolean startMatch(CommandSourceStack source) {
        MinecraftServer server = source.getServer();
        if (phase != BrGamePhase.WAITING) {
            source.sendFailure(Component.literal("현재 대기 상태가 아니어서 시작할 수 없습니다."));
            return false;
        }

        List<ServerPlayer> candidates = new ArrayList<>(server.getPlayerList().getPlayers().stream()
                .filter(player -> !player.isSpectator())
                .toList());

        if (candidates.size() < BrModConfig.MIN_PLAYERS.get()) {
            source.sendFailure(Component.literal("최소 인원이 부족합니다. 현재 인원: " + candidates.size()));
            return false;
        }

        clearPlayerMarkers(server);
        participantIds.clear();
        aliveIds.clear();
        pendingSpectatorIds.clear();

        for (ServerPlayer player : candidates) {
            UUID playerId = player.getUUID();
            participantIds.add(playerId);
            aliveIds.add(playerId);
            player.addTag(PLAYING_TAG);
            player.addTag(ALIVE_TAG);
            player.setGameMode(GameType.ADVENTURE);
        }

        countdownTicksRemaining = BrModConfig.COUNTDOWN_SECONDS.get() * 20;
        endTicksRemaining = 0;
        phase = BrGamePhase.COUNTDOWN;

        broadcast(server, Component.literal("[mcbr] 카운트다운이 시작되었습니다."));
        return true;
    }

    public void tick(MinecraftServer server) {
        cleanupDisconnectedPlayers(server);

        switch (phase) {
            case WAITING -> {
            }
            case COUNTDOWN -> tickCountdown(server);
            case IN_GAME -> tickInGame(server);
            case ENDED -> tickEnded(server);
        }
    }

    public void onPlayerDeath(ServerPlayer player) {
        if (phase != BrGamePhase.IN_GAME) {
            return;
        }

        UUID playerId = player.getUUID();
        if (!aliveIds.remove(playerId)) {
            return;
        }

        pendingSpectatorIds.add(playerId);
        player.removeTag(ALIVE_TAG);

        MinecraftServer server = player.getServer();
        if (server != null) {
            broadcast(server, Component.literal("[mcbr] " + player.getGameProfile().getName() + " 탈락"));
            checkForWinner(server);
        }
    }

    public void onPlayerRespawn(ServerPlayer player) {
        UUID playerId = player.getUUID();
        if (!pendingSpectatorIds.remove(playerId)) {
            return;
        }

        player.setGameMode(GameType.SPECTATOR);
        player.sendSystemMessage(Component.literal("[mcbr] 탈락했습니다. 관전자 모드로 전환됩니다."));
    }

    public void onPlayerLogin(ServerPlayer player) {
        if (phase == BrGamePhase.WAITING) {
            sendPlayerToLobby(player);
            return;
        }

        player.setGameMode(GameType.SPECTATOR);
        player.sendSystemMessage(Component.literal("[mcbr] 경기 진행 중 접속했습니다. 현재 라운드에서는 관전만 가능합니다."));
    }

    public void resetMatch(MinecraftServer server) {
        phase = BrGamePhase.WAITING;
        countdownTicksRemaining = 0;
        endTicksRemaining = 0;
        participantIds.clear();
        aliveIds.clear();
        pendingSpectatorIds.clear();

        clearPlayerMarkers(server);

        for (ServerPlayer player : server.getPlayerList().getPlayers()) {
            sendPlayerToLobby(player);
        }

        restoreInitialBorder(server);
        broadcast(server, Component.literal("[mcbr] 경기 리셋이 완료되었습니다. 로비로 이동합니다."));
    }

    private void tickCountdown(MinecraftServer server) {
        countdownTicksRemaining--;
        if (countdownTicksRemaining <= 0) {
            beginMatch(server);
            return;
        }

        if (countdownTicksRemaining % 20 == 0) {
            int secondsLeft = countdownTicksRemaining / 20;
            broadcast(server, Component.literal("[mcbr] 경기 시작까지 " + secondsLeft + "초"));
        }
    }

    private void beginMatch(MinecraftServer server) {
        spreadPlayers(server);

        for (UUID playerId : aliveIds) {
            ServerPlayer player = server.getPlayerList().getPlayer(playerId);
            if (player != null) {
                player.setGameMode(GameType.SURVIVAL);
                player.sendSystemMessage(Component.literal("[mcbr] 경기 시작"));
            }
        }

        startBorder(server);
        phase = BrGamePhase.IN_GAME;
        broadcast(server, Component.literal("[mcbr] 전투 시작"));
    }

    private void tickInGame(MinecraftServer server) {
        for (UUID playerId : new ArrayList<>(aliveIds)) {
            ServerPlayer player = server.getPlayerList().getPlayer(playerId);
            if (player == null) {
                aliveIds.remove(playerId);
                participantIds.remove(playerId);
                continue;
            }

            if (player.isSpectator()) {
                aliveIds.remove(playerId);
                pendingSpectatorIds.remove(playerId);
                player.removeTag(ALIVE_TAG);
                broadcast(server, Component.literal("[mcbr] " + player.getGameProfile().getName() + " 탈락"));
            }
        }

        checkForWinner(server);
    }

    private void tickEnded(MinecraftServer server) {
        endTicksRemaining--;
        if (endTicksRemaining <= 0) {
            resetMatch(server);
        }
    }

    private void checkForWinner(MinecraftServer server) {
        if (phase != BrGamePhase.IN_GAME) {
            return;
        }

        if (aliveIds.size() > 1) {
            return;
        }

        phase = BrGamePhase.ENDED;
        endTicksRemaining = BrModConfig.END_DELAY_SECONDS.get() * 20;

        if (aliveIds.isEmpty()) {
            broadcast(server, Component.literal("[mcbr] 이번 라운드는 승자 없이 종료되었습니다."));
            return;
        }

        UUID winnerId = aliveIds.iterator().next();
        ServerPlayer winner = server.getPlayerList().getPlayer(winnerId);
        if (winner != null) {
            broadcast(server, Component.literal("[mcbr] 승자: " + winner.getGameProfile().getName()));
        } else {
            broadcast(server, Component.literal("[mcbr] 승자 판정 중 플레이어를 찾지 못했습니다."));
        }
    }

    private void cleanupDisconnectedPlayers(MinecraftServer server) {
        participantIds.removeIf(uuid -> server.getPlayerList().getPlayer(uuid) == null);
        aliveIds.removeIf(uuid -> server.getPlayerList().getPlayer(uuid) == null);
        pendingSpectatorIds.removeIf(uuid -> server.getPlayerList().getPlayer(uuid) == null);
    }

    private void spreadPlayers(MinecraftServer server) {
        String command = String.format(
                "spreadplayers %d %d %d %d false @a[tag=%s]",
                BrModConfig.CENTER_X.get(),
                BrModConfig.CENTER_Z.get(),
                BrModConfig.SPREAD_DISTANCE.get(),
                BrModConfig.SPREAD_RANGE.get(),
                PLAYING_TAG
        );
        BrCommandUtil.runServerCommand(server, command);
    }

    private void startBorder(MinecraftServer server) {
        BrCommandUtil.runServerCommand(server, String.format(
                "worldborder center %d %d",
                BrModConfig.CENTER_X.get(),
                BrModConfig.CENTER_Z.get()
        ));
        BrCommandUtil.runServerCommand(server, "worldborder set " + BrModConfig.INITIAL_BORDER_SIZE.get());
        BrCommandUtil.runServerCommand(server, "worldborder set " + BrModConfig.FINAL_BORDER_SIZE.get() + " " + BrModConfig.SHRINK_SECONDS.get());
    }

    private void restoreInitialBorder(MinecraftServer server) {
        BrCommandUtil.runServerCommand(server, String.format(
                "worldborder center %d %d",
                BrModConfig.CENTER_X.get(),
                BrModConfig.CENTER_Z.get()
        ));
        BrCommandUtil.runServerCommand(server, "worldborder set " + BrModConfig.INITIAL_BORDER_SIZE.get());
    }

    private void sendPlayerToLobby(ServerPlayer player) {
        MinecraftServer server = player.getServer();
        if (server == null) {
            return;
        }

        ServerLevel level = server.getLevel(Level.OVERWORLD);
        if (level == null) {
            return;
        }

        player.removeTag(PLAYING_TAG);
        player.removeTag(ALIVE_TAG);
        player.setGameMode(GameType.ADVENTURE);
        player.teleportTo(level,
                BrModConfig.LOBBY_X.get() + 0.5D,
                BrModConfig.LOBBY_Y.get(),
                BrModConfig.LOBBY_Z.get() + 0.5D,
                player.getYRot(),
                player.getXRot());
    }

    private void clearPlayerMarkers(MinecraftServer server) {
        for (ServerPlayer player : server.getPlayerList().getPlayers()) {
            player.removeTag(PLAYING_TAG);
            player.removeTag(ALIVE_TAG);
        }
    }

    private void broadcast(MinecraftServer server, Component message) {
        server.getPlayerList().broadcastSystemMessage(message, false);
    }
}
