#!/usr/bin/env python

# PROBLEM:
# Most of the time I work with my headphones on
# alongisde my partner in the same room.
# And when I want to show her some funny video I found
# on the internet I need to launch pulsemixer and change
# the default output device. I would be nice if can achieve that using only
# a key combination.
# SOLUTION:
# Create a script that will switch default audio outputs when executed.

import subprocess
import sys


def sinks():
    output = subprocess.run(
        ["pactl", "list", "sinks", "short"], text=True, stdout=subprocess.PIPE
    )
    lines = output.stdout.splitlines()
    sinks = [line.split() for line in lines]
    return sinks


def get_active_sinks():
    for sink in sinks():
        if "RUNNING" in sink:
            return sink[0]


def set_default_sink(id):
    subprocess.call(["pactl", "set-default-sink", id])


sink_a = sys.argv[1]
sink_b = sys.argv[2]

active_sink = get_active_sinks()

if active_sink == sink_a:
    set_default_sink(sink_b)
elif active_sink == sink_b:
    set_default_sink(sink_a)
