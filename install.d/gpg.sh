#!/usr/bin/env sh

needs_install() {
  gpg -K --with-keygrip | grep andreas@kruhlmann.dev && return 0
  return 1
}

setup_pam() {
  echo "auth     optional  pam_gnupg.so store-only" | sudo tee -a /etc/pam.d/login >/dev/null
  echo "session  optional  pam_gnupg.so" | sudo tee -a /etc/pam.d/login >/dev/null
}

setup_gpg_allow_preset_passphrase() {
  touch "$HOME/.gnupg/gpg-agent.conf"
  echo "allow-preset-passphrase" >>"$HOME/.gnupg/gpg-agent.conf"
}

setup_gpg_allow_ssh() {
  touch "$HOME/.gnupg/gpg-agent.conf"
  echo "enable-ssh-support" >>"$HOME/.gnupg/gpg-agent.conf"
}

generate_gpg_key() {
  printf 'New GPG Password: '
  read -r PASSWORD
  cat >/tmp/gpg-temp-batch <<EOF
    Key-Type: default
    Subkey-Type: default
    Name-Real: Andreas Kruhlmann
    Name-Comment: gpg
    Name-Email: andreas@kruhlmann.dev
    Expire-Date: 0
    Passphrase: $PASSWORD
    %commit
EOF
  gpg --batch --gen-key /tmp/gpg-temp-batch
}

setup() {
  depends_on gnupg pam-gnupg libgcrypt openssh openssl
  mkdir -p "$HOME/.gnupg/"
  gpg -K --with-keygrip | grep andreas@kruhlmann.dev || generate_gpg_key
  grep pam_gnupg.so /etc/pam.d/login || setup_pam
  grep allow-preset-passphrase "$HOME/.gnupg/gpg-agent" || setup_gpg_allow_preset_passphrase
  grep enable-ssh-supper "$HOME/.gnupg/gpg-agent" || setup_gpg_allow_ssh
  [ -f "$HOME/.pam-gnupg" ] || gpg -K --with-keygrip | grep andreas@kruhlmann.dev -A 2 | grep Keygrip | awk '{ print $3 }' >"$HOME/.pam-gnupg"
}

postinstall() {
  return
}
