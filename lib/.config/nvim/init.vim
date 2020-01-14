call plug#begin()
    " Functionality
	Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'ryanoasis/vim-devicons'
    Plug 'airblade/vim-gitgutter'
    Plug 'scrooloose/nerdcommenter'
    Plug 'prettier/vim-prettier', { 'do': 'npm install' }
    Plug 'ap/vim-css-color'
    Plug 'scrooloose/syntastic'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Language syntax
    Plug 'cakebaker/scss-syntax.vim'
    Plug 'glench/vim-jinja2-syntax'
    Plug 'evanleck/vim-svelte'
    Plug 'mboughaba/i3config.vim'
    Plug 'HerringtonDarkholme/yats.vim'

    " Appearance
    Plug 'junegunn/goyo.vim'
    Plug 'morhetz/gruvbox'
call plug#end()

so ~/.config/nvim/includes/basic.vim
so ~/.config/nvim/includes/wildmenu.vim
so ~/.config/nvim/includes/backup.vim
so ~/.config/nvim/includes/plugins.vim
so ~/.config/nvim/includes/map.vim
so ~/.config/nvim/includes/filetypes.vim
so ~/.config/nvim/includes/events.vim

" Custom syntax
so ~/.config/nvim/includes/syntax/pgn.vim
