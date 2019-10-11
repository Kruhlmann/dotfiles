call plug#begin('~/.vim/plugged')
    Plug 'sirver/UltiSnips'
    Plug 'herrbischoff/cobalt2.vim'
    Plug 'jelera/vim-javascript-syntax'
    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'mattn/emmet-vim'
    Plug 'evanleck/vim-svelte'
    Plug 'scrooloose/syntastic'
    Plug 'anned20/vimsence'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'kruhlmann/vim-snippets'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'airblade/vim-gitgutter'
    Plug 'ycm-core/YouCompleteMe'
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
call plug#end()

function! SourceDirectory(file)
    for s:fpath in split(globpath(a:file, '*.vim'), '\n')
        exe 'source' s:fpath
    endfor
endfunction

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
let NERDTreeShowHidden=1

let g:airline_theme='cobalt2'

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

au FileType svelte UltiSnipsAddFiletypes html
au FileType svelte UltiSnipsAddFiletypes javascript
au FileType svelte UltiSnipsAddFiletypes css
au FileType svelte UltiSnipsAddFiletypes scss

" Basic configuration
colo cobalt2
syntax on
set encoding=utf-8
set number
set relativenumber
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
set wildmode=longest,list,full

highlight ColorColumn ctermbg=0 guibg=#003755


" Launch setup
au VimEnter * NERDTree
au VimEnter * wincmd p
au VimEnter * split
au VimEnter * terminal
au VimEnter * wincmd k

" Remaps
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackward = '<s-tab>'
let g:UltiSnipsSnippetsDir = '~/.vim/snippets'
let g:user_emmet_leader_key='<c-y>'

call SourceDirectory('~/.vim/include')
