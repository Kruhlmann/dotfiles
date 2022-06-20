#!/usr/bin/env sh

install_d_dir="$(dirname "$0")"

pre_install aur

needs_install() {
  cd "$install_d_dir" || return 1
  git remote get-url origin | grep git@github.com:Kruhlmann/dotfiles >/dev/null || return 0
  cd - >/dev/null || return 1
}

setup() {
  depends_on git
  cd "$install_d_dir" || return 1
  git remote set-url origin git@github.com:Kruhlmann/dotfiles
  cd - >/dev/null || return 1
}

postinstall() {
  return 0
}
