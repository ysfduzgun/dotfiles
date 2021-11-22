#!/bin/sh

## Load .Xresorces
xrdb -merge $HOME/.Xresources

## Wallpaper
feh --bg-scale $HOME/.bg.png

## Disable beep
xset b off
xset b 0 0 0

## Set dpi
if [ $HOSTNAME = "Lat" ]; then
  xrandr --dpi 128
fi

## Key repeat threshold and rate
xset r rate 300 58

## Enable auto lock
#xss-lock -- slock &

## Start WM
dunst &
$HOME/git/ssdwm/ssdwm 2>&1 >/dev/null &
exec $HOME/git/dwm/dwm
