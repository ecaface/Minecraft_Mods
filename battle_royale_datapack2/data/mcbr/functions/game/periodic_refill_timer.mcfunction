# game/periodic_refill_timer.mcfunction
# Decrements the chest refill timer and triggers refill_all when it reaches 0.

scoreboard players remove $chest_refill_timer mcbr.timer 1

# When timer hits 0, trigger refill and reset timer
execute if score $chest_refill_timer mcbr.timer matches ..0 run function mcbr:loot/refill_all
execute if score $chest_refill_timer mcbr.timer matches ..0 run tellraw @a [{"text":"[mcbr] 보급 물자가 재보급되고 상자 위치가 셔플되었습니다!","color":"yellow"}]

# Reset timer to refill_interval * 20
execute if score $chest_refill_timer mcbr.timer matches ..0 run scoreboard players set $twenty mcbr.tmp 20
execute if score $chest_refill_timer mcbr.timer matches ..0 run scoreboard players operation $chest_refill_timer mcbr.timer = $chest_refill_interval mcbr.config
execute if score $chest_refill_timer mcbr.timer matches ..0 run scoreboard players operation $chest_refill_timer mcbr.timer *= $twenty mcbr.tmp
