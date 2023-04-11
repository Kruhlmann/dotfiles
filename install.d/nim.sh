#!/usr/bin/env sh

pre_install aur

needs_install() {
  command -v nim >/dev/null || return 0
  command -v nimble >/dev/null || return 0
  return 1
}

setup() {
  depends_on nim nimble
}

postinstall() {
  return
}
