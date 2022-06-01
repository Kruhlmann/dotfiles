#!/usr/bin/env sh

pre_install aur

needs_install() {
  command -v /usr/bin/python >/dev/null || return 0
  command -v /usr/bin/pip >/dev/null || return 0
}

setup() {
  depends_on python python-pip
}

postinstall() {
  return
}
