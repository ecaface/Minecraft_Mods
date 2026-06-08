function mcbr:map/arena_clone_from_backup_q4
forceload remove 2000 2000 2143 2143
forceload remove 1008 1008 1151 1151
kill @e[type=minecraft:item,x=864,y=60,z=864,dx=287,dy=67,dz=287]
kill @e[type=minecraft:experience_orb,x=864,y=60,z=864,dx=287,dy=67,dz=287]
kill @e[type=minecraft:arrow,x=864,y=60,z=864,dx=287,dy=67,dz=287]
kill @e[type=minecraft:spectral_arrow,x=864,y=60,z=864,dx=287,dy=67,dz=287]
kill @e[type=minecraft:trident,x=864,y=60,z=864,dx=287,dy=67,dz=287]
execute if score $chest_refill_enabled mcbr.config matches 1 run function mcbr:core/refill_chests
tellraw @a [{"text":"[mcbr] Arena restored from backup region.","color":"aqua"}]
