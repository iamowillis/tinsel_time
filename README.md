# Tinsel Time
A Minecraft Datapack that adds Christmas themed items!


## Current Items

### [Custom Station] :: The North Pole Table

Requires `custom_data` with the following:
```
"minecraft:custom_data": {
    "merry": {
        "station_item": true
    }
}
```


## TODO

### Crafting Station

- Fix misplaced items in the crafting station
- Make sure players can't put anything in the output slot
    - Make sure the item being crafted has custom NBT data that gives it ".new" so that when the player picks it up, that data gets removed
    - ONLY allow items with the `.new` nbt data to go in the output slot
- Make sure barriers actually disappear when destroying the station
- Play jiggle bells when making something

### Items

#### Consumables

- Hot coco
    - Make it placeable (or not since that might be difficult)


#### Weapons

- Add snowballs



### Mounts

- Add sled
