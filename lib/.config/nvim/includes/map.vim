let mapleader=' '

" Hardmode
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
map <leader>h <C-w>h
map <leader>j <C-w>j
map <leader>k <C-w>k
map <leader>l <C-w>l

" File system navigation
nmap <C-b> :NERDTreeToggle<CR>
map <leader>ev :e ~/.config/nvim/init.vim<CR>

" Search
map <leader><leader> :noh<CR>
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap * *<C-O>

" Line navigation
nnoremap H ^
nnoremap L g_

nnoremap ; :

" Commenting
map <leader>/ <plug>NERDCommenterToggle<CR>

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
"noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" FZF
nnoremap <silent> <leader>f :FZF<CR>
nnoremap <silent> <leader>f :FZF<CR>

" Go to file, if it doesn't exist, create it.
map gf :e <cfile><CR>

" Fly through buffers
nnoremap <leader>b :buffer <C-z><S-Tab>
nnoremap <leader>B :sbuffer <C-z><S-Tab>

" Autoformatter
noremap <F3> :Autoformat<CR>

" Tag bar
nmap <F8> :Vista<CR>

" Diagnostics maps
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

