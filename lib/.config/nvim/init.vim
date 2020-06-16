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
    Plug 'kien/rainbow_parentheses.vim'            " Colors matching brackets.
    Plug 'Yggdroot/indentLine'                     " Indentation indicators.

    " Functionality.
    Plug 'Chiel92/vim-autoformat'                  " Code formatter.
    Plug 'itchyny/vim-gitbranch'                   " Necessary for statusline.
    Plug 'mhinz/vim-signify'                       " Necessary for statusline.
    Plug 'xuhdev/vim-latex-live-preview',          " LaTEX live previewer.
        \{ 'for': 'tex' }
   "Plug 'SirVer/ultisnips'                        " Code snippets.
    Plug 'Yggdroot/LeaderF',                       " FZF for files in
        \{ 'do': './install.sh' }                  " workspace.
    Plug 'preservim/nerdcommenter'                 " Commenter.
    Plug 'AlphaMycelium/pathfinder.vim'            " Movement suggestions.
    Plug 'unblevable/quick-scope'                  " Line navigation.
    Plug 'puremourning/vimspector'                 " Debugger.

    " Syntax highlighting.
    Plug 'cakebaker/scss-syntax.vim'               " SCSS.
    Plug 'glench/vim-jinja2-syntax'                " Jinja2.
    Plug 'leafoftree/vim-svelte-plugin'            " SvelteJS.
    Plug 'mboughaba/i3config.vim'                  " i3 config.
    Plug 'HerringtonDarkholme/yats.vim'            " TypeScript.
    Plug 'pangloss/vim-javascript'                 " JavaScript.
    Plug 'dart-lang/dart-vim-plugin'               " Dart.
    Plug 'digitaltoad/vim-pug'                     " PUG/JADE.
    Plug 'OmniSharp/omnisharp-vim'                 " C#.
    Plug 'numirias/semshi',                        " Python semantics.
        \{'do': ':UpdateRemotePlugins'}

    " Themes.
    Plug 'gruvbox-community/gruvbox'
    Plug 'agude/vim-eldar'
    Plug 'leafOfTree/vim-svelte-theme'
call plug#end()

" LSP lua configuration.
luafile ~/.config/nvim/lua/lsp.lua

so ~/.config/nvim/includes/lsp.vim	               " LSP vim configuration.
so ~/.config/nvim/includes/basic.vim               " Basic vim settings.
so ~/.config/nvim/includes/wildmenu.vim               " Basic vim settings.
so ~/.config/nvim/includes/backup.vim              " Vim backup and swap files.
so ~/.config/nvim/includes/userfunc.vim            " User-defined functions.
so ~/.config/nvim/includes/binds.vim               " Key bindings.
so ~/.config/nvim/includes/statusline.vim          " Plugin configuration.
so ~/.config/nvim/includes/ftypes.vim              " Non-traditional filetypes.
so ~/.config/nvim/includes/events.vim              " Vim event handling.

so ~/.config/nvim/includes/lang/py.vim             " Python specific config.

so ~/.config/nvim/includes/syntax/pgn.vim          " PGN syntax highlighting.
so ~/.config/nvim/includes/syntax/vcard.vim        " VCard syntax highlighting.
so ~/.config/nvim/includes/plugins.vim             " Plugin configuration.
