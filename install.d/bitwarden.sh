#!/usr/bin/env sh

pre_install

needs_install() {
  command -v /usr/bin/bw >/dev/null || return 0
}

setup() {
  depends_on bitwarden-cli jq
}

bw_password() {
  printf '%s\n' "$BW_PASSWD"
}

postinstall() {
  bw login "$BW_USERNAME" "$BW_PASSWD" || /bin/true
  bw_session_cmd="$(bw_password | bw unlock | grep export)"
  eval "${bw_session_cmd#??}"
  export BW_SESSION
}
