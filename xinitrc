#!/bin/sh

## Load .Xdefaults
xrdb -merge $HOME/.Xdefaults
## Disable beep
xset b off
xset b 0 0 0

## Start WM
exec $HOME/.dwmstart
