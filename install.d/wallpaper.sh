#!/bin/sh

pre_install

needs_install() {
    command -v /usr/bin/feh >/dev/null || return 1
}

setup() {
    depends_on feh xorg
}

postinstall() {
    if xset q &>/dev/null; then
        [ -f "$HOME/img/wallpaper" ] && feh --bg-scale "$HOME/img/wallpaper"
    fi
}
