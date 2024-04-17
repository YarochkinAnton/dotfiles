#!/usr/bin/env python

# PROBLEM:
# I want to watch some cool videos while I shave my yaks.
# I've managed to create custom hyprland windowrule to
# automatically float, resize, place and pin picture-in-picture window.
# The first problem comes from pinning a window.
# That is you cannot use standart picture-in-picture shortuct `F` to go fullscreen
# and you can't use fullscreen hyprland dispatcher on a pinned window
# SOLUTION:
# Develop a custom script that will:
# check that there is a window titled "Picture-in-Picture" that is pinned
# resize it to fullscreen
# place it in the center
# and set `fakefullscreen` to true by executing the dispatcher with the same name
# this way I can track the state of the window
# If said window is already "fullscreen"
# unset the `fakefullscreen`
# resize it and place it in the top left corner of the screen

import json
import subprocess

result = subprocess.run(
    "hyprctl -j clients".split(" "),
    text=True,
    stdout=subprocess.PIPE,
)

clients = json.loads(result.stdout)

for window in clients:
    if window["title"] == "Picture-in-Picture" and window["pinned"]:
        window_address = window["address"]
        batch = []
        if window["fakeFullscreen"]:
            batch = [
                f"dispatch focuswindow address:{window_address}",
                "dispatch fakefullscreen",
                "dispatch resizeactive exact 22% 24%",
                "dispatch movewindow r",
            ]
        else:
            batch = [
                f"dispatch focuswindow address:{window_address}",
                "dispatch resizeactive exact 90% 90%",
                "dispatch centerwindow",
                "dispatch fakefullscreen",
            ]
        command = "hyprctl --batch " + ";".join(batch)
        subprocess.call(command.split(" "))
