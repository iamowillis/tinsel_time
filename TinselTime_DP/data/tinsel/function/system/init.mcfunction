#´:°•.°+.*•´.*:˚.°*.˚•´.°:°•.°•.*•´.*:˚.°*.˚•´.°:°•.°+.*•´.*:
#             DATAPACK INITIALIZER FUNCTION
#.•°:°.´+˚.*°.˚:*.´•*.+°.•°:´*.´•*.•°.•°:°.´:•˚°.*°.˚:*.´+°.•

# Called on by `load.mcfunction`

# ========= Creates raycast objective
scoreboard objectives add northpole_station.raycast dummy

# =========  For Snowball tracking
scoreboard objectives add oj.age dummy
kill @e[type=minecraft:marker,tag=oj.snowball_tracker]
kill @e[type=minecraft:marker,tag=oj.new_tracker]



scoreboard objectives add dbg dummy
scoreboard players set enabled dbg 0

# =========  For SnowStorm
scoreboard objectives add tinsel.mistletoe minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add tinsel.storm dummy
scoreboard objectives add tinsel.clock dummy
scoreboard objectives add tinsel.hud dummy
scoreboard players set #20 tinsel.hud 20
kill @e[type=minecraft:marker,tag=tinsel.snow_seed]



function tinsel:system/print