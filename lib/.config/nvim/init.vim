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
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
    Plug 'voldikss/vim-floaterm'
    Plug 'ap/vim-buftabline'
    Plug 'heavenshell/vim-jsdoc', { 'do': 'make install' }

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
    Plug 'morhetz/gruvbox'
    Plug 'agude/vim-eldar'
    Plug 'leafOfTree/vim-svelte-theme'
call plug#end()

so ~/.config/nvim/includes/basic.vim
so ~/.config/nvim/includes/wildmenu.vim
so ~/.config/nvim/includes/backup.vim
so ~/.config/nvim/includes/plugins.vim
so ~/.config/nvim/includes/map.vim
so ~/.config/nvim/includes/filetypes.vim
so ~/.config/nvim/includes/events.vim
so ~/.config/nvim/includes/userfunc.vim

so ~/.config/nvim/includes/syntax/pgn.vim
