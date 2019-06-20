#!/bin/sh

## Load .Xdefaults
xrdb -merge $HOME/.Xdefaults

## Start WM
exec $HOME/.dwmstart
