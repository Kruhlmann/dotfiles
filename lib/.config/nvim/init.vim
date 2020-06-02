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
    "Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
    Plug 'voldikss/vim-floaterm'
    Plug 'ap/vim-buftabline'
    Plug 'heavenshell/vim-jsdoc', { 'do': 'make install' }
    Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

    " LSP
    Plug 'neovim/nvim-lsp'
    Plug 'haorenW1025/completion-nvim'
    Plug 'haorenW1025/diagnostic-nvim'
    Plug 'wbthomason/lsp-status.nvim'

    " Language syntax.
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

    " Appearance.
    Plug 'junegunn/goyo.vim'
    Plug 'kien/rainbow_parentheses.vim'
    Plug 'gko/vim-coloresque'
    Plug 'itchyny/lightline.vim'

    " Themes.
    Plug 'morhetz/gruvbox'
    Plug 'agude/vim-eldar'
    Plug 'leafOfTree/vim-svelte-theme'
call plug#end()

" Vim config.
so ~/.config/nvim/includes/basic.vim
so ~/.config/nvim/includes/wildmenu.vim
so ~/.config/nvim/includes/backup.vim
so ~/.config/nvim/includes/map.vim
so ~/.config/nvim/includes/filetypes.vim
so ~/.config/nvim/includes/events.vim
so ~/.config/nvim/includes/userfunc.vim
so ~/.config/nvim/includes/templates.vim

" Custom syntax.
so ~/.config/nvim/includes/syntax/pgn.vim

" Plugin configuration.
luafile ~/.config/nvim/includes/lsp.lua
so ~/.config/nvim/includes/plugins/nerdtree.vim
so ~/.config/nvim/includes/plugins/vim-latex-live-preview.vim
so ~/.config/nvim/includes/plugins/vim-svelte-plugin.vim
so ~/.config/nvim/includes/plugins/omnisharp-vim.vim
"so ~/.config/nvim/includes/plugins/coc.vim
so ~/.config/nvim/includes/plugins/goyo.vim
so ~/.config/nvim/includes/plugins/leaderf.vim
so ~/.config/nvim/includes/plugins/nerd-commenter.vim
so ~/.config/nvim/includes/plugins/floaterm.vim
so ~/.config/nvim/includes/plugins/rainbow_parentheses.vim
so ~/.config/nvim/includes/plugins/nvim-completion.vim
