#!/bin/sh

if ls /sys/class/power_supply/sony_controller_battery_* 1> /dev/null 2>&1; then
    for i in /sys/class/power_supply/sony_controller_battery_*/capacity; do
        echo "$(cat $i)%"
    done
else
    echo "--%"
fi
