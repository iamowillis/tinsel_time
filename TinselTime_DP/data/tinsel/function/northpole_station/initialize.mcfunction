

# ======= [DEBUG] =======
function tinsel:00_debug/msg {msg:"Station INITALIZED"}
# Instantly shows where the marker was created.
execute if score enabled dbg matches 1 run particle end_rod ~ ~1 ~ 0.2 0.2 0.2 0 25 force
# ========================


# Stop here if executor is not the station marker
execute unless entity @s[type=minecraft:marker,tag=tinsel.station] run return 0
# The market must be inside a barrel
execute unless block ~ ~ ~ minecraft:barrel run return 0





# NOTE:: Not sure if we need this to begin with since the table ticker will always replace
#       the table's title with the ui

# Change block's name to place UI
# data modify block ~ ~ ~ CustomName set value {text:"\ue000",font:"tinsel:ui",italic:false}

playsound minecraft:block.metal.place block @a ~ ~ ~

