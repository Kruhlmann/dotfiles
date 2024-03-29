#!/usr/bin/env sh

pre_install aur python node nvim

needs_install() {
  command -v /usr/bin/lazygit >/dev/null || return 0
  command -v /usr/bin/make >/dev/null || return 0
  command -v /usr/bin/cmake >/dev/null || return 0
  command -v /usr/bin/ninja >/dev/null || return 0
  command -v /usr/bin/alacritty >/dev/null || return 0
  command -v /usr/bin/gcc >/dev/null || return 0
  return 1
}

setup() {
  depends_on lazygit base-devel make cmake ninja alacritty git-lfs
}

postinstall() {
  return
}
