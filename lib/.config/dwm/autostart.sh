#!/usr/bin/env sh

# DWM autostart applications
ckb-next
compton -f
feh --bg-fill ~/.config/wallpaper
discord
mpd
protonmail-bridge
redshift
nm-applet
find ~/.ssh/ -type f -exec grep -l "PRIVATE" {} \; | xargs ssh-add &> /dev/null
