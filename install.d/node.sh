#!/usr/bin/env sh

pre_install aur

needs_install() {
  command -v node >/dev/null || return 0
  command -v /usr/bin/npm >/dev/null || return 0
  command -v /usr/bin/yarn >/dev/null || return 0
  command -v nvm >/dev/null || return 0
  command -v pnpm >/dev/null || return 0
  return 1
}

setup() {
  depends_on nodejs-lts-erbium npm yarn nvm pnpm
}

postinstall() {
  return
}
