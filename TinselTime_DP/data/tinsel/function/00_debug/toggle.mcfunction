

execute if score enabled dbg matches 0 run scoreboard players set enabled dbg 1
execute if score enabled dbg matches 1 run scoreboard players set enabled dbg 0

tellraw @s [\
  "",\
  {"text":"[DEBUG] ","color":"yellow"},\
  {"score":{"name":"enabled","objective":"dbg"}}\
]