#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xset +fp /usr/share/fonts/misc
xset fp rehash

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

numlockx &

# exec gnome-session
#exec startxfce4
# ...or the Window Manager of your choice
exec i3
