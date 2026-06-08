# Quick debug dump for the current BR state.

tellraw @s [{"text":"[mcbr] state=","color":"gold"},{"score":{"name":"$state","objective":"mcbr.state"},"color":"white"},{"text":" countdown_ticks=","color":"gold"},{"score":{"name":"$countdown_ticks","objective":"mcbr.timer"},"color":"white"},{"text":" end_ticks=","color":"gold"},{"score":{"name":"$end_ticks","objective":"mcbr.timer"},"color":"white"}]
tellraw @s [{"text":"[mcbr] active_count=","color":"gold"},{"score":{"name":"$active_count","objective":"mcbr.tmp"},"color":"white"},{"text":" alive_count=","color":"gold"},{"score":{"name":"$alive_count","objective":"mcbr.tmp"},"color":"white"}]
