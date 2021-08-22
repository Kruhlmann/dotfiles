call plug#begin("~/.local/share/nvim/plugged/")
    " File manager.
    Plug 'francoiscabrol/ranger.vim'                " Integrated ranger.
    Plug 'rbgrouleff/bclose.vim'                    " Ranger dependency.

    " Language server protocol.
    "Plug 'neoclide/coc.nvim',                       " Conquerer of Code LSP.
                "\{ 'do': 'yarn install --frozen-lockfile'}
    Plug 'nvim-treesitter/nvim-treesitter',        " LSP tree sitter.
        \{ 'pinned': 1 }

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
    Plug 'preservim/nerdcommenter'                 " Commenter.
    Plug 'puremourning/vimspector'                 " Debugger.
    Plug 'editorconfig/editorconfig-vim'           " Editorconfig file support.
    Plug 'moll/vim-node'                           " NodeJS navigation.
    Plug 'ap/vim-buftabline'                       " Vim buffers as tabs.
    Plug 'rhysd/vim-clang-format'                  " .clang-format formatter.
    Plug 'junegunn/fzf',                           " Fuzzy find inside files.
        \{ 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'rhysd/vim-grammarous'                    " Grammar check.
    Plug 'iamcco/markdown-preview.nvim',           "  Auto HTML rendering of MD
        \{ 'do': 'cd app && yarn install'  }
    Plug 'yuttie/comfortable-motion.vim'           " Smooth scrolling.
    Plug 'davidbeckingsale/writegood.vim'          " No weasel words.
    Plug 'liuchengxu/vim-which-key'                " Shortcut HUD.
    Plug 'tpope/vim-fugitive'                      " Git integration.
    Plug 'junegunn/gv.vim'                         " Git log browser.
    Plug 'AndrewRadev/tagalong.vim'                " HTML tag editor.
    Plug 'samoshkin/vim-mergetool'                 " Merge tool.

    " Syntax highlighting.
    Plug 'cakebaker/scss-syntax.vim'               " SCSS.
    Plug 'glench/vim-jinja2-syntax'                " Jinja2.
    Plug 'evanleck/vim-svelte', {'branch': 'main'} " SvelteJS.
    Plug 'mboughaba/i3config.vim'                  " i3 config.
    Plug 'HerringtonDarkholme/yats.vim'            " TypeScript.
    Plug 'pangloss/vim-javascript'                 " JavaScript.
    Plug 'dart-lang/dart-vim-plugin'               " Dart.
    Plug 'digitaltoad/vim-pug'                     " PUG/JADE.
    Plug 'OmniSharp/omnisharp-vim'                 " C#.
    Plug 'sheerun/vim-polyglot'                    " Language collection.

    " Themes.
    Plug 'kruhlmann/gruvbox-with-ANGRY-comments'
    Plug 'agude/vim-eldar'
    Plug 'leafOfTree/vim-svelte-theme'
    Plug 'Kruhlmann/cobalt2-vim-theme'
    Plug 'junegunn/seoul256.vim'


    Plug 'neovim/nvim-lspconfig'
    Plug 'neovim/nvim-lsp'

    " CoC
    "Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
    "Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
    "Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
    "Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
    "Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
    "Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
    "Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'}
    "Plug 'neoclide/coc-java', {'do': 'yarn install --frozen-lockfile'}
    "Plug 'neoclide/coc-emmet', {'do': 'yarn install --frozen-lockfile'}
    "Plug 'coc-extensions/coc-svelte', {'do': 'yarn install --frozen-lockfile'}
    "Plug 'coc-extensions/coc-powershell', {'do': 'yarn install --frozen-lockfile'}
    "Plug 'coc-extensions/coc-omnisharp', {'do': 'yarn install --frozen-lockfile'}
    "Plug 'clangd/coc-clangd', {'do': 'yarn install --frozen-lockfile'}
    "Plug 'weirongxu/coc-explorer', {'do': 'yarn install --frozen-lockfile'}
    "Plug 'iamcco/coc-vimlsp', {'do': 'yarn install --frozen-lockfile'}
    "Plug 'josa42/coc-go', {'do': 'yarn install --frozen-lockfile'}
    "Plug 'josa42/coc-sh', {'do': 'yarn install --frozen-lockfile'}
    "Plug 'josa42/coc-lua', {'do': 'yarn install --frozen-lockfile'}
    "Plug 'voldikss/coc-cmake', {'do': 'yarn install --frozen-lockfile'}
call plug#end()
