#!/usr/bin/env sh

pre_install aur

needs_install() {
  test -f "$HOME/.ssh/work" || return 0
  test -f "$HOME/.ssh/work.pub" || return 0
  test -f "$HOME/.ssh/personal" || return 0
  test -f "$HOME/.ssh/personal.pub" || return 0
  test -f /etc/ssh/sshrc || return 0
  return 1
}

setup() {
  depends_on openssh polkit-gnome
  for item in work personal; do
    bw_item "SSH:$item" | jq '.notes' --raw-output >"$HOME/.ssh/$item"
    bw_item "SSH:$item" | jq '.fields[0].value' --raw-output >"$HOME/.ssh/$item.pub"
    chmod 0700 "$HOME/.ssh/$item"
  done
  cat >/etc/ssh/sshrc <<EOF
#!/usr/bin/env sh

ip=\$(echo \$SSH_CONNECTION | cut -d " " -f 1)
notify-send -u CRITICAL "SSH connection from \${ip}" "User \$USER logged in from \$ip"
EOF
}

postinstall() {
  return
}
