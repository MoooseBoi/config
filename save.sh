#!/bin/sh

INDEX_FILE="index"
SAVE_DIR="save"
DATE=$(date +"%Y-%m-%d_%H:%M:%S  %z") 

rm -rf $SAVE_DIR
mkdir -p $SAVE_DIR

for dest in $(cat $INDEX_FILE); do
  if [ -f $dest ] || [ -d $dest ]; then
    mkdir -p "$(pwd)/$SAVE_DIR$(dirname $dest)"
    cp -r $dest "$(pwd)/$SAVE_DIR$dest"
  fi
done

find /path/to/search -type d -name ".git" -exec rm -rf {} +

git diff

read -p "do you want to save changes? [Y/N]: " answer
if [[ ! $answer = "Y" ]]; then
  exit 0
fi

git add .
git commit -m "Backup on $DATE"
git push origin main
