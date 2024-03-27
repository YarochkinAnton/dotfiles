#!/usr/bin/env python

# PROBLEM:
# When working with working with single terminal window or editing single file in neovim
# it's uncomfortable staring at the leftmost edge of the screen
# SOLUTION:
# Make active window floating, change it's width to 50% of the screen width,
# make it a little less taller than 100% of the screen hight,
# center it
#
# Also make this behavior toggleable. For reverse effect check if active window is floating

import json
import subprocess

result = subprocess.run(
    ["hyprctl", "-j", "activewindow"], text=True, stdout=subprocess.PIPE
)

active_window = json.loads(result.stdout)

if active_window["floating"]:
    subprocess.call("hyprctl dispatch togglefloating".split(" "))
else:
    dispatchers = [
        "dispatch togglefloating",
        "dispatch resizeactive exact 55% 90%",
        "dispatch centerwindow",
    ]
    command = "hyprctl --batch " + ";".join(dispatchers)
    subprocess.call(command.split(" "))
