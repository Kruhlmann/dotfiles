#!/usr/bin/env sh

pre_install aur

needs_install() {
  command -v /usr/bin/python >/dev/null || return 0
  command -v /usr/bin/pip >/dev/null || return 0
  pip list | grep virtualenv >/dev/null 2>/dev/null || return 0
  return 1
}

setup() {
  depends_on python python-pip
}

postinstall() {
  /usr/bin/python -m pip install --upgrade pip
}
