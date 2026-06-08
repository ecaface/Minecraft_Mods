# Rotate unique starter pistols across active players.

tag @a[tag=mcbr_playing] remove mcbr_spawn_slot1
tag @a[tag=mcbr_playing] remove mcbr_spawn_slot2
tag @a[tag=mcbr_playing] remove mcbr_spawn_slot3
tag @a[tag=mcbr_playing] remove mcbr_spawn_slot4
tag @a[tag=mcbr_playing] remove mcbr_spawn_slot5
tag @a[tag=mcbr_playing] remove mcbr_spawn_glock
tag @a[tag=mcbr_playing] remove mcbr_spawn_m1911
tag @a[tag=mcbr_playing] remove mcbr_spawn_p320
tag @a[tag=mcbr_playing] remove mcbr_spawn_cz75
tag @a[tag=mcbr_playing] remove mcbr_spawn_deagle

# 라운드마다 시작 권총 순서를 한 칸씩 회전시켜 단독 테스트에서도 같은 권총만 반복되지 않게 한다.
scoreboard players add $starter_rotation mcbr.tmp 1
execute if score $starter_rotation mcbr.tmp matches 5.. run scoreboard players set $starter_rotation mcbr.tmp 0

tag @a[tag=mcbr_playing,sort=random,limit=1] add mcbr_spawn_slot1
tag @a[tag=mcbr_playing,tag=!mcbr_spawn_slot1,sort=random,limit=1] add mcbr_spawn_slot2
tag @a[tag=mcbr_playing,tag=!mcbr_spawn_slot1,tag=!mcbr_spawn_slot2,sort=random,limit=1] add mcbr_spawn_slot3
tag @a[tag=mcbr_playing,tag=!mcbr_spawn_slot1,tag=!mcbr_spawn_slot2,tag=!mcbr_spawn_slot3,sort=random,limit=1] add mcbr_spawn_slot4
tag @a[tag=mcbr_playing,tag=!mcbr_spawn_slot1,tag=!mcbr_spawn_slot2,tag=!mcbr_spawn_slot3,tag=!mcbr_spawn_slot4,sort=random,limit=1] add mcbr_spawn_slot5

execute if score $starter_rotation mcbr.tmp matches 0 run tag @a[tag=mcbr_spawn_slot1] add mcbr_spawn_glock
execute if score $starter_rotation mcbr.tmp matches 0 run tag @a[tag=mcbr_spawn_slot2] add mcbr_spawn_m1911
execute if score $starter_rotation mcbr.tmp matches 0 run tag @a[tag=mcbr_spawn_slot3] add mcbr_spawn_p320
execute if score $starter_rotation mcbr.tmp matches 0 run tag @a[tag=mcbr_spawn_slot4] add mcbr_spawn_cz75
execute if score $starter_rotation mcbr.tmp matches 0 run tag @a[tag=mcbr_spawn_slot5] add mcbr_spawn_deagle

execute if score $starter_rotation mcbr.tmp matches 1 run tag @a[tag=mcbr_spawn_slot1] add mcbr_spawn_m1911
execute if score $starter_rotation mcbr.tmp matches 1 run tag @a[tag=mcbr_spawn_slot2] add mcbr_spawn_p320
execute if score $starter_rotation mcbr.tmp matches 1 run tag @a[tag=mcbr_spawn_slot3] add mcbr_spawn_cz75
execute if score $starter_rotation mcbr.tmp matches 1 run tag @a[tag=mcbr_spawn_slot4] add mcbr_spawn_deagle
execute if score $starter_rotation mcbr.tmp matches 1 run tag @a[tag=mcbr_spawn_slot5] add mcbr_spawn_glock

execute if score $starter_rotation mcbr.tmp matches 2 run tag @a[tag=mcbr_spawn_slot1] add mcbr_spawn_p320
execute if score $starter_rotation mcbr.tmp matches 2 run tag @a[tag=mcbr_spawn_slot2] add mcbr_spawn_cz75
execute if score $starter_rotation mcbr.tmp matches 2 run tag @a[tag=mcbr_spawn_slot3] add mcbr_spawn_deagle
execute if score $starter_rotation mcbr.tmp matches 2 run tag @a[tag=mcbr_spawn_slot4] add mcbr_spawn_glock
execute if score $starter_rotation mcbr.tmp matches 2 run tag @a[tag=mcbr_spawn_slot5] add mcbr_spawn_m1911

execute if score $starter_rotation mcbr.tmp matches 3 run tag @a[tag=mcbr_spawn_slot1] add mcbr_spawn_cz75
execute if score $starter_rotation mcbr.tmp matches 3 run tag @a[tag=mcbr_spawn_slot2] add mcbr_spawn_deagle
execute if score $starter_rotation mcbr.tmp matches 3 run tag @a[tag=mcbr_spawn_slot3] add mcbr_spawn_glock
execute if score $starter_rotation mcbr.tmp matches 3 run tag @a[tag=mcbr_spawn_slot4] add mcbr_spawn_m1911
execute if score $starter_rotation mcbr.tmp matches 3 run tag @a[tag=mcbr_spawn_slot5] add mcbr_spawn_p320

execute if score $starter_rotation mcbr.tmp matches 4 run tag @a[tag=mcbr_spawn_slot1] add mcbr_spawn_deagle
execute if score $starter_rotation mcbr.tmp matches 4 run tag @a[tag=mcbr_spawn_slot2] add mcbr_spawn_glock
execute if score $starter_rotation mcbr.tmp matches 4 run tag @a[tag=mcbr_spawn_slot3] add mcbr_spawn_m1911
execute if score $starter_rotation mcbr.tmp matches 4 run tag @a[tag=mcbr_spawn_slot4] add mcbr_spawn_p320
execute if score $starter_rotation mcbr.tmp matches 4 run tag @a[tag=mcbr_spawn_slot5] add mcbr_spawn_cz75
