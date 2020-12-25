#!/usr/bin/python
import json
import configparser

configFile = 'config.ini'
distFile = '../dist/multi_n.json'

cf = configparser.ConfigParser()
cf.read(configFile)

print('---- 生成Karabiner_Elemnets配置文件 -----')
data = {}
secs = cf.sections()
# print(secs)
for sec in secs:
  print('------ section: ' + sec + ' --------')
  options = cf.options(sec)
  print(options)
  if (sec == 'MultiN'):
    data['title'] = cf.get('MultiN', 'title')
    data['maintainers'] = [cf.get('MultiN', 'maintainers')]
  else:
    if 'rules' not in data:
      data['rules'] = []
    conditions = []
    options = cf.options(sec)

    # conditions
    if 'apps' in options:
      conditions.append({
        "type": "frontmost_application_if",
        "bundle_identifiers": cf.get(sec, 'apps').split(',')
      })

    for option in options:
      if option in ['total', 'lower_half_area', 'upper_half_area', 'left_half_area', 'right_half_area']:
        conditions.append({
          "type": "variable_if",
          "name": "multitouch_extension_finger_count_" + option,
          "value": int(cf.get(sec, option))
        })

    # manipulators
    manipulators = []
    for option in options:
      if option in ['total', 'desc', 'apps', 'lower_half_area', 'upper_half_area', 'left_half_area', 'right_half_area']:
        continue
      to = cf.get(sec, option)
      toMethod = to.split(":")
      manTos = []
      if len(toMethod) == 2:
        cmd = toMethod[0]
        if cmd == 'shell':
          manTos.append({
            "shell_command": toMethod[1]
          })
        elif cmd == 'button':
          manTos.append({
            "pointing_button": toMethod[1]
          })
        elif cmd == 'mouse':
          move = toMethod[1].split(' ')
          manTos.append({
            "mouse_key": {
                "x": move[0],
                "y": move[1],
                "vertical_wheel": move[2],
                "horizontal_wheel": move[3],
                "speed_multiplier": 1.0
            }
          })
      else:
        # key_code
        tos = to.split(",")
        for to in tos:
          keys = to.split(" ")
          # print(tos[0:len(tos) - 1])
          manTos.append({
            "key_code": keys[len(keys) - 1],
            "modifiers": keys[0:len(keys) - 1]
          })

      manipulators.append({
            "type": "basic",
            "from": {
              "key_code": option
            },
            "to": manTos,
            "conditions": conditions
          })
    # rule
    desc = ""
    if 'desc' in options:
      desc = cf.get(sec, 'desc')
    rule = {
      "description": desc,
      "available_since": "12.6.9",
      "manipulators": manipulators
    }
    data['rules'].append(rule)

# 打开文件以便写入
f = open(distFile, "w")
print(json.dumps(data, indent=2), file = f)
print('---- 生成完成 OK -----')