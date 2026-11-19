#´:°•.°+.*•´.*:˚.°*.˚•´.°:°•.°•.*•´.*:˚.°*.˚•´.°:°•.°+.*•´.*:
#       CUSTOM STATION ---- GAME TICK FUNCTION
#.•°:°.´+˚.*°.˚:*.´•*.+°.•°:´*.´•*.•°.•°:°.´:•˚°.*°.˚:*.´+°.•



# TODO FIND A WAY TO CHECK ONLY IF THE PLAYER HAS A TABLE OPEN!!!!


# runs every tick on a loaded north pole station

# removing illegal items from player inventory
clear @a[distance=..10] barrier[item_name=""]

# removing illegal items from ground
kill @e[type=item,nbt={Item:{id:"minecraft:barrier",components:{"minecraft:item_name":""}}},distance=..10]

# Never allow this function to operate as a player.
#! NOTICE make sure that the tag doesn't need to be the tinsel.station ray marker!
execute unless entity @s[type=minecraft:marker,tag=tinsel.northpole_station] run return 0




#! FIXME add barrier replacement functions