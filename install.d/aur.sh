#!/usr/bin/env sh

pre_install

needs_install() {
  command -v /usr/bin/yay >/dev/null || return 0
  return 1
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
  depends_on check-broken-packages-pacman-hook-git pacdiff-pacman-hook-git sync-pacman-hook-git xmonad-recompile-pacman-hook-git
}
