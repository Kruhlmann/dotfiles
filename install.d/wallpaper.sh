#!/usr/bin/env sh

pre_install aur

needs_install() {
  command -v /usr/bin/feh >/dev/null || return 1
}

setup() {
  depends_on feh xorg
}

postinstall() {
  if xset q 1>/dev/null; then
    [ -f "$HOME/img/wallpaper" ] && feh --bg-scale "$HOME/img/wallpaper"
  fi
}
