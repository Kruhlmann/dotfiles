#!/usr/bin/env sh

pre_install audio aur

needs_install() {
  command -v /usr/bin/mpd >/dev/null || return 0
  command -v /usr/bin/ncmpcpp >/dev/null || return 0
  command -v /usr/bin/mpc >/dev/null || return 0
  test -f "$HOME/.config/mpd/log" || return 0
  return 1
}

setup() {
  depends_on ncmpcpp mpd mpc
  touch "$HOME/.config/mpd/log"
}

postinstall() {
  return
}
