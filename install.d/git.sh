#!/usr/bin/env sh

pre_install aur utils

needs_install() {
  test -f "$HOME/.config/git/siemens" || return 0
  test -f "$HOME/.config/git/siemens.includes" || return 0
  return 1
}

setup() {
  depends_on git
  gl_host="$(jq --raw-output '.gitlab_host' <"$HOME/.cache/siemens-config.json")"
  cat >"$HOME/.config/git/siemens" <<EOF
[user]
    email = $(cat ~/.cache/gain/user)
    signingKey = 92CC003DA102E4D9B2D5C18D0809F0A74657997E
[commit]
    gpgSign = true
EOF
  cat >"$HOME/.config/git/siemens.includes" <<EOF
[includeIf "gitdir:~/doc/src/$gl_host/"]
    path = ~/.config/git/siemens

[includeIf "gitdir:/mnt/hdd/home/doc/src/$gl_host/"]
    path = ~/.config/git/siemens

[includeIf "gitdir:~/doc/src/code.siemens.com/"]
    path = ~/.config/git/siemens
EOF
}

postinstall() {
  return
}
