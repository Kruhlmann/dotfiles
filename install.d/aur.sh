#!/usr/bin/env sh

pre_install

needs_install() {
  return 1
  command -v /usr/bin/yay >/dev/null || return 0
}

setup() {
  depends_on git base-devel
  rm -rf /tmp/yay
  git clone https://aur.archlinux.org/yay.git /tmp/yay
  cd /tmp/yay
  makepkg -si --noconfirm
  cd -
}

postinstall() {
  return
}
