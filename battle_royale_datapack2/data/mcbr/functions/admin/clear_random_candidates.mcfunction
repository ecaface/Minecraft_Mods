# 기존에 생성된 모든 상자 후보지 마커 및 미리보기 블록 제거 관리자 명령 단축키

forceload add 880 880 1120 1120
function mcbr:map/clear_chest_candidate_preview
kill @e[type=minecraft:marker,tag=mcbr_chest_candidate]
forceload remove 880 880 1120 1120

tellraw @a [{"text":"[mcbr2] 모든 랜덤 상자 후보지 마커 및 미리보기가 청소되었습니다.","color":"red"}]
