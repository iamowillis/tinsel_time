# Do not bury players or entities standing at the target.
execute if entity @e[distance=..0.8,type=!minecraft:marker,limit=1] run return 0

# Add one layer to existing snow.
execute if block ~ ~ ~ minecraft:snow[layers=1] run return run setblock ~ ~ ~ minecraft:snow[layers=2]
execute if block ~ ~ ~ minecraft:snow[layers=2] run return run setblock ~ ~ ~ minecraft:snow[layers=3]
execute if block ~ ~ ~ minecraft:snow[layers=3] run return run setblock ~ ~ ~ minecraft:snow[layers=4]
execute if block ~ ~ ~ minecraft:snow[layers=4] run return run setblock ~ ~ ~ minecraft:snow[layers=5]
execute if block ~ ~ ~ minecraft:snow[layers=5] run return run setblock ~ ~ ~ minecraft:snow[layers=6]
execute if block ~ ~ ~ minecraft:snow[layers=6] run return run setblock ~ ~ ~ minecraft:snow[layers=7]
execute if block ~ ~ ~ minecraft:snow[layers=7] run return run setblock ~ ~ ~ minecraft:snow[layers=8]
execute if block ~ ~ ~ minecraft:snow[layers=8] run return run setblock ~ ~ ~ minecraft:snow_block

# Build a second layer above full snow blocks.
execute if block ~ ~-1 ~ minecraft:snow_block if block ~ ~ ~ #minecraft:air run return run setblock ~ ~ ~ minecraft:snow[layers=1]

# Start accumulation on a valid exposed surface.
execute if block ~ ~ ~ #minecraft:air unless block ~ ~-1 ~ #minecraft:air run return run setblock ~ ~ ~ minecraft:snow[layers=1] keep
return 0
