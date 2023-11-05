#!/bin/python3

import os

user=os.getlogin()

if os.path.exists("/home/"+user+"/.config/lvim/config.lua"):
    print("lvim config.lua already exists")
else:
    config = os.path.abspath("lvim/config.lua")
    print(config)
    if not os.path.exists("/home/"+user+"/.config/lvim"):
        os.system("mkdir -p /home/"+user+"/.config/lvim")
    lncmd = "ln -s " + config + " /home/"+user+"/.config/lvim/config.lua"
    os.system(lncmd)

if os.path.exists("/home/"+user+"/.config/wezterm/wezterm.lua"):
    print("wezterm wezterm.lua already exists")
else:
    config = os.path.abspath("wezterm/wezterm.lua")
    if not os.path.exists("/home/"+user+"/.config/wezterm"):
        os.system("mkdir -p /home/"+user+"/.config/wezterm")
    lncmd = "ln -s " + config + " /home/"+user+"/.config/wezterm/wezterm.lua"
    print(lncmd)
    os.system(lncmd)

if os.path.exists("/home/"+user+"/.tmux.conf"):
    print("Tmux .tmux.conf already exists")
else:
    config = os.path.abspath("tmux/.tmux.conf")
    lncmd = "ln -s " + config + " /home/"+user+"/.tmux.conf"
    print(lncmd)
    os.system(lncmd)
    config = os.path.abspath("tmux/.tmux")
    lncmd = "ln -s " + config + " /home/"+user+"/.tmux"
    print(lncmd)
    os.system(lncmd)
