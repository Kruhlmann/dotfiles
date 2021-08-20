#!/bin/sh

pre_install

needs_install() {
    command -v /usr/bin/polybar >/dev/null || return 1
}

setup() {
    depends_on polybar xorg
}

postinstall() {
    ( "$HOME/.scripts/launch_polybar" >/dev/null &2>/dev/null & )
}
