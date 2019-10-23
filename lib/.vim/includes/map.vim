let mapleader=' '

" Split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nnoremap <C-left> 5<C-w><
nnoremap <C-right> 5<C-w>>

" File system navigation
map <leader>b :NERDTreeToggle<CR>
map <leader>p :vsplit %:p:h/package.json<CR>
map <leader>ev :vsplit $MYVIMRC<CR>
map <leader>ei :vsplit ~/.vim/includes<CR>

" Search
map <leader><leader> :noh<CR>
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap * *<C-O>

" Line navigation
nnoremap H ^
nnoremap L g_
