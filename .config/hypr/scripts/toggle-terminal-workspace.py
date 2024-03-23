#!/usr/bin/env python

# PROBLEM:
# Due to special workspaces' style limitations I've decided to use regular workspace to host my main terminal
# but as far as I know there is no ability to toggle regular workspaces.
# By toggling I mean pressing the same key combination e.g. `$mainMod + SPACE` to switch to regular workspace and then switch
# to the previous workspace
# SOLUTION:
# Assign custom script to said key combination that will do the following:
# - Determine if terminal workspace is active on any monitor
# - If so execute `hyprctl dispatch workspace previous`
# - If not execute `hyprctl dispatch workspace name:terminal`
# NOTE: Can use different behaviour by providing argument `focused`
# Will then check if terminal workspace not just active but focused

import subprocess
import json
import sys


def is_terminal_workspace_active(monitors):
    for monitor in monitors:
        if monitor["activeWorkspace"]["name"] == "terminal":
            return True


def is_terminal_workspace_focused(monitors):
    for monitor in monitors:
        if monitor["activeWorkspace"]["name"] == "terminal" and monitor["focused"]:
            return True


def select_filter():
    if "focused" in sys.argv:
        return is_terminal_workspace_focused
    else:
        return is_terminal_workspace_active


result = subprocess.run(
    ["hyprctl", "-j", "monitors"], text=True, stdout=subprocess.PIPE
)

monitors = json.loads(result.stdout)

condition = select_filter()

if condition(monitors):
    subprocess.call(["hyprctl", "dispatch", "workspace", "previous"])
else:
    subprocess.call(["hyprctl", "dispatch", "workspace", "name:terminal"])
