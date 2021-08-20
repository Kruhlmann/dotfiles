#!/bin/sh

powerlevel10k_install_dir="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

pre_install aur

needs_install() {
    command -v zsh >/dev/null || return 0
}

setup () {
    depends_on git zsh curl fzf
}

postinstall() {
    sudo usermod -s /bin/zsh "$USER" >/dev/null 2>/dev/null
    [ -z "$ZSH" ] && curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh
    [ -d "$powerlevel10k_install_dir" ] || git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$powerlevel10k_install_dir"
}
