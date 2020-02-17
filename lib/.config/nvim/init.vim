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
    Plug 'scrooloose/syntastic'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'majutsushi/tagbar'
    Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

    " Language syntax
    Plug 'cakebaker/scss-syntax.vim'
    Plug 'glench/vim-jinja2-syntax'
    Plug 'evanleck/vim-svelte'
    Plug 'mboughaba/i3config.vim'
    Plug 'HerringtonDarkholme/yats.vim'
    Plug 'mattn/emmet-vim'
    Plug 'pangloss/vim-javascript'
    Plug 'dart-lang/dart-vim-plugin'
    Plug 'thosakwe/vim-flutter'
    Plug 'digitaltoad/vim-pug'

    " Appearance
    Plug 'junegunn/goyo.vim'
    Plug 'morhetz/gruvbox'
    Plug 'bling/vim-airline'
    Plug 'kien/rainbow_parentheses.vim'
    Plug 'gko/vim-coloresque'
call plug#end()

so ~/.config/nvim/includes/basic.vim
so ~/.config/nvim/includes/wildmenu.vim
so ~/.config/nvim/includes/backup.vim
so ~/.config/nvim/includes/plugins.vim
so ~/.config/nvim/includes/map.vim
so ~/.config/nvim/includes/filetypes.vim
so ~/.config/nvim/includes/events.vim
so ~/.config/nvim/includes/syntax/pgn.vim
