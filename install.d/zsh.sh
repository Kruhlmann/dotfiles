#!/usr/bin/env sh

pre_install aur ssh

zsh_install_dir="$HOME/.config/.oh-my-zsh"

install_zsh_plugin() {
  # shellcheck disable=SC2068
  for plugin_name in $@; do
    [ -d "$zsh_install_dir/custom/plugins/$plugin_name" ] || git clone "git@github.com:zsh-users/$plugin_name.git" "$zsh_install_dir/custom/plugins/$plugin_name"
  done
}

needs_install() {
  command -v zsh >/dev/null || return 0
  return 1
}

setup() {
  depends_on git zsh curl fzf
}

postinstall() {
  sudo usermod -s /bin/zsh "$USER" >/dev/null 2>/dev/null
  [ -f "$HOME/.config/.oh-my-zsh/oh-my-zsh.sh" ] || git clone git@github.com:ohmyzsh/ohmyzsh.git ~/.config/.oh-my-zsh
  [ -d "$zsh_install_dir/custom/themes/powerlevel10k" ] || git clone --depth=1 git@github.com:romkatv/powerlevel10k.git "$zsh_install_dir/custom/themes/powerlevel10k"
  install_zsh_plugin zsh-autosuggestions zsh-completions zsh-syntax-highlighting
  ln -sf "$HOME/.config/zsh/.zshrc" "$HOME/.zshrc"
}
