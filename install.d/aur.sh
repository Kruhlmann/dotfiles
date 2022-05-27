#!/usr/bin/env sh

pre_install

needs_install() {
  command -v /usr/bin/yay >/dev/null || return 0
}

setup() {
  depends_on git base-devel
  rm -rf /tmp/yay
  git clone https://aur.archlinux.org/yay.git /tmp/yay
  cd /tmp/yay || return 1
  makepkg -si --noconfirm
  cd - || return 1
}

postinstall() {
  return
}
