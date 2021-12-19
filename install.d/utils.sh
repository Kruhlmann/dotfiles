#!/usr/bin/env sh

pre_install bitwarden

uid=$(whoami)
sudo_file="/etc/sudoers.d/99-$id-nopasswd"
needs_install() {
    return 0
}

setup() {
    depends_on curl jq sudo
    bw get item "$(bw list items --search "lichess:apitoken" | jq '.[0].id' --raw-output)" | jq '.login.password' --raw-output > "$HOME/.config/lichess_oauth"
    echo "$uid ALL=(ALL) NOPASSWD: ALL" | sudo tee "$sudo_file"
}

postinstall() {
    return
}
