#!/bin/bash

# Rofi Power Menu

# Options
options="Shutdown
Restart
Lock"

# Get user choice
chosen=$(echo -e "$options" | rofi -dmenu -p "Power")

# Execute action based on choice
case "$chosen" in
    "Shutdown")
        shutdown now
        ;;
    "Restart")
        reboot
        ;;
    "Lock")
        swaylock -f -c 000000
        ;;
    *)
        ;;
esac
