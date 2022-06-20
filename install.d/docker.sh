#!/usr/bin/env sh

pre_install aur

needs_install() {
  command -v /usr/bin/docker >/dev/null || return 0
  command -v /usr/bin/docker-compose >/dev/null || return 0
  return 1
}

setup() {
  depends_on docker docker-compose
}

postinstall() {
  docker_user=$(bw_item "registry.nymann.dev" | jq '.login.username' --raw-output)
  docker_pass=$(bw_item "registry.nymann.dev" | jq '.login.password' --raw-output)
  mkdir -p "$HOME/.docker"
  sudo mkdir -p /root/.docker
  sudo usermod -aG docker "$(whoami)"
  sudo systemctl enable --now docker
  sudo -E docker login registry.nymann.dev -u "$docker_user" -p "$docker_pass"
  sudo mv /root/.docker/config.json "$HOME/.docker/config.json"
}
