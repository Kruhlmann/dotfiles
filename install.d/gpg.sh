#!/usr/bin/env sh

pre_install aur

needs_install() {
  gpg -K --with-keygrip | grep andreas@kruhlmann.dev && return 0
  return 1
}

setup_pam() {
  echo "auth       optional     pam_gnupg.so store-only" | sudo tee -a /etc/pam.d/login
  echo "session    optional     pam_gnupg.so" | sudo tee -a /etc/pam.d/login
}

setup_gpg_allow_preset_passphrase() {
  touch "$HOME/.gnupg/gpg-agent.conf"
  echo "allow-preset-passphrase" >>"$HOME/.gnupg/gpg-agent.conf"
}

setup_gpg_allow_ssh() {
  touch "$HOME/.gnupg/gpg-agent.conf"
  echo "enable-ssh-support" >>"$HOME/.gnupg/gpg-agent.conf"
}

generate_gpg_batch_job() {
  cat <<EOF
    Key-Type: default
    Subkey-Type: default
    Name-Real: Andreas Kruhlmann
    Name-Comment: gpg
    Name-Email: andreas@kruhlmann.dev
    Expire-Date: 0
    Passphrase: $GPG_PASSWORD
    %commit
EOF
}

setup() {
  depends_on gnupg pam-gnupg libgcrypt openssh openssl
  mkdir -p "$HOME/.gnupg/"
  gpg -K --with-keygrip | grep andreas@kruhlmann.dev ||
    generate_gpg_batch_job | gpg --batch --gen-key
  grep pam_gnupg.so /etc/pam.d/login || setup_pam
  grep allow-preset-passphrase "$HOME/.gnupg/gpg-agent" ||
    setup_gpg_allow_preset_passphrase
  grep enable-ssh-supper "$HOME/.gnupg/gpg-agent" ||
    setup_gpg_allow_ssh
  test -f "$HOME/.pam-gnupg" ||
    gpg -K --with-keygrip | grep andreas@kruhlmann.dev -A 2 | grep Keygrip | awk '{ print $3 }' >"$HOME/.pam-gnupg"
}

postinstall() {
  return
}
