#!/bin/sh

usage="Usage: $0 <cmd> <*args>"
[ "$1" == "" ] && echo $usage && exit 1

cpu="cores=2,threads=4"
mem="4G"

run() {
  usage="Usage: $0 run <disk>"
  [ "$1" == "" ] && 
  [ ! -f $1 ] &&
    echo $usage && exit 1

  qemu-system-x86_64 -enable-kvm \
    -boot c \
    -drive file=$1 \
    -cpu host -smp $cpu \
    -m $mem \
    -rtc base=localtime \
    -vga virtio -display sdl,gl=on
}

install() {
  usage="Usage: $0 install <iso> <disk>"
  [ "$1" == "" ] && 
  [ "$2" == "" ] &&
  [ ! -f $1 ] &&
  [ ! -f $2 ] &&
    echo $usage && exit 1

  qemu-system-x86_64 -enable-kvm \
    -cdrom $1 \
    -boot d \
    -drive file=$2 \
    -cpu host -smp $cpu \
    -m $mem \
    -rtc base=localtime \
    -vga virtio -display sdl,gl=on
}

# this is wack, but whatever
case $1 in
  "run") run $2 &;;
  "install") install $2 $3 &;;
  *) echo $usage && exit 1;;
esac
