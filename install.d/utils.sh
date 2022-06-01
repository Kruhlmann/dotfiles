#!/usr/bin/env sh

pre_install aur bitwarden

uid="$(whoami)"
sudo_file="/etc/sudoers.d/99-$uid-nopasswd"

needs_install() {
  return 0
}

setup() {
  depends_on curl jq sudo
  mkdir -p "$HOME/.cache/gain" "$HOME/.cache/bw"

  bw get item "$(bw list items --search "lichess:apitoken" | jq '.[0].id' --raw-output)" | jq '.login.password' --raw-output >"$HOME/.cache/lichess_oauth"
  bw get item "$(bw list items --search gain | jq '.[0].id' --raw-output)" | jq '.login.username' --raw-output >"$HOME/.cache/gain/user"
  bw get item "$(bw list items --search gain | jq '.[0].id' --raw-output)" | jq '.login.password' --raw-output >"$HOME/.cache/gain/password"
  bw get item "$(bw list items --search software.siemens.dk | jq '.[0].id' --raw-output)" | jq '.fields[] | select(.name=="full-access-token") | .value' --raw-output >"$HOME/.cache/gitlab-access-token"
  echo "$uid ALL=(ALL) NOPASSWD: ALL" | sudo tee "$sudo_file"
  echo "$BW_USERNAME" >"$HOME/.cache/bw/user"
  echo "$BW_PASSWD" >"$HOME/.cache/bw/pass"
  echo "$BW_CLIENTSECRET" >"$HOME/.cache/bw/secret"
}

postinstall() {
  return
}
