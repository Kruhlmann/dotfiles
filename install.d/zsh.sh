#!/usr/bin/env sh

zsh_install_dir="$HOME/.config/.oh-my-zsh"
powerlevel10k_install_dir=""
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

pre_install aur

install_zsh_plugin() {
    for $plugin_name in $@; do
        [ -d "$zsh_install_dir/custom/plugins/$plugin_name" ] || git clone https://github.com/zsh-users/$plugin_name.git "$zsh_install_dir/custom/plugins/$plugin_name"

}

needs_install() {
    command -v zsh >/dev/null || return 0
}

setup () {
    depends_on git zsh curl fzf
}

postinstall() {
    sudo usermod -s /bin/zsh "$USER" >/dev/null 2>/dev/null
    [ -f "$HOME/.config/.oh-my-zsh/oh-my-zsh.sh" ] || git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.config/.oh-my-zsh
    [ -d "$zsh_install_dir/custom/themes/powerlevel10k" ] || git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$zsh_install_dir/custom/themes/powerlevel10k"
    install_zsh_plugin zshauto-suggestions zsh-completions zsh-syntax-highlighting
}
