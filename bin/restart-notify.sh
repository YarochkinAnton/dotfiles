#!/usr/bin/bash

/usr/bin/systemctl --user restart $1
exit_code=$?

if [ $1 == "mako" ]; then
    /usr/bin/sleep 1
fi

if [ $exit_code -eq 0 ]; then
    notify-send "Config watcher" "$1 restarted"
else
    notify-send -u critical "Config watcher" "$1 failed to restart"
fi
