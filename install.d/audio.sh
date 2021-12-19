#!/usr/bin/env sh

pre_install

needs_install() {
    command -v /usr/bin/bluez >/dev/null || return 0
    command -v /usr/bin/bluetoothctl >/dev/null || return 0
    command -v /usr/bin/pavucontrol >/dev/null || return 0
    command -v /usr/bin/pulseaudio >/dev/null || return 0
    command -v /usr/bin/mpc >/dev/null || return 0
    command -v /usr/bin/mpd >/dev/null || return 0
    command -v /usr/bin/ncmpcpp >/dev/null || return 0
}

setup() {
    depends_on pavucontrol pulseaudio mpd ncmpcpp mpc
    sudo dmesg | grep -i blue && depends_on bluez bluez-utils pulseaudio-bluetooth
}

postinstall() {
    sudo dmesg | grep -i blue && sudo systemctl enable --now bluetoothd >/dev/null
}
