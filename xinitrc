#!/bin/sh

# Key repeat threshold and rate
xset r rate 300 58

# Keyboard
setxkbmap -layout tr 

# Fix cursor
xsetroot -cursor_name left_ptr

# Replace esc and capslock
setxkbmap -option caps:escape

# Wallpaper
hsetroot -cover .wallp/wallp.webp

# Compositor
picom --config $HOME/git/dotfiles/picom.conf &

# Dunst
dunst -config $HOME/git/dotfiles/dunstrc &

# DwmStatusBar
exec $HOME/git/dotfiles/scripts/dwmbar.sh &

# Start VM
exec $HOME/git/dotfiles/dwm/dwm
