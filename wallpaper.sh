#!/usr/bin/env bash

## Author: MiniApollo
## Inspired by adi1090x/dynamic-wallpaper

## Dynamic Wallpaper : Set wallpapers according to current time.
## Created to work better with job schedulers (cron)

## Change the DIR variable accordingly where you want to place it
DIR="$HOME/SystemFiles/dynamic-wallpaper-wayland/images/firewatch/"
HOUR=$(($(date +%k)/1))

### Set background
## Wayland
swaybg -o \* -i $DIR$HOUR.png -m fill &
sleep 1
## Kill all older processes of swaybg
## List all processes in descending chronological order, Find all swaybg, Get first row (pid), Get first line, Send sigterm signal
## Need --sort, because the default sorting order is by pid and over time, it starts all over again from 0, breaking the script
kill $(ps -eo pid,etime,comm --sort=-etime | grep 'swaybg' | awk '{ print $1 }' | head -n -1)

## Xorg
## If you want to use xorg just uncomment the line bellow and comment the wayland lines above
#feh --bg-fill $DIR$HOUR.png
