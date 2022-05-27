#!/usr/bin/env sh

pre_install aur python node

needs_install() {
  command -v /usr/bin/nvim >/dev/null || return 0
  command -v /usr/bin/misspell >/dev/null || return 0
}

setup() {
  depends_on neovim-nightly-bin base-devel python node universal-ctags ruby git pyright typescript typescript-language-server bash-language-server tmux lua-format misspell shellharden prettier_d_slim eslint_d prettier eslint luacheck asmfmt write-good uncrustify noto-fonts-emoji gopls lua shellcheck luacheck rubocop
  pip install neovim >/dev/null
  yarn global add neovim >/dev/null
  gem install neovim >/dev/null
  cd /tmp/ || return 1
  curl -L https://git.io/misspell | sh
  sudo mv ./bin/misspell /usr/bin/misspell
  cd - || return 1
}

postinstall() {
  test -d "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim
" || git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
  /usr/bin/nvim --headless +PackerInstall +qall
  /usr/bin/nvim --headless +PackerSync +qall
  mkdir -p "$HOME/.cache/nvim/undo" "$HOME/.cache/nvim/backup" "$HOME/.cache/nvim/swap"
}
