# Custom-block maintenance is added here as more tiers are implemented.
# (Probably?)
#
# Snow Bricks:
# minecraft:note_block[instrument=harp,note=1,powered=false]
#
# Packed Snow Bricks:
# minecraft:note_block[instrument=harp,note=2,powered=false]
#
# Reinforced Permafrost:
# minecraft:note_block[instrument=harp,note=3,powered=false]

# Validate every registered Snow Bricks block.
# execute as @e[type=minecraft:marker,tag=oj.custom_block,tag=oj.snow_bricks] at @s run function tinsel:blocks/validate/snow_bricks

# Validate every registered Packed Snow Bricks block.
# execute as @e[type=minecraft:marker,tag=oj.custom_block,tag=oj.packed_snow_bricks] at @s run function tinsel:blocks/validate/packed_snow_bricks

# Validate every registered Snow Bricks block.
# execute as @e[type=minecraft:marker,tag=oj.custom_block,tag=oj.reinforced_permafrost_block] at @s run function tinsel:blocks/validate/reinforced_permafrost