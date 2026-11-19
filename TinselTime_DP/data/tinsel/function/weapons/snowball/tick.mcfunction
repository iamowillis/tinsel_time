execute as @e[type=minecraft:snowball,tag=!oj.tracked] at @s run function tinsel:weapons/snowball/track
scoreboard players add @e[type=minecraft:marker,tag=oj.snowball_tracker] oj.age 1
tag @e[type=minecraft:marker,tag=oj.snowball_tracker] remove oj.vehicle_alive
execute as @e[type=minecraft:marker,tag=oj.snowball_tracker] at @s on vehicle if entity @s[type=minecraft:snowball] on passengers if entity @s[type=minecraft:marker,tag=oj.snowball_tracker] run tag @s add oj.vehicle_alive
execute as @e[type=minecraft:marker,tag=oj.snowball_tracker,tag=!oj.vehicle_alive,scores={oj.age=1..}] at @s run function tinsel:weapons/snowball/impact
