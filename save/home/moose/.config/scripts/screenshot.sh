#!/bin/sh
case $1 in
  0) maim | xclip -selection clipboard -t image/png && notify-send -u low "Saving screenshot to clipboard";;
  1) maim -s | xclip -selection clipboard -t image/png && notify-send -u low "Saving screenshot to clipboard";;
esac
