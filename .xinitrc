#!/bin/sh
# ~/.xinitrc

urxvtd -q -o -f&

# source xinitc.d scripts
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
 
 done
 unset f
fi

# load .Xresources
[[ -f $HOME/.Xresources ]] && xrdb -merge $HOME/.Xresources


xset fp default
[[ -d /usr/share/fonts/local ]] && xset +fp /usr/share/fonts/local
[[ -d /usr/share/fonts/OTF ]] && xset +fp /usr/share/fonts/OTF
[[ -d $HOME/.fonts ]] && xset +fp $HOME/.fonts
xset fp rehash &
xset -dpms
xset s off




# set WM to a name with Java recognises
#wmname DwM

# start WM
exec $HOME/.dwmConfig/dwm-start
#exec dwm
