#!/bin/sh

## Load .Xresorces
xrdb -merge $HOME/.Xresources

## Disable beep
xset b off
xset b 0 0 0

## Set dpi
xrandr --dpi 128

## Key repeat threshold and rate
xset r rate 300 58

## Enable auto lock
xss-lock -- slock &

## Start WM
exec $HOME/.dwm/start
#exec dwm
