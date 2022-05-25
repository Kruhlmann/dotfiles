#!/usr/bin/env sh

pre_install

needs_install() {
  command -v /usr/bin/neomutt >/dev/null || return 0
  command -v /usr/bin/pass >/dev/null || return 0
  command -v /usr/bin/isync >/dev/null || return 0
  command -v /usr/bin/protonmail-bridge >/dev/null || return 0
  command -v /usr/bin/msmtp >/dev/null || return 0
  return 1
}

setup() {
  test -f /etc/default/grub || return
  depends_on grub
  sudo sed -i \
    -e 's/^GRUB_TIMEOUT_STYLE=.*$/GRUB_TIMEOUT_STYLE=hidden/' \
    -e 's/^GRUB_TIMEOUT=.*$/GRUB_TIMEOUT=0/' \
    /etc/default/grub
  sudo grub-mkconfig -o /boot/grub/grub.cfg
}

postinstall() {
  return
}
