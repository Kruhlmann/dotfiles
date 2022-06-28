#!/usr/bin/env sh

pre_install aur

needs_install() {
  command -v /usr/bin/xmonad >/dev/null || return 0
  command -v /usr/bin/xorg >/dev/null || return 0
  command -v /usr/bin/picom >/dev/null || return 0
  return 1
}

setup() {
  depends_on xmonad xmonad-contrib xorg xclip rofi libnotify picom-jonaburg-fix
}

postinstall() {
  yay -Qq | grep haskell >/tmp/haskell_deps
  yay -Sy --noconfirm - </tmp/haskell_deps
  rm /tmp/haskell_deps
  xmonad --recompile >/dev/null
  if xset q >/dev/null; then
    xmonad --restart
  fi
}
