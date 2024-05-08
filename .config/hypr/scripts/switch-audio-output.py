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

class Sink:
    def __init__(self, id, name):
        self.id = id
        self.name = name

def sinks():
    output = subprocess.run(
        ["pactl", "list", "sinks", "short"], text=True, stdout=subprocess.PIPE
    )
    lines = output.stdout.splitlines()
    sinks = [line.split() for line in lines]
    return sinks


def get_active_sink():
    for sink in sinks():
        if "RUNNING" in sink:
            return Sink(sink[0], sink[1])

def find_sink(name):
    for sink in sinks():
        if name in sink[1]:
            return Sink(sink[0], sink[0])


def set_default_sink(id):
    subprocess.call(["pactl", "set-default-sink", id])


sink_a_name = sys.argv[1]
sink_b_name = sys.argv[2]

active_sink = get_active_sink()

if active_sink == None:
    exit(1)

if sink_a_name in active_sink.name:
    sink_b = find_sink(sink_b_name)
    if sink_b == None:
        exit(1)
    set_default_sink(sink_b.id)
elif sink_b_name in active_sink.name:
    sink_a = find_sink(sink_a_name)
    if sink_a == None:
        exit(1)
    set_default_sink(sink_a.id)
else:
    exit(1)
