
# Gives the placeable-looking item.
give @s minecraft:barrel[\
  minecraft:item_name={\
    translate:"item.tinsel.northpole_station",\
    color:"green",italic:false,\
    fallback:"North Pole Station"\
  },\
  minecraft:item_model='minecraft:grindstone',\
  minecraft:lore=[{"text":"Right-click to summon a one-minute blizzard","color":"gray","italic":false}],\
  minecraft:custom_data={tinsel:{"block": "northpole_station",station_item:true}},\
  minecraft:block_entity_data={\
    id:"minecraft:barrel",\
    tinsel:{"block": "northpole_station",station_item:true}\
  }\
] 1