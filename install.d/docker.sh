#!/usr/bin/env sh

pre_install aur bitwarden

needs_install() {
  command -v /usr/bin/docker >/dev/null || return 0
  command -v /usr/bin/docker-compose >/dev/null || return 0
}

setup() {
  depends_on docker docker-compose
}

postinstall() {
  docker_user=$(bw get item "$(bw list items --search "registry.nymann.dev" | jq '.[0].id' --raw-output)" | jq '.login.username' --raw-output)
  docker_pass=$(bw get item "$(bw list items --search "registry.nymann.dev" | jq '.[0].id' --raw-output)" | jq '.login.password' --raw-output)
  sudo usermod -aG docker "$(whoami)"
  sudo systemctl enable --now docker
  sudo docker login registry.nymann.dev -u "$docker_user" "$docker_pass"
  mkdir -p "$HOME/.docker"
  sudo mv /root/.docker/config.json "$HOME/.docker/config.json"
}
