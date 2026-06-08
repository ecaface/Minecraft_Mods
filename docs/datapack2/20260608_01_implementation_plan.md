# Implementation Plan - battle_royale_datapack2 Seed-Independent Refactoring

Refactor the datapack to make it 100% independent of specific coordinate values and world seeds. By dynamically reading the host's initial spawn coordinates, we can build the lobby and center the combat zone anywhere, ensuring safety over any terrain. We will also correct hardcoded references and range mismatches.

## Proposed Changes

### Dynamic Initialization & Player Logic

#### [NEW] [init_dynamic_coords.mcfunction](file:///d:/Projects/github/Minecraft_Mods/battle_royale_datapack2/data/mcbr/functions/admin/init_dynamic_coords.mcfunction)
* Dynamic base coordinate script executed for the first player joining a brand new world.
* Reads host X and Z spawn coordinates.
* Sets `$lobby_x`, `$lobby_y` (to 120), and `$lobby_z` (lobby in sky).
* Sets `$center_x`, `$center_z` (combat zone X+1000, Z+1000).
* Sets `$arena_center_x`, `$arena_center_z` to match.
* Automatically calls `mcbr:map/build_lobby_platform` to create the spawn lobby.

#### [NEW] [init_player.mcfunction](file:///d:/Projects/github/Minecraft_Mods/battle_royale_datapack2/data/mcbr/functions/player/init_player.mcfunction)
* Handles player initialization when they first join.
* Increments `$join_counter`.
* Triggers `init_dynamic_coords` if the world configuration is uninitialized.
* Performs state-based lobby/match routing.
* Tags player as `mcbr_initialized`.

#### [MODIFY] [tick.mcfunction](file:///d:/Projects/github/Minecraft_Mods/battle_royale_datapack2/data/mcbr/functions/tick.mcfunction)
* Modify initial player checks to delegate to `mcbr:player/init_player`.

#### [MODIFY] [load_config_defaults.mcfunction](file:///d:/Projects/github/Minecraft_Mods/battle_royale_datapack2/data/mcbr/functions/load_config_defaults.mcfunction)
* Remove absolute lobby and center coordinate settings, delegate them to dynamic initialization.

#### [MODIFY] [send_self_to_lobby.mcfunction](file:///d:/Projects/github/Minecraft_Mods/battle_royale_datapack2/data/mcbr/functions/player/send_self_to_lobby.mcfunction)
* Replace absolute `tp @s 0 100 0` with `tp @s @e[type=minecraft:marker,tag=mcbr_lobby_spawn,limit=1]`.

---

### Dynamic Lobby Building & Candidates Scanning

#### [MODIFY] [build_lobby_platform.mcfunction](file:///d:/Projects/github/Minecraft_Mods/battle_royale_datapack2/data/mcbr/functions/map/build_lobby_platform.mcfunction)
* Refactor to build relative to a temporary `mcbr_lobby_builder` marker placed at dynamic `$lobby_x`/`$lobby_y`/`$lobby_z` settings.
* Places a permanent `mcbr_lobby_spawn` marker at the center of the platform.

#### [MODIFY] [spawn_candidate_grid_candidates.mcfunction](file:///d:/Projects/github/Minecraft_Mods/battle_royale_datapack2/data/mcbr/functions/map/spawn_candidate_grid_candidates.mcfunction)
* Modify the 121 `summon` commands to execute relative to the `mcbr_center_marker` (e.g. `~-80 200 ~-80`).

#### [MODIFY] [generate_chest_candidates.mcfunction](file:///d:/Projects/github/Minecraft_Mods/battle_royale_datapack2/data/mcbr/functions/map/generate_chest_candidates.mcfunction)
* Summon `mcbr_center_marker` at dynamic center.
* Run relative `forceload add ~-120 ~-120 ~120 ~120` from the center.

#### [MODIFY] [generate_chest_candidates_complete.mcfunction](file:///d:/Projects/github/Minecraft_Mods/battle_royale_datapack2/data/mcbr/functions/map/generate_chest_candidates_complete.mcfunction)
* Perform relative `mcbr_chest_center` proximity tagging within `distance=..32` of the `mcbr_center_marker`.
* Clean up forceload and remove `mcbr_center_marker`.

#### [MODIFY] [register_chest_candidate_commit.mcfunction](file:///d:/Projects/github/Minecraft_Mods/battle_royale_datapack2/data/mcbr/functions/map/register_chest_candidate_commit.mcfunction)
* Remove the hardcoded `1000 ~ 1000` center check, delegate tagging to the step complete function.

---

### Dynamic Arena Backup & Restore (Resized 11x11 Grid)

#### [MODIFY] [backup_arena.mcfunction](file:///d:/Projects/github/Minecraft_Mods/battle_royale_datapack2/data/mcbr/functions/map/backup_arena.mcfunction)
* Update force load commands to dynamically load relative `~-88 ~-88 ~87 ~87` and `~904 ~904 ~1064 ~1064` segments.
* Expand Z-span and X-span bands to a complete 11x11 grid of 16x16 size (121 bands total) covering `X/Z: -88..87` relative to the center marker to fully encompass all candidate spawner zones.

#### [MODIFY] [restore_arena.mcfunction](file:///d:/Projects/github/Minecraft_Mods/battle_royale_datapack2/data/mcbr/functions/map/restore_arena.mcfunction)
* Perform relative entity clearing inside the expanded `dx=300, dy=67, dz=300` bounding box.
* Update relative `forceload` and restore clone commands to match the 11x11 grid layout.

## Verification Plan

### Manual Verification
1. Create a brand new Minecraft world using a random seed with the refactored `battle_royale_datapack2` installed.
2. Confirm the player is automatically teleported to a newly constructed lobby platform high in the sky directly above the world spawn point.
3. Flip the Lever (or run `/function mcbr:game/begin_match`) and verify that players are safely spread to the combat zone located exactly 1,000 blocks away from the lobby.
4. Verify that running chest candidate generation scans the correct local area and that arena backup/restore successfully resets terrain and chest loot at the dynamic coordinate bounds.
