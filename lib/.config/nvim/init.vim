call plug#begin("~/.local/share/nvim/plugged/")
    " File manager.
    Plug 'scrooloose/nerdtree'                     " File manager.
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " Syntax highlighting NERD.
    Plug 'ryanoasis/vim-devicons'                  " File type icons.
    Plug 'Xuyuanp/nerdtree-git-plugin'             " Show git status of files.

    " Language server protocol.
    Plug 'neoclide/coc.nvim', {'branch': 'release'} " Conquerer of Code LSP.
    Plug 'davidhalter/jedi-vim'                     " Python LSP
    "Plug 'neovim/nvim-lsp'                         " Native language server.
    "Plug 'haorenW1025/completion-nvim'             " LSP auto completion.
    "Plug 'haorenW1025/diagnostic-nvim'             " LSP diagnostics.
    "Plug 'wbthomason/lsp-status.nvim'              " LSP statusbar utilities.
    "Plug 'nvim-treesitter/nvim-treesitter'         " LSP tree sitter.

    " Appearance
    Plug 'junegunn/goyo.vim'                       " Focus mode.
    Plug 'kien/rainbow_parentheses.vim'            " Colors matching brackets.
    Plug 'Yggdroot/indentLine'                     " Indentation indicators.
    Plug 'jackguo380/vim-lsp-cxx-highlight'        " Semantic highlight for cpp.
    Plug 'jaxbot/semantic-highlight.vim'           " Semantic highlight for ts.

    " Functionality.
    Plug 'Chiel92/vim-autoformat'                  " Code formatter.
    Plug 'itchyny/vim-gitbranch'                   " Necessary for statusline.
    Plug 'mhinz/vim-signify'                       " Necessary for statusline.
    Plug 'xuhdev/vim-latex-live-preview',          " LaTEX live previewer.
        \{ 'for': 'tex' }
    Plug 'Yggdroot/LeaderF',                       " FZF for files in workspace
        \{ 'do': './install.sh' }
    Plug 'preservim/nerdcommenter'                 " Commenter.
    Plug 'puremourning/vimspector'                 " Debugger.
    Plug 'editorconfig/editorconfig-vim'           " Editorconfig file support.
    Plug 'moll/vim-node'                           " NodeJS navigation.
    Plug 'ap/vim-buftabline'                       " Vim buffers as tabs.
    Plug 'rhysd/vim-clang-format'                  " .clang-format formatter.
    Plug 'junegunn/fzf.vim'                        " Fuzzy find inside files.
    Plug 'rhysd/vim-grammarous'                    " Grammar check
    Plug 'iamcco/markdown-preview.nvim',           " Markdown preview.
        \{ 'do': 'cd app && yarn install'  }

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

    " Themes.
    Plug 'gruvbox-community/gruvbox'
    Plug 'agude/vim-eldar'
    Plug 'leafOfTree/vim-svelte-theme'
    Plug 'Kruhlmann/cobalt2-vim-theme'
    Plug 'junegunn/seoul256.vim'
call plug#end()

" Global configuration.
so ~/.config/nvim/includes/basic.vim               " Basic vim settings.
so ~/.config/nvim/includes/wildmenu.vim            " Basic vim settings.
so ~/.config/nvim/includes/backup.vim              " Vim backup and swap files.
so ~/.config/nvim/includes/userfunc.vim            " User-defined functions.
so ~/.config/nvim/includes/binds.vim               " Key bindings.
so ~/.config/nvim/includes/statusline.vim          " Plugin configuration.
so ~/.config/nvim/includes/ftypes.vim              " Non-traditional filetypes.
so ~/.config/nvim/includes/events.vim              " Vim event handling.
so ~/.config/nvim/includes/plugins.vim             " Plugin configuration.

" Filetype specific configuration.
so ~/.config/nvim/includes/lang/py.vim             " Python specific config.

" Custom syntax configuration.
so ~/.config/nvim/includes/syntax/pgn.vim          " PGN syntax highlighting.
so ~/.config/nvim/includes/syntax/vcard.vim        " VCard syntax highlighting.

" Language server configuration.
"luafile ~/.config/nvim/lua/lsp.lua
"luafile ~/.config/nvim/lua/tree_sit.lua
