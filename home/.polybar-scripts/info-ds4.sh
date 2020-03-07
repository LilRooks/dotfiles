#!/bin/sh

if [[ -f /sys/class/power_supply/sony_controller_battery_* ]]; then
    for i in /sys/class/power_supply/sony_controller_battery_*/capacity; do
       echo "$(cat /sys/class/power_supply/sony_controller_battery_"$i"/capacity)%"
    done
else
    echo "--%"
fi
