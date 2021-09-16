#!/usr/bin/env sh

pre_install gpg

needs_install() {
    command -v /usr/bin/neomutt >/dev/null || return 0
    command -v /usr/bin/pass >/dev/null || return 0
    command -v /usr/bin/isync >/dev/null || return 0
    command -v /usr/bin/protonmail-bridge >/dev/null || return 0
    command -v /usr/bin/msmtp >/dev/null || return 0
    return 1
}

setup() {
    depends_on neomutt pass protonmail-bridge-nogui msmtp curl mpop abook cronie notmuch lynx urlview offlineimap 
    mkdir -p "$HOME/mail"
    pass init andreas@kruhlmann.dev
    [ -f "$HOME/.msmtp-andreas_at_kruhlmann_dev" ] || echo 'echo -e "password\n" | gpg --encrypt -o ~/.msmtp-andreas_at_kruhlmann_dev.gpg -r andreas@kruhlmann.dev'
}

postinstall() {
    return
}
