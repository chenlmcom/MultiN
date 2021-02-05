#!/usr/bin/python
import json
import configparser
import copy

allModifiers = ['caps_lock','left_command','left_control','left_option','left_shift','right_command','right_control','right_option','right_shift','fn','command','control','option','shift','left_alt','left_gui','right_alt','right_gui','any']

keyboards = [
  ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.' ],
  ['`', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '-', '=', '⌫'],
  ['⇥', 'q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p', '[', ']', '\\'],
  ['⇪', 'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', ';', '\'', '⏎'],
  ['⇧', 'z', 'x', 'c', 'v', 'b', 'n', 'm', ',', '. ', '/', '⇧'],
  ['fn', '⌃', '⌥', '⌘', ' ', '⌘', '⌥', '←', '↑', '↓', '→'],
]

keyMap = {
  'comma': ',',
  'period': '. ',
  'hyphen': '-',
  'equal_sign': '=',
  'grave_accent_and_tilde': '`',
  'spacebar': ' '
}

keySpace = {
  '113': [1, 1], # ⌫
  '20': [1, 1], # ⇥
  '30': [2, 1], # ⇪
  '312': [1, 1], # ⏎
  '40': [2, 2], # 左⇧
  '411': [2, 2], # 右⇧
  '54': [4, 4], # Spacebar
}

def genManTos(to, modifiers):
  """
  生成manipulators to_event
  """
  tos = to.split(",")
  manTos = []
  for key in tos:
    manTo = {}
    if key.find(":") != -1:
      toMethod = key.split(":")
      cmd = toMethod[0]
      if cmd == 'shell':
        manTo["shell_command"] = toMethod[1]
      elif cmd == 'button':
        manTo["pointing_button"] = toMethod[1]
      elif cmd == 'mouse':
        move = toMethod[1].split(' ')
        manTo["mouse_key"] = {
              "x": move[0],
              "y": move[1],
              "vertical_wheel": move[2],
              "horizontal_wheel": move[3],
              "speed_multiplier": 1.0
          }
      elif cmd == 'set':
        # print('toMethod', toMethod, toMethod[1])
        name = toMethod[1].split(".")[0]
        value = toMethod[1].split(".")[1]
        manTo["set_variable"] = {
          "name": name,
          "value": int(value)
        }
    else:
      # key_code
      if key.find(" ") != -1:
        keys = key.split(" ")
        # print(tos[0:len(tos) - 1])
        manTo["key_code"] = keys[len(keys) - 1]
        manTo["modifiers"] = keys[0:len(keys) - 1]
      else:
        manTo["key_code"] = key
    if len(modifiers):
      copyManTo = copy.deepcopy(manTo)
      manTos.append(copyManTo)
      if 'modifiers' in copyManTo:
        copyManTo['modifiers'].extend(modifiers)
      else:
        copyManTo['modifiers'] = modifiers
    else:
      manTos.append(manTo)
  return manTos

def combine(li):
  '''
  生成列表组合
  '''
  reli = []
  for i in range(0, len(li)):
    if i == 0:
      reli.append([li[i]])
      # print(reli) [['a']]
    else:
      addli = []
      #增加单个的字符
      addli.append([li[i]])
      for ii in reli:
          addli.append(ii+[li[i]])
          # 如果有序
          # addli.append([li[i]] + ii)
      reli += addli
  return reli

def manipulator(key, modifiers, manTos, conditions):
  '''
  生成manipulator配置信息
  '''
  manipulator = {
    "type": "basic",
    "from": {},
    "to": manTos,
    "conditions": conditions
  }
  mod = copy.deepcopy(modifiers)
  simultaneous = []
  key_code = ''
  # 固定按键中含有.为组合键
  if key.find(".") != -1:
    keys = key.split(".")
    keyCodeCount = 0
    for k in keys:
      if k in allModifiers:
        mod.append(k)
      else:
        keyCodeCount += 1
        # 判断普通按键数
        if (keyCodeCount <= 1):
          key_code = k
        else:
          if key_code:
            simultaneous.append({
              "key_code": key_code
            })
            key_code = ''
          simultaneous.append({
            "key_code": k
          })
  else:
    key_code = key

  fromKeys = {}
  if key_code:
    fromKeys["key_code"] = key_code
  if mod:
    fromKeys["modifiers"] = { "mandatory": mod }
  if simultaneous:
    fromKeys["simultaneous"] = simultaneous
    # fromKeys["simultaneous_options"] = {
    #   "key_up_order": "insensitive",
    #   "key_down_order": "insensitive"
    # }
    # manipulator["parameters"] = {
    #   "basic.simultaneous_threshold_milliseconds": 1000
    # }
  manipulator["from"] = fromKeys
  return manipulator

def makeManipulators(key, to, conditions):
  manipulators = []
  froms = key.split('-') # 以-分割，
  if len(froms) >= 1:
    key = froms[len(froms) -1] # 最后一项为固定按键
    f = key
    t = to
    if to.find(";") != -1:
      tos = to.split(";")
      if len(tos) == 2:
        to = tos[0]
        t = tos[1]
      elif len(tos) == 3:
        to = tos[0]
        f = tos[1]
        t = tos[2]
    # print(sec + ":" + f + " to: " + t)
    dealKeyboard(secKeyboard, f, t)
    if len(froms) > 1: # 有同步按键时
      syncModifiers = combine(froms[0:len(froms) - 1]) # 前面几项为同步按键组合
      syncModifiers.append([])
      for syncModifier in syncModifiers:
        manTos = genManTos(to, syncModifier)
        modifiers = copy.deepcopy(syncModifier)
        manipulators.append(manipulator(key, modifiers, manTos, conditions))
    else:
      manTos = genManTos(to, [])
      manipulators.append(manipulator(key, [], manTos, conditions))
  return manipulators

def keyboard(keys):
  keyboard = "@startsalt\n{\n"
  for i in range(len(keys)):
    lineKeys = keys[i]
    for idx in range(len(lineKeys)):
      key = lineKeys[idx]
      spaceKey = str(i) + '' + str(idx)
      if spaceKey in keySpace:
        space = keySpace[spaceKey]
        key = "".join([" "]*space[0]) + key + "".join([" "]*space[1])
      if key == '⇥' or key == '⌫' or key == '⏎':
        key = ' ' + key + ' '
      elif key == '⇪':
        key = '  ' + key + ' '
      elif key == '⇧':
        key = '  ' + key + '  '
      elif key == ' ':
        key = '         '
      if key == '.':
        pass
      elif len(key) == 1:
        lineKeys[idx] = "[ " + key + " ]|*"
      elif len(key) == 2:
        lineKeys[idx] = "[ " + key + "]|*"
      else:
        lineKeys[idx] = "["
        for i in range(int(len(key)/2)):
          lineKeys[idx] += " "
        lineKeys[idx] += key
        for i in range(int(len(key)/2)):
          lineKeys[idx] += " "
        lineKeys[idx] += "]"
        for i in range(len(key) - 1):
          lineKeys[idx] += "|*"
    keyboard += "|".join(lineKeys)
    keyboard += '\n'
  keyboard += '}\n@endsalt'
  return keyboard

def dealKeyboard(keys, f, t):
  for lineKeys in keys:
    for idx in range(len(lineKeys)):
      key = lineKeys[idx]
      if f in keyMap:
        f = keyMap[f]
      if key == f:
        lineKeys[idx] = t

configFile = 'config.ini'
distFile = '../dist/multi_n.json'
keyboardDir = '../dist/keyboards/'

cf = configparser.ConfigParser()
cf.read(configFile)

print('---- 生成Karabiner_Elemnets配置文件 -----')
data = {
  "title" : "",
  "maintainers" : [],
  "rules" : []
}
secs = cf.sections()
# print(secs)
for sec in secs:
  print('------ section: ' + sec + ' --------')
  options = cf.options(sec)
  print(options)
  secKeyboard = copy.deepcopy(keyboards)
  options = cf.options(sec)

  # manipulators
  manipulators = []
  conditions = []
  for option in options:
    # conditions
    if option in ['desc']:
      continue
    elif option == 'title':
      data['title'] = cf.get('MultiN', 'title')
    elif option == 'maintainers':
      data['maintainers'] = [cf.get('MultiN', 'maintainers')]
    elif option in ['apps']:
      conditions.append({
        "type": "frontmost_application_if",
        "bundle_identifiers": cf.get(sec, option).split(',')
      })
    elif option in ['total', 'lower_half_area', 'upper_half_area', 'left_half_area', 'right_half_area']:
      conditions.append({
        "type": "variable_if",
        "name": "multitouch_extension_finger_count_" + option,
        "value": int(cf.get(sec, option))
      })
    elif option in ['mode-key']:
      modeKey = cf.get(sec, option).split(',')[0]
      modeKeyNext = modeKey
      modeKeyPrev = ""
      if modeKey.find(":") != -1:
        modeKeyNext = modeKey.split(":")[0]
        modeKeyPrev = modeKey.split(":")[1]
      modeValue = int(cf.get(sec, option).split(',')[1])
      for mode in range(modeValue + 1):
        nextMode = str((mode + 1) % (modeValue + 1))
        prevMode = str((mode + modeValue) % (modeValue + 1))
        # print('mode:' + str(mode) + ":" + nextMode + ":" + prevMode)
        modConditions = []
        modConditions.extend(conditions)
        modConditions.append({
          "type": "variable_if",
          "name": "multi_mode",
          "value": mode
        })
        modConditions.append({
          "type": "variable_if",
          "name": "multitouch_extension_finger_count_total",
          "value": 0
        })

        modeNextManipulator = makeManipulators(modeKeyNext,
          "set:multi_mode." + nextMode + ",left_command left_shift left_control left_option " + nextMode,
          modConditions)[0]
        modeNextManipulator['to_if_alone'] = modeNextManipulator['to']
        modeNextManipulator['to'] = { "key_code": modeKeyNext }
        manipulators.append(modeNextManipulator)

        modePrevManipulator = makeManipulators(modeKeyPrev,
          "set:multi_mode." + prevMode + ",left_command left_shift left_control left_option " + prevMode,
          modConditions)[0]
        modePrevManipulator['to_if_alone'] = modePrevManipulator['to']
        modePrevManipulator['to'] = { "key_code": modeKeyPrev }
        manipulators.append(modePrevManipulator)

        modePrevManipulator = makeManipulators('esc',
          "set:multi_mode." + prevMode + ",left_command left_shift left_control left_option " + prevMode,
          modConditions)[0]
        modePrevManipulator['to_if_alone'] = modePrevManipulator['to']
        modePrevManipulator['to'] = { "key_code": modeKeyPrev }
        manipulators.append(modePrevManipulator)
    elif option in ['mode']:
      conditions.append({
        "type": "variable_if",
        "name": "multi_mode",
        "value": int(cf.get(sec, option))
      })
    else:
      manipulators.extend(makeManipulators(option, cf.get(sec, option), conditions))
      
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
  print(keyboard(secKeyboard), file = open(keyboardDir + sec + '.puml', "w"))

# 打开文件以便写入
f = open(distFile, "w")
print(json.dumps(data, indent=2), file = f)
print('---- 生成完成 OK -----')
