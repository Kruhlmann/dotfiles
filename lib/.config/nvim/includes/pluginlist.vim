call plug#begin("~/.local/share/nvim/plugged/")
    " File manager.
    Plug 'francoiscabrol/ranger.vim'                " Integrated ranger.
    Plug 'rbgrouleff/bclose.vim'                    " Ranger dependency.

    " Language server protocol.
    Plug 'neoclide/coc.nvim',                       " Conquerer of Code LSP.
                \{ 'do': 'yarn install --frozen-lockfile'}

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
    Plug 'iamcco/markdown-preview.nvim',           " Markdown preview.
        \{ 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    Plug 'yuttie/comfortable-motion.vim'           " Smooth scrolling.
    Plug 'davidbeckingsale/writegood.vim'          " No weasel words.
    Plug 'liuchengxu/vim-which-key'                " Shortcut HUD.
    Plug 'honza/vim-snippets'                      " Snippet collection.
    Plug 'tpope/vim-fugitive'                      " Git integration.
    Plug 'junegunn/gv.vim'                         " Git log browser.
    Plug 'AndrewRadev/tagalong.vim'                " HTML tag editor.

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

    " Themes.
    Plug 'gruvbox-community/gruvbox'
    Plug 'agude/vim-eldar'
    Plug 'leafOfTree/vim-svelte-theme'
    Plug 'Kruhlmann/cobalt2-vim-theme'
    Plug 'junegunn/seoul256.vim'
call plug#end()
