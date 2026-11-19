



# Red: final tracker location.
particle minecraft:dust{color:[1.0,0.0,0.0],scale:0.7} ~ ~ ~ 0 0 0 0 1 force

# Blue: each nearby player's eye position.
execute as @a[distance=..1.5] at @s anchored eyes positioned ^ ^ ^ run particle minecraft:dust{color:[0.0,0.3,1.0],scale:0.7} ~ ~ ~ 0 0 0 0 1 force


# Add tag to assume this was a block impact,
# and then add it back later conditionally
tag @s remove oj.hit_entity


# Players.
execute as @a[distance=..0.85] run function tinsel:snowball/head_hit

execute if entity @a[distance=..0.75,sort=nearest,limit=1] run tag @s add oj.hit_entity


# Living mobs.
execute if entity @e[type=#tinsel:mobs,distance=..0.75,sort=nearest,limit=1] run tag @s add oj.hit_entity


# If any non-marker entity is within the collision radius, treat this as an
# entity impact. The type exclusion prevents the tracker from detecting itself.
# execute if entity @e[type=!minecraft:marker,distance=..0.75,sort=nearest,limit=1] run tag @s add oj.hit_entity


# ============================================================
# Player headshot detection
# ============================================================

# Check whether this tracker is close to a player's eye position.
#
# We temporarily execute at each nearby player's eyes, then look for the
# abandoned snowball tracker within 0.40 blocks.

# execute as @a[distance=..2] at @s anchored eyes positioned ^ ^ ^ if entity @e[\
#     type=minecraft:marker,tag=oj.snowball_tracker,\
#     distance=..0.40,limit=1\
# ] run function tinsel:snowball/head_hit


# ============================================================
# Ground placement
#
# Only attempt to place snow when no entity was hit.
# ============================================================

scoreboard players set #placed oj.age 0

execute unless entity @s[tag=oj.hit_entity] store result score #placed oj.age run function tinsel:snowball/one_layer/place


execute if score #placed oj.age matches 1 run particle minecraft:snowflake ~ ~0.2 ~ 0.15 0.08 0.15 0.01 8 force
execute if score #placed oj.age matches 1 run playsound minecraft:block.snow.place block @a[distance=..16] ~ ~ ~ 0.5 1.2
kill @s
