# Activate only when the used item is Frozen Mistletoe.
execute as @a[scores={tinsel.mistletoe=1..}] if items entity @s weapon.mainhand minecraft:carrot_on_a_stick[minecraft:custom_data~{tinsel:{frozen_mistletoe:true}}] at @s run function tinsel:snowstorm/start
scoreboard players set @a[scores={tinsel.mistletoe=1..}] tinsel.mistletoe 0

# Global storm clock and player timers.
scoreboard players add #global tinsel.clock 1
scoreboard players remove @a[scores={tinsel.storm=1..}] tinsel.storm 1

# HUD countdown: copy ticks, round up, then convert to seconds.
execute as @a[scores={tinsel.storm=1..}] run scoreboard players operation @s tinsel.hud = @s tinsel.storm
scoreboard players add @a[scores={tinsel.storm=1..}] tinsel.hud 19
scoreboard players operation @a[scores={tinsel.storm=1..}] tinsel.hud /= #20 tinsel.hud

# For HUD centering:
# \uF100\uF101\ue100\uF100\uF10a\uF107\uF104\uF104

# For right-most:
# \uF10d\uF10d\uF10d\ue100\uF100\uF10a\uF107\uF104\uF104

# 10–60 seconds: display normally.
execute as @a[scores={tinsel.storm=1..,tinsel.hud=10..}] run title @s actionbar [\
    {"text":"\uF100\uF10b\ue100\uF100\uF10a\uF107\uF104\uF104","font":"tinsel:blizzard_hud","color":"white"},\
    {"text":"","font":"minecraft:default","extra":[\
        {"text":"00:","color":"gray"},\
        {"score":{"name":"@s","objective":"tinsel.hud"},"color":"white"},\
        {"text":"s","color":"gray"}\
    ]}\
]

# 0–9 seconds: insert a literal leading zero.
execute as @a[scores={tinsel.storm=1..,tinsel.hud=0..9}] run title @s actionbar [\
    {"text":"\uF100\uF10b\ue100\uF100\uF10a\uF107\uF104\uF104","font":"tinsel:blizzard_hud","color":"white"},\
    {"text":"","font":"minecraft:default","extra":[\
        {"text":"00:","color":"gray"},{"text":"0","color":"white"},\
        {"score":{"name":"@s","objective":"tinsel.hud"},"color":"white"},\
        {"text":"s","color":"gray"}\
    ]}\
]
# {"text":"❄ BLIZZARD  ","color":"aqua","bold":true},\

execute as @a[scores={tinsel.storm=0}] run title @s actionbar {"text":""}



# Blizzard visuals around affected players.
execute as @a[scores={tinsel.storm=1..}] at @s run particle minecraft:snowflake ~ ~3 ~ 10 6 10 0.08 90 force

# Accumulate snow every 10 ticks: six random surface attempts per active player.
execute if score #global tinsel.clock matches 10.. as @a[scores={tinsel.storm=1..}] at @s run function tinsel:snowstorm/accumulate
execute if score #global tinsel.clock matches 10.. run scoreboard players set #global tinsel.clock 0

# Keep rain active while at least one storm exists.
execute if entity @a[scores={tinsel.storm=1..}] run weather rain 2s
