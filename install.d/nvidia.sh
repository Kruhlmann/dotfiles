#!/usr/bin/env sh

HOOK=/etc/pacman.d/hooks/nvidia.hook

pre_install

needs_install() {
  test -f "$HOOK" || return 0
}

setup() {
  cat <<EONVIDIACONF | sudo tee "$HOOK"
[Trigger]
Operation=Install
Operation=Upgrade
Operation=Remove
Type=Package
Target=nvidia
Target=linux

[Action]
Description=Update Nvidia module in initcpio
Depends=mkinitcpio
When=PostTransaction
NeedsTargets
Exec=/bin/sh -c 'while read -r trg; do case \$trg in linux) exit 0; esac; done; /usr/bin/mkinitcpio -P'
EONVIDIACONF
  touch "$HOME/.config/mpd/log"
}

postinstall() {
  return
}
