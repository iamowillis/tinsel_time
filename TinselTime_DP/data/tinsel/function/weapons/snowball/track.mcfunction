tag @s add oj.tracked
summon minecraft:marker ~ ~ ~ {Tags:["oj.snowball_tracker","oj.new_tracker"]}
ride @e[type=minecraft:marker,tag=oj.new_tracker,sort=nearest,limit=1,distance=..0.25] mount @s
scoreboard players set @e[type=minecraft:marker,tag=oj.new_tracker,sort=nearest,limit=1,distance=..0.25] oj.age 0
tag @e[type=minecraft:marker,tag=oj.new_tracker,sort=nearest,limit=1,distance=..0.25] remove oj.new_tracker
