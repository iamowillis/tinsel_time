###´:°•.°+.*•´.*:˚.°*.˚•´.°:°•.°•.*•´.*:˚.°*.˚•´.°:°•.°+.*•´.*:
###       CUSTOM STATION ---- ADVANCEMENT TICK FUNCTION
###.•°:°.´+˚.*°.˚:*.´•*.+°.•°:´*.´•*.•°.•°:°.´:•˚°.*°.˚:*.´+°.•

# COMES FROM `advancement/placement/place_np_station`
# This is essentially the ticker that activates when placing a
# "North Pole Table" (`np_table`)

# `northpole_station.raycast` is created in `system/init`

# ======= [DEBUG] =======
function tinsel:00_debug/msg {msg:"PLACED STATION"}
# ========================

# Give this raycast a maximum of 24 quarter-block steps: 6 blocks
# ``
scoreboard players set @s northpole_station.raycast 24

# Start slightly in front of the player's eyes
execute anchored eyes positioned ^ ^ ^0.1 run function tinsel:northpole_station/detect/placed


# FIXME!!!
#! I probably need to make a separate achievement for ALL custom stations...
# This one will be for the actual progression of the datapack...
advancement revoke @s only tinsel:place_station