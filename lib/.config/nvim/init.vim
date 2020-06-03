call plug#begin()
    " Functionality
	Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'ryanoasis/vim-devicons'
    Plug 'airblade/vim-gitgutter'
    Plug 'scrooloose/nerdcommenter'
    Plug 'prettier/vim-prettier', { 'do': 'npm install' }
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'haorenW1025/completion-nvim'
    Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
    Plug 'voldikss/vim-floaterm'
    Plug 'ap/vim-buftabline'
    Plug 'heavenshell/vim-jsdoc', { 'do': 'make install' }

    " LSP
    "Plug 'neovim/nvim-lsp'
    "Plug 'haorenW1025/completion-nvim'
    "Plug 'haorenW1025/diagnostic-nvim'
    "Plug 'wbthomason/lsp-status.nvim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Language syntax
    Plug 'cakebaker/scss-syntax.vim'
    Plug 'glench/vim-jinja2-syntax'
    Plug 'leafoftree/vim-svelte-plugin'
    Plug 'mboughaba/i3config.vim'
    Plug 'HerringtonDarkholme/yats.vim'
    Plug 'mattn/emmet-vim'
    Plug 'pangloss/vim-javascript'
    Plug 'dart-lang/dart-vim-plugin'
    Plug 'thosakwe/vim-flutter'
    Plug 'digitaltoad/vim-pug'
    Plug 'OmniSharp/omnisharp-vim'

    " Appearance
    Plug 'junegunn/goyo.vim'
    Plug 'kien/rainbow_parentheses.vim'
    Plug 'gko/vim-coloresque'
    Plug 'itchyny/lightline.vim'

    " Themes
    Plug 'gruvbox-community/gruvbox'
    Plug 'agude/vim-eldar'
    Plug 'leafOfTree/vim-svelte-theme'
call plug#end()

"luafile ~/.config/nvim/init.lua
so ~/.config/nvim/includes/basic.vim
so ~/.config/nvim/includes/wildmenu.vim
so ~/.config/nvim/includes/backup.vim
so ~/.config/nvim/includes/plugins.vim
so ~/.config/nvim/includes/map.vim
so ~/.config/nvim/includes/filetypes.vim
so ~/.config/nvim/includes/events.vim
so ~/.config/nvim/includes/userfunc.vim
so ~/.config/nvim/includes/templates.vim

so ~/.config/nvim/includes/syntax/pgn.vim
