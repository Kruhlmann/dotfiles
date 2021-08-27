#!/usr/bin/env sh

pre_install aur python node

needs_install() {
    command -v /usr/bin/nvim >/dev/null || return 0
}

setup() {
    depends_on neovim-nightly-bin base-devel python node universal-ctags ruby git pyright typescript typescript-language-server bash-language-server tmux lua-format misspell shellharden prettier_d_slim eslint_d prettier eslint luacheck asmfmt write-good uncrustify
    pip install neovim >/dev/null
    yarn global add neovim >/dev/null
    gem install neovim >/dev/null
    cd /tmp/
    curl -L https://git.io/misspell | sh
    sudo mv ./bin/misspell /usr/bin/misspell
    cd -
}

postinstall() {
    /usr/bin/nvim --headless +PackerInstall +qall
    /usr/bin/nvim --headless +PackerSync +qall
}
