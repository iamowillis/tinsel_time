execute unless score enabled dbg matches 1 run return 0

tellraw @a[tag=developer] [\
  "",\
  {"text":"[DEBUG] ","color":"yellow"},\
  {"text":"$(msg)","color":"gray"}\
]