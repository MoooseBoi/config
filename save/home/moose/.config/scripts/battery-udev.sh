#!/bin/sh

export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

STATUS=`cat /sys/class/power_supply/BAT0/status`
CAPACITY=`cat /sys/class/power_supply/BAT0/capacity`

su moose -c "notify-send $STATUS 'Capacity: $CAPACITY%'"
