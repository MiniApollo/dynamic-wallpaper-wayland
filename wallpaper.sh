#!/bin/sh 

## Author  : SMark5
#Inspired by adi1090x/dynamic-wallpaper 

## Dynamic Wallpaper : Set wallpapers according to current time.
## Created to work better with job schedulers (cron)

#change the DIR variable accordingly where you want to place it
DIR="$HOME/SystemFiles/dynamic-wallpaper-wayland/images/firewatch/"
HOUR=`date +%k`
FORMAT=".png"

#wayland
#set background
swaybg -o \* -i $DIR$HOUR.png -m fill
sleep 1
# kill all older processes of swaybg
kill $(ps -eo pid,etime,comm | grep 'swaybg' | awk '{ print $1 }' | head -n -1)

#xorg
#if you want to use xorg just uncomment the line bellow
#and comment the wayland lines above
#feh --bg-fill $DIR$HOUR.png
