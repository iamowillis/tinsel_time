###´:°•.°+.*•´.*:˚.°*.˚•´.°:°•.°•.*•´.*:˚.°*.˚•´.°:°•.°+.*•´.*:
###       CUSTOM STATION ---- RAYCAST PLACEMENT FUNCTION
###.•°:°.´+˚.*°.˚:*.´•*.+°.•°:´*.´•*.•°.•°:°.´:•˚°.*°.˚:*.´+°.•

# Raycast at most performs 24 predicate checks

# Stop if the current position is inside the custom station
execute if predicate tinsel:is_np_station run function tinsel:northpole_station/detect/found
execute if predicate tinsel:is_np_station run return 1

# # Consume one raycast step
scoreboard players remove @s northpole_station.raycast 1

# ======= [DEBUG] ======
# Creates a visible red line.
execute if score enabled dbg matches 1 run particle dust{color:[1.0,0.0,0.0],scale:1.0} ~ ~ ~ 0 0 0 0 1 force
# ======================

# # Continue 0.25 blocks forward
execute if score @s northpole_station.raycast matches 1.. positioned ^ ^ ^0.25 run function tinsel:northpole_station/detect/placed