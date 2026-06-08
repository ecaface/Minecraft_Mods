# 후보지 위치에 임시 상자 생성

function mcbr:map/forceload_arena
execute as @e[type=minecraft:marker,tag=mcbr_chest_candidate] at @s run function mcbr:map/preview_chest_candidate_here
function mcbr:map/forceload_arena_remove
tellraw @a [{"text":"[mcbr2] 후보지 미리보기 상자를 생성했습니다.","color":"yellow"}]
