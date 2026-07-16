# Core match start entry shared by lever/admin start paths.
function mcbr:admin/ensure_runtime_values
function mcbr:admin/ensure_combat_center
execute unless score $state mcbr.state matches 0 run function mcbr:core/reset_game
function mcbr:core/prepare_round
function mcbr:core/start_game_continue
