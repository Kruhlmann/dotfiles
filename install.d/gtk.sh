#!/usr/bin/env sh

pre_install devel aur

needs_install() {
  test -d /usr/share/themes/Everblush-gtk/ || return 0
  command -v /usr/bin/papirus-folders >/dev/null || return 0
}

install_everblush() {
  target=$(mktemp -d)
  git clone https://github.com/mangeshrex/Everblush-gtk "$target"
  cd "$target" || return 1
  sudo make install
  cd - || return 1
}

install_quintom() {
  target=$(mktemp -d)
  git clone https://gitlab.com/Burning_Cube/quintom-cursor-theme "$target"
  cd "$target" || return 1
  sudo cp -r 'Quintom_Ink Cursors/Quintom_Ink' /usr/share/icons
  cd - || return 1
}

setup() {
  depends_on papirus-folders-git papirus-icon-theme-git
  install_everblush
  install_quintom
}

postinstall() {
  papirus-folders -C red --theme Papirus-Dark
}
