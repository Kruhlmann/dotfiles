#!/usr/bin/env sh

pre_install aur

uid="$(whoami)"
sudo_file="/etc/sudoers.d/99-$uid-nopasswd"

needs_install() {
  return
}

setup() {
  depends_on curl jq sudo
  mkdir -p "$HOME/.cache/gain"

  test -f "$HOME/.cache/lichess_oauth" || bw_item "lichess:apitoken" | jq '.login.password' --raw-output >"$HOME/.cache/lichess_oauth"
  test -f "$HOME/.cache/gain/user" || bw_item "gain" | jq '.login.username' --raw-output >"$HOME/.cache/gain/user"
  test -f "$HOME/.cache/gain/password" || bw_item "gain" | jq '.login.password' --raw-output >"$HOME/.cache/gain/password"
  test -f "$HOME/.cache/gitlab-access-token" || bw_item "software.siemens.dk" | jq '.fields[] | select(.name=="full-access-token") | .value' --raw-output >"$HOME/.cache/gitlab-access-token"
  bw_item "siemens-config" | jq '.notes' --raw-output >"$HOME/.cache/siemens-config.json"

  echo "$uid ALL=(ALL) NOPASSWD: ALL" | sudo tee "$sudo_file"
  echo "$BW_USERNAME" >"$HOME/.cache/bw/user"
  echo "$BW_PASSWD" >"$HOME/.cache/bw/pass"
  echo "$BW_CLIENTSECRET" >"$HOME/.cache/bw/secret"
}

postinstall() {
  return
}
