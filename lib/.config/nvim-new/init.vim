" Plugin setup.
call plug#begin("~/.local/share/nvim/plugged/")

    " File manager.
	Plug 'scrooloose/nerdtree'                     " File manager.
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " Syntax highlighting in
                                                   " NERDTree buffers.
    Plug 'ryanoasis/vim-devicons'                  " File type icons in
                                                   " NERDTree buffers.
    Plug 'Xuyuanp/nerdtree-git-plugin'             " Show git status of files
                                                   " in NERDTree buffers.
    " Language server protocol.
    Plug 'neovim/nvim-lsp'                         " NVIM LSP configuration
                                                   " helper.
    Plug 'haorenW1025/diagnostic-nvim'             " NVIM LSP diagnostics.
    Plug 'wbthomason/lsp-status.nvim'              " NVIM LSP based status bar.
    Plug 'haorenW1025/completion-nvim'             " NVIM LSP code completion.

    " Appearance
    Plug 'junegunn/goyo.vim'                       " Focus mode.

    " Functionality.
    Plug 'Chiel92/vim-autoformat'                  " Code formatter.
    
    " Themes.
    Plug 'gruvbox-community/gruvbox'
    Plug 'agude/vim-eldar'
    Plug 'leafOfTree/vim-svelte-theme'
call plug#end()

" Lua LSP configuration.
luafile ~/.config/nvim/lua/lsp.lua

so ~/.config/nvim/includes/vim/basic.vim           " Basic vim settings.
so ~/.config/nvim/includes/vim/binds.vim           " Key bindings.
so ~/.config/nvim/includes/vim/statusline.vim      " Plugin configuration.
so ~/.config/nvim/includes/vim/plugins.vim         " Plugin configuration.

so ~/.config/nvim/includes/vim/lang/py.vim         " Python specific config.
