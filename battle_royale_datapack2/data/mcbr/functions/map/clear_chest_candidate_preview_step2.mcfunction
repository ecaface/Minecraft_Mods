# 후보지 미리보기 상자와 표식 제거 (Step 2: 청크가 로드된 상태에서 제거 실행)
function mcbr:map/forceload_arena
execute as @e[type=minecraft:marker,tag=mcbr_chest_candidate] at @s run function mcbr:map/clear_chest_candidate_preview_here
function mcbr:map/forceload_arena_remove
tellraw @a [{"text":"[mcbr2] 후보지 미리보기 상자를 제거했습니다.","color":"yellow"}]
