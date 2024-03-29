#!/usr/bin/env sh

pre_install aur devel

needs_install() {
  command -v /usr/bin/polybar >/dev/null || return 0
  return 1
}

setup() {
  depends_on polybar xorg jq calcurse curl alacritty
}

postinstall() {
  alacritty -e "$HOME/.scripts/launch_polybar"
}
