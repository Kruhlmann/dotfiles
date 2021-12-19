#!/usr/bin/env sh

pre_install

needs_install() {
    command -v /usr/bin/bw >/dev/null || return 0
}

setup() {
    depends_on bitwarden-cli
}

postinstall() {
    bw login
    bw_session_cmd="$(bw unlock | grep export)"
    eval ${bw_session_cmd#??}
}
