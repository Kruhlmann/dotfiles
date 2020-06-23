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
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

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
    Plug 'Yggdroot/LeaderF',                       " FZF for files in
        \{ 'do': './install.sh' }                  " workspace.
    Plug 'preservim/nerdcommenter'                 " Commenter.
    Plug 'AlphaMycelium/pathfinder.vim'            " Movement suggestions.
    Plug 'unblevable/quick-scope'                  " Line navigation.
    Plug 'puremourning/vimspector'                 " Debugger.
    Plug 'editorconfig/editorconfig-vim'           " Editorconfig file support.
    Plug 'moll/vim-node'                           " NodeJS navigation.
    Plug 'takac/vim-hardtime'                      " Stop bad habits.

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
