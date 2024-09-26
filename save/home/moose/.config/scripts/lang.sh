#!/bin/sh

change_lang ()
{
  echo $1 > /tmp/lang
  setxkbmap $1
  notify-send -u low "Changed language" $2
}

fallback () {
  echo "us" > /tmp/lang
}

# prevent issues if file wasnt created/deleted
[ ! -f /tmp/lang ] && fallback

# get current keymap
lang="$(cat /tmp/lang)"

# toggle language
case $lang in
  "us") change_lang il "Hebrew";;
  "il") change_lang us "English";;
  *) fallback && notify-send "lang error" "how?..."
esac
