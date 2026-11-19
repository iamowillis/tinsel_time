summon minecraft:marker ~ ~ ~ {Tags:["tinsel.snow_seed","tinsel.new_seed"]}
spreadplayers ~ ~ 2 18 false @e[type=minecraft:marker,tag=tinsel.new_seed,sort=nearest,limit=1,distance=..2]
execute at @e[type=minecraft:marker,tag=tinsel.new_seed,sort=nearest,limit=1] positioned over motion_blocking_no_leaves run function tinsel:snowstorm/place
kill @e[type=minecraft:marker,tag=tinsel.new_seed,sort=nearest,limit=1]
