#!/bin/bash

name=$1
directory=$2

BACKUP_DIR=~/.local/state/backups

mkdir -p $BACKUP_DIR

borg create $BACKUP_DIR::$name-{now:%Y-%m-%d_%H:%M:%S} $directory --info 2>>$BACKUP_DIR/backup.log

result=$?
status=""
urgency=""

if [ $result -eq 0 ]; then
    status="success"
    urgency="normal"
else
    status="failure"
    urgency="critical"
fi

notify-send -a BACKUP \
    --urgency $urgency \
    "Backup [$status]" \
    "name: $name\ntime: $(date)"
