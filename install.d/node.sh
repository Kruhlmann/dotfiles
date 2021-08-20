#!/bin/sh

pre_install

needs_install() {
    command -v node >/dev/null || return 0
    command -v /usr/bin/npm >/dev/null || return 0
    command -v /usr/bin/yarn >/dev/null || return 0
    command -v nvm >/dev/null || return 0
}

setup() {
    depends_on nodejs npm yarn nvm
}

postinstall() {
    return
}
