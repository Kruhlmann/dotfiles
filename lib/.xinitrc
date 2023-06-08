#!/usr/bin/env sh

userresources="$HOME/.Xresources"
usermodmap="$HOME/.xmodmap"
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

test -f "$sysresources" && xrdb -merge "$sysresources"
test -f "$userresources" && xrdb -merge "$userresources"
test -f "$sysmodmap" && xmodmap "$sysmodmap"
test -f "$usermodmap" && xmodmap "$usermodmap"

if [ -d /etc/X11/xinit/xinitrc.d ]; then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

exec xmonad
