#!/usr/bin/env sh

pre_install bitwarden

needs_install() {
    [ -f "$HOME/.ssh/work"] || return 0
    [ -f "$HOME/.ssh/work.pub"] || return 0
    [ -f "$HOME/.ssh/personal"] || return 0
    [ -f "$HOME/.ssh/personal.pub"] || return 0
}

setup() {
    depends_on openssh
    bw get item "$(bw list items --search "SSH:work" | jq '.[0].id' --raw-output)" | jq '.notes' --raw-output > "$HOME/.ssh/work"
    bw get item "$(bw list items --search "SSH:work" | jq '.[0].id' --raw-output)" | jq '.fields[0].value' --raw-output > "$HOME/.ssh/work.pub"
    bw get item "$(bw list items --search "SSH:personal" | jq '.[0].id' --raw-output)" | jq '.notes' --raw-output > "$HOME/.ssh/personal"
    bw get item "$(bw list items --search "SSH:personal" | jq '.[0].id' --raw-output)" | jq '.fields[0].value' --raw-output > "$HOME/.ssh/personal.pub"
    chmod 0700 "$HOME/.ssh/work"
    chmod 0700 "$HOME/.ssh/personal"
}

postinstall() {
    return
}