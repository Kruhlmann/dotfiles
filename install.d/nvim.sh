#!/bin/sh

nvim_plug_file="${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim"

pre_install aur python node

needs_install() {
    command -v /usr/bin/nvim >/dev/null || return 0
}

setup() {
    depends_on neovim-nightly-bin base-devel python node universal-ctags ruby git pyright typescript typescript-language-server bash-language-server
    pip install neovim >/dev/null
    yarn global add neovim >/dev/null
    gem install neovim >/dev/null
}

postinstall() {
    /usr/bin/nvim --headless +PackerInstall +qall
    /usr/bin/nvim --headless +PackerSync +qall
}
