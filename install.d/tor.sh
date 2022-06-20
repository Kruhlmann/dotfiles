#!/usr/bin/env sh

pre_install aur

needs_install() {
  command -v /usr/bin/tor >/dev/null || return 0
  return 1
}

setup() {
  depends_on tor
}

postinstall() {
  sudo systemctl enable --now bluetoothd >/dev/null
  printf "User tor\nLog notice syslog\nDataDirectory /var/lib/tor\n" | sudo tee /etc/tor/torrc
}
