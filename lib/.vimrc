call plug#begin('~/.vim/plugged')
    Plug 'sirver/UltiSnips'
    Plug 'jelera/vim-javascript-syntax'
    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'mattn/emmet-vim'
    Plug 'evanleck/vim-svelte'
    Plug 'scrooloose/syntastic'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'kruhlmann/vim-snippets'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'airblade/vim-gitgutter'
    Plug 'Yggdroot/indentLine'
    Plug 'tomtom/tcomment_vim'
    Plug 'raimondi/delimitmate'
    Plug 'leafgarland/typescript-vim'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'ryanoasis/vim-devicons'
    Plug 'ap/vim-css-color'
    Plug 'cakebaker/scss-syntax.vim'
    Plug 'glench/vim-jinja2-syntax'
    Plug 'google/vim-searchindex'
    Plug 'jmcantrell/vim-virtualenv'
    Plug 'heavenshell/vim-jsdoc'
    Plug 'mboughaba/i3config.vim'
    Plug 'vimoutliner/vimoutliner'
    Plug 'junegunn/goyo.vim'
call plug#end()

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
    if exists("t:NERDTreeBufName")
        if bufwinnr(t:NERDTreeBufName) != -1
            if winnr("$") == 1
                q
            endif
        endif
    endif
endfunction

" Plugin configuration
autocmd FileType html,css,svelte EmmetInstall
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['python', 'javascript'], 'passive_filetypes': [] }

" Status line
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" set statusline+=%{FugitiveStatusline()}

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:NERDTreeShowHidden=1
let g:NERDTreeChDirMode=2

let g:indentLine_char = '▏'

let g:better_whitespace_guicolor='red'
let g:better_whitespace_ctermcolor='red'
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

" Basic configuration
set nocompatible
syntax on
set encoding=utf-8
set number
set relativenumber
set cursorline
set wrap
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set mouse=a
set clipboard=unnamedplus
set history=1000
set ruler
set splitbelow splitright
set smarttab
set backspace=indent,eol,start
set incsearch
set autoread
set complete-=i
set colorcolumn=80,120
set ffs=unix,dos
set t_Co=256

" Wildmenu
set wildmenu
set wildmode=longest,list,full
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX artifacts
set wildignore+=*.jpg,*.bmp,*.png,*.jpeg,*.gif   " Binary images
set wildignore+=*.0,*.onj,*.exe,*.dll,*.manifest " Object files
set wildignore+=*.sw?,*.swap                     " Vim swap files
set wildignore+=*.DS_Store                       " OSX
set wildignore+=*.package-lock.json              " NPM packages cache
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.mov,*.mp4,*.mkv,*.webm         " Video files

" Backup configuration
set undodir=~/.vim/tmp/undo/
set backupdir=~/.vim/tmp/backup/
set directory=~/.vim/tmp/swap/
set undofile
set backup
set noswapfile

" Colors
colo cobalt
highlight Normal ctermbg=8
hi ColorColumn ctermbg=237 guibg=#000000

" Launch setup
" au VimEnter * NERDTree %
" au VimEnter * wincmd p

" UltiSnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackward = '<s-tab>'
let g:UltiSnipsSnippetsDir = '~/.vim/snippets'
let g:user_emmet_leader_key='<c-y>'

" Auto save all buffers on blur
" au FocusLost * :wa

" Auto update on .vimrc changes
"augroup myvimrc
"    au!
"    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
"augroup END

" Go to file location
cd %:p:h

" Include files
so ~/.vim/includes/filetypes.vim
so ~/.vim/includes/map.vim

" Syntax files
so ~/.vim/syntax/pgn.vim
