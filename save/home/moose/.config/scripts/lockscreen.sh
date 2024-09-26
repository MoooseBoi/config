#!/bin/sh

opts="lock reboot shutdown"

case "$(echo -e $opts | sed 's/ /\n/g' | dmenu)" in
  "lock") ;;  # add lock screen 
  "reboot") reboot;;
  "shutdown") systemctl poweroff;;  # look into proper shutdown procedure
esac
