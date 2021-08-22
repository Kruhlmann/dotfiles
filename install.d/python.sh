#!/usr/bin/env sh

pre_install

needs_install() {
    command -v /usr/bin/python >/dev/null || return 1
    command -v /usr/bin/pip >/dev/null || return 1
}

setup() {
    depends_on python python-pip
}

postinstall() {
    return
}
