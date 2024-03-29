#!/usr/bin/env sh

pre_install aur

needs_install() {
  command -v /usr/bin/ckb-next >/dev/null || return 0
  return 1
}

setup() {
  depends_on ckb-next
}

postinstall() {
  sudo systemctl enable --now ckb-next-daemon
}
