#!/bin/sh

nvim_plug_file="${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim"

pre_install aur python node

needs_install() {
    command -v /usr/bin/nvim >/dev/null || return 0
}

setup() {
    depends_on neovim-nightly-bin base-devel python node ctags ruby
    pip install neovim >/dev/null
    yarn global add neovim >/dev/null
    gem install neovim >/dev/null
    [ -f  "$nvim_plug_file" ] || curl -fLo "$nvim_plug_file" --create-dirs "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
}

postinstall() {
    /usr/bin/nvim --headless +PlugInstall +qall
    /usr/bin/nvim --headless +PlugUpdate +qall
    /usr/bin/nvim --headless +TSInstall all +qall
}
