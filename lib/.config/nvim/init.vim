call plug#begin('~/.vim/plugged')
    Plug 'sirver/UltiSnips'
    Plug 'herrbischoff/cobalt2.vim'
    Plug 'jelera/vim-javascript-syntax'
    Plug 'scrooloose/nerdtree'
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

let g:indentLine_setColors=0
let g:indentLine_bgcolor_term=202
let g:indentLine_bgcolor_gui='#193549'
let g:indentLine_char = '▏'

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
set splitbelow
set colorcolumn=80,120
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
