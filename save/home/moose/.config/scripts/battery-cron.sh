#!/bin/sh

export DISPLAY=:1
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

STATUS=`cat /sys/class/power_supply/BAT0/status`
CAPACITY=`cat /sys/class/power_supply/BAT0/capacity`
CRITICAL=10

[ $CAPACITY -le $CRITICAL ] && [ "$STATUS" = "Discharging" ] && notify-send -u critical "Battery low" "Charge immediatly bozo >:T"
