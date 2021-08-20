#!/bin/sh

pre_install aur

needs_install() {
    command -v /usr/bin/xmonad >/dev/null || return 1
}

setup() {
    depends_on xmonad xmonad-contrib xorg
}

postinstall() {
    xmonad --recompile >/dev/null
    if xset q &>/dev/null; then
        xmonad --restart
    fi
}
