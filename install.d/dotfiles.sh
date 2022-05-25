#!/usr/bin/env sh

install_d_dir="$(dirname "$0")"

pre_install

needs_install() {
  return
}

setup() {
  depends_on git
  cd "$install_d_dir/.." || exit 1
  git remote set-url origin git@github.com:Kruhlmann/dotfiles
  cd - || exit 1
}

postinstall() {
  return
}
