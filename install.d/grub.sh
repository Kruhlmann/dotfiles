#!/usr/bin/env sh

pre_install aur

needs_install() {
  grep GRUB_TIMEOUT_STYLE=hidden /etc/default/grub >/dev/null || return 0
  grep GRUB_TIMEOUT=0 /etc/default/grub >/dev/null || return 0
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
