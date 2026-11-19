# One minute. Reusing the item refreshes the timer.
scoreboard players set @s tinsel.storm 1200
weather rain 60s
playsound minecraft:entity.lightning_bolt.thunder weather @a[distance=..64] ~ ~ ~ 0.35 0.7
playsound minecraft:block.amethyst_block.chime player @s ~ ~ ~ 1.0 0.65
particle minecraft:snowflake ~ ~1 ~ 3 2 3 0.15 120 force
# Consume one Frozen Mistletoe from the used hand.
item replace entity @s weapon.mainhand with minecraft:air
