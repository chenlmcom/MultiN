# MultiN

This project shares a multi-mode keyboard operation scheme, which is mainly suitable for notebooks. By combining the touchpad and keyboard, the operability of the keyboard can be greatly enriched.

## Multi-touch multi-mode keyboard solution

The idea of ​​this solution is to map the keys of the keyboard into different modes through different multi-finger touch modes, thereby expanding the keys of the keyboard, shortening the keystroke, and submitting input efficiency. For example, `single-finger touch+hjkl` is mapped to arrow keys, and `four-finger touch+hjkl` is mapped to window layout shortcut keys.

In order to facilitate memory, this program divides the control mode into four modes:

Single-finger touch + key: single-finger keyboard expansion mode

Two-finger touch + button: two-finger program control mode

Three-finger touch + button: three-finger program start mode

Four-finger touch + button: Four-finger window management mode

### Single finger keyboard expansion mode

This mode expands the notebook keypad into a full keyboard through single-finger touch + keys. The keys are defined as follows (Multi_1 means single-finger touch):

Multi_1 + h -> left

Multi_1 + j -> down

Multi_1 + k -> up

Multi_1 + l -> right

...

### Two-finger program control mode

This mode maps two-finger touch + buttons into operation shortcuts of different programs. The currently defined program control buttons are as follows (Multi_2 means two-finger touch):

General keys:

Multi_2 + s -> Command + S

Multi_2 + w -> Command + W

Multi_2 + q -> Command + Q

Firefox:

Multi_2 + h -> privious tab

Multi_2 + l -> next tab

Multi_2 + j -> page down

Multi_2 + l -> page up

...

### Three-finger program opening mode

This mode maps the three-finger touch + button to open different programs. The currently defined program control buttons are as follows (Multi_3 means three-finger touch):

Multi_3 + f -> Firefox

Multi_3 + e -> Emacs

Multi_3 + t -> iTerm2

Multi_3 + i -> Intellij Idea

...

### Four-finger window management mode

This mode maps the four-finger touch + key to window management shortcut keys. The window management uses Harmmerspoon. The defined keys are as follows (Multi_4 means four-finger touch):

Multi_4 + h -> the left side of the dual screen

Multi_4 + l -> the right side of the two split screen

Multi_4 + j -> the bottom side of the two split screen

Multi_4 + k -> the upper side of the two split screen

Multi_4 + f -> full screen

...

![Touch keyboard solution diagram](images/macOS touch keyboard solution.png "Touch keyboard solution diagram")

## Method to realize

Goal This solution is only realized through open source software on macOS.

## Software used

* Hammerspoon + WinWin plugin
* Karabiner-Element

  Need to open Multi Touch plug-in

## How to use

The generated configuration files are in the dist directory and can be used directly.

multi_n.json is the Karabiner_Element configuration file, which can be copied or linked to the Karabiner_Element configuration directory to enable.
Karabiner_Element configuration directory is /Users/<user name>/.config/karabiner/assets/complex_modifications.

config.lua is the Hammerspoon configuration file, which can be introduced in the Harmmerspoon configuration file.

## Custom keyboard mapping

If you need to customize, you can modify the keyboard mapping configuration file config.ini in the src directory, and then execute the makejson.py file to regenerate the multi_n.json configuration file.