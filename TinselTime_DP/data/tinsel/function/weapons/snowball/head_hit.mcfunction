# Called on by impact.mcfunction


# Doesn't really work because of the ray...
# And probably also how snowballs work



# @s is the player who was hit in the head.

# Deal one heart of generic damage.
damage @s 0.1 minecraft:generic

# Immediate appearance, visible for 15 ticks, then fade over 15 ticks.
# Total duration is approximately 1.1 seconds.
title @s times 0 15 15

# Display the resource-pack glyph.
title @s title {text:"\uE002",font:"tinsel:snow_splat"}

effect give @s minecraft:blindness 2 0 true

# Optional sound and particles.
playsound minecraft:block.snow.break player @s ~ ~ ~ 0.8 0.8
particle minecraft:snowflake ~ ~1.6 ~ 0.25 0.25 0.25 0.02 15 force @s