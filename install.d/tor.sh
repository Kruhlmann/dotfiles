#!/usr/bin/env sh

pre_install aur

needs_install() {
    command -v /usr/bin/tor >/dev/null || return 0
}

setup() {
    depends_on tor
}

postinstall() {
    sudo systemctl enable --now bluetoothd >/dev/null
    echo "User tor\nLog notice syslog\nDataDirectory /var/lib/tor" | sudo tee /etc/tor/torrc
}
