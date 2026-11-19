execute if block ~ ~ ~ minecraft:snow run return run function tinsel:snowball/one_layer/add
execute if block ~ ~-1 ~ minecraft:snow positioned ~ ~-1 ~ run return run function tinsel:snowball/one_layer/add
execute if block ~ ~1 ~ minecraft:snow positioned ~ ~1 ~ run return run function tinsel:snowball/one_layer/add
execute if block ~ ~ ~ #minecraft:air unless block ~ ~-1 ~ #minecraft:air run return run function tinsel:snowball/one_layer/place_new
execute unless block ~ ~ ~ #minecraft:air if block ~ ~1 ~ #minecraft:air positioned ~ ~1 ~ run return run function tinsel:snowball/one_layer/place_new
execute if block ~ ~-1 ~ #minecraft:air unless block ~ ~-2 ~ #minecraft:air positioned ~ ~-1 ~ run return run function tinsel:snowball/one_layer/place_new
return 0
