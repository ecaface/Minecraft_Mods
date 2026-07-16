function mcbr:debug/ensure_status_values
function mcbr:debug/copy_status_values

tellraw @s [{"text":"[mcbr] Status","color":"gold"}]
execute if entity @s[tag=mcbr_host] run tellraw @s [{"text":"- you_are_host: yes","color":"yellow"}]
execute unless entity @s[tag=mcbr_host] run tellraw @s [{"text":"- you_are_host: no","color":"yellow"}]
execute if entity @a[tag=mcbr_host,limit=1] run tellraw @s [{"text":"- current_host: ","color":"yellow"},{"selector":"@a[tag=mcbr_host,limit=1]","color":"white"}]
execute unless entity @a[tag=mcbr_host,limit=1] run tellraw @s [{"text":"- current_host: none","color":"yellow"}]
tellraw @s [{"text":"- state: ","color":"yellow"},{"score":{"name":"mcbr_state","objective":"mcbr.debug"},"color":"white"}]
tellraw @s [{"text":"- arena_restore_enabled: ","color":"yellow"},{"score":{"name":"mcbr_arena_restore","objective":"mcbr.debug"},"color":"white"}]
tellraw @s [{"text":"- chest_refill_enabled: ","color":"yellow"},{"score":{"name":"mcbr_chest_refill","objective":"mcbr.debug"},"color":"white"}]
tellraw @s [{"text":"- min_players: ","color":"yellow"},{"score":{"name":"mcbr_min_players","objective":"mcbr.debug"},"color":"white"}]
tellraw @s [{"text":"- max_players: ","color":"yellow"},{"score":{"name":"mcbr_max_players","objective":"mcbr.debug"},"color":"white"}]
tellraw @s [{"text":"- countdown_seconds: ","color":"yellow"},{"score":{"name":"mcbr_countdown_seconds","objective":"mcbr.debug"},"color":"white"}]
tellraw @s [{"text":"- initial_border: ","color":"yellow"},{"score":{"name":"mcbr_initial_border","objective":"mcbr.debug"},"color":"white"}]
tellraw @s [{"text":"- final_border: ","color":"yellow"},{"score":{"name":"mcbr_final_border","objective":"mcbr.debug"},"color":"white"}]
tellraw @s [{"text":"- shrink_seconds: ","color":"yellow"},{"score":{"name":"mcbr_shrink_seconds","objective":"mcbr.debug"},"color":"white"}]
tellraw @s [{"text":"- lobby: X=","color":"yellow"},{"score":{"name":"mcbr_lobby_x","objective":"mcbr.debug"},"color":"white"},{"text":" Y=","color":"yellow"},{"score":{"name":"mcbr_lobby_y","objective":"mcbr.debug"},"color":"white"},{"text":" Z=","color":"yellow"},{"score":{"name":"mcbr_lobby_z","objective":"mcbr.debug"},"color":"white"}]
tellraw @s [{"text":"- combat_center: X=","color":"yellow"},{"score":{"name":"mcbr_center_x","objective":"mcbr.debug"},"color":"white"},{"text":" Z=","color":"yellow"},{"score":{"name":"mcbr_center_z","objective":"mcbr.debug"},"color":"white"}]
