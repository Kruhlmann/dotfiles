let mapleader=' '

" Medium-mode
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" Split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nnoremap <C-left> 5<C-w><
nnoremap <C-right> 5<C-w>>
"map <leader>h <C-w>h
"map <leader>j <C-w>j
"map <leader>k <C-w>k
"map <leader>l <C-w>l

" Tab (actually buffers) navigation
map <C-k> :bnext<CR>
map <C-j> :bprevious<CR>
map <C-d> :bdelete<CR>

" Search
map <leader><leader> :noh<CR>
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap * *<C-O>

" Easy command mode
nnoremap ; :

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Plug install.
nnoremap <silent><leader>i :source $MYVIMRC \| :PlugInstall<CR>

" Git diff mode
if &diff
    map <leader>1 :diffget LOCAL<CR>
    map <leader>2 :diffget BASE<CR>
    map <leader>3 :diffget REMOTE<CR>
    nnoremap <leader>n ]c
    nnoremap <leader>N [c
endif
