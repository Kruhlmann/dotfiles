#!/usr/bin/env sh

pre_install aur python node

needs_install() {
  command -v /usr/bin/lutris >/dev/null || return 0
}

setup() {
  depends_on nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader lutris wine
  mkdir -p "$HOME/gam/"
  mkdir -p "$HOME/.config/lutris"
  tee "$HOME/.config/lutris/battle_net.yml" <<END
game:
  arch: win64
  exe: drive_c/Program Files (x86)/Battle.net/Battle.net.exe
  prefix: /home/$(whoami)/gam/battlenet
system:
  env:
    DXVK_CONFIG_FILE: /home/$(whoami)/gam/battlenet/dxvk.conf
    DXVK_STATE_CACHE_PATH: /home/$(whoami)/gam/battlenet
    STAGING_SHARED_MEMORY: '1'
    __GL_DXVK_OPTIMIZATIONS: '1'
    __GL_SHADER_DISK_CACHE: '1'
    __GL_SHADER_DISK_CACHE_PATH: /home/$(whoami)/gam/battlenet
  exclude_processes: Agent.exe "Battle.net Helper.exe"
  manual_command: /home/$(whoami)/gam/battlenet/state-cache-merge/state-cache-update.sh
wine:
  dxvk: true
  esync: true
  version: lutris-fshack-6.21-6-x86_6
END
}

postinstall() {
  return
}
