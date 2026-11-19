#´:°•.°+.*•´.*:˚.°*.˚•´.°:°•.°•.*•´.*:˚.°*.˚•´.°:°•.°+.*•´.*:
#             CONSTANT GAME TICK FUNCTION
#.•°:°.´+˚.*°.˚:*.´•*.+°.•°:´*.´•*.•°.•°:°.´:•˚°.*°.˚:*.´+°.•

execute as @a run function tinsel:player/tick

# Process only explicitly-created stations. This avoids changing ordinary barrels.
#! NOTICE make sure that the tag doesn't need to be the tinsel.station ray marker!
execute as @e[type=minecraft:marker,tag=tinsel.northpole_station] at @s run function tinsel:northpole_station/tick


function tinsel:weapons/snowball/tick
