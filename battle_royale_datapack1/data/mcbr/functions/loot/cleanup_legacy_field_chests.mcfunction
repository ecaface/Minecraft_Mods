# Remove legacy fixed field chests from the old 11-slot system before the dynamic 50-candidate refill runs.
# This prevents old backup/world state from leaving stale chests or dropping leftover contents in later rounds.

data remove block 970 90 970 LootTable
data merge block 970 90 970 {Items:[]}
setblock 970 90 970 air

data remove block 1001 88 965 LootTable
data merge block 1001 88 965 {Items:[]}
setblock 1001 88 965 air

data remove block 1030 86 970 LootTable
data merge block 1030 86 970 {Items:[]}
setblock 1030 86 970 air

data remove block 970 94 1030 LootTable
data merge block 970 94 1030 {Items:[]}
setblock 970 94 1030 air

data remove block 1000 82 1035 LootTable
data merge block 1000 82 1035 {Items:[]}
setblock 1000 82 1035 air

data remove block 1030 91 1030 LootTable
data merge block 1030 91 1030 {Items:[]}
setblock 1030 91 1030 air

data remove block 968 93 1002 LootTable
data merge block 968 93 1002 {Items:[]}
setblock 968 93 1002 air

data remove block 1033 89 1000 LootTable
data merge block 1033 89 1000 {Items:[]}
setblock 1033 89 1000 air

data remove block 995 91 981 LootTable
data merge block 995 91 981 {Items:[]}
setblock 995 91 981 air

data remove block 1012 91 1012 LootTable
data merge block 1012 91 1012 {Items:[]}
setblock 1012 91 1012 air

data remove block 1000 91 1000 LootTable
data merge block 1000 91 1000 {Items:[]}
setblock 1000 91 1000 air
