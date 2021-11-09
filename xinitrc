#!/bin/sh

## Keyboard Layout
setxkbmap tr

## Load .Xresorces
xrdb -merge $HOME/.Xresources

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
xss-lock -- slock &

## Start WM
exec $HOME/git/dwm/dwm
