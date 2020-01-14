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
map <leader>ev :vsplit ~/.config/nvim/includes<CR>
map <leader>ei :vsplit ~/.config/nvim/includes<CR>

" Search
map <leader><leader> :noh<CR>
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap * *<C-O>

" Zen mode
map <leader>z :Goyo<CR>

" Line navigation
nnoremap H ^
nnoremap L g_

" CTRLP
map <leader>p :CtrlP<CR>

nnoremap ; :

" Commenting
map <leader>/ <plug>NERDCommenterToggle<CR>

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
