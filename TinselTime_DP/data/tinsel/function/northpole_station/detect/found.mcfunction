###´:°•.°+.*•´.*:˚.°*.˚•´.°:°•.°•.*•´.*:˚.°*.˚•´.°:°•.°+.*•´.*:
###       CUSTOM STATION ---- RAYCAST FOUND FUNCTION
###.•°:°.´+˚.*°.˚:*.´•*.+°.•°:´*.´•*.•°.•°:°.´:•˚°.*°.˚:*.´+°.•

# Because the raycast may enter the barrel at any coordinate within its one-block volume, 
#  align xyz snaps the command to the block’s lower corner. 
# Then positioned ~0.5 ~ ~0.5 places the marker in its horizontal center.


# Snap to the containing block, then summon at its center
execute align xyz positioned ~0.5 ~ ~0.5 run summon minecraft:marker ~ ~ ~ {\
  Tags:[\
    "tinsel.station",\
    "tinsel.station.new"\
  ]\
}

# Initialize only the marker just created at this block
execute align xyz positioned ~0.5 ~ ~0.5 as @e[\
  type=minecraft:marker,\
  tag=tinsel.station.new,\
  distance=..0.1,\
  limit=1,\
  sort=nearest\
] at @s run function tinsel:northpole_station/initialize

# Remove the temporary selector tag
tag @e[\
  type=minecraft:marker,\
  tag=tinsel.station.new,\
  distance=..1,\
  limit=1,\
  sort=nearest\
] remove tinsel.station.new