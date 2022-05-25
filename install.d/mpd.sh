#!/usr/bin/env sh

pre_install audio

needs_install() {
  command -v /usr/bin/mpd >/dev/null || return 0
  command -v /usr/bin/ncmpcpp >/dev/null || return 0
  command -v /usr/bin/mpc >/dev/null || return 0
}

setup() {
  depends_on ncmpcpp mpd mpc
  touch "$HOME/.config/mpd/log"
}

postinstall() {
  return
}
