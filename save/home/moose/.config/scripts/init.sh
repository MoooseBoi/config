#!/bin/sh

# background
~/.fehbg

# daemon apps
nm-applet &
blueman-applet &
sxhkd &
dunst &
picom &
polybar -c $XDG_CONFIG_HOME/polybar/config.ini &
