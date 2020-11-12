set nocompatible
syntax on
set shell=zsh
set encoding=UTF-8
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
set rulerformat=%27(%{strftime('%a\ %e,\ %H:%M')}\ %5l,%-1(%c%V%)\ %P%)
set splitbelow splitright
set smarttab
set backspace=indent,eol,start
set incsearch
set previewheight=8
set autoread
set complete-=i
set showmatch
let &colorcolumn=join(range(81,121),",")
set updatetime=100
set ffs=unix,dos
set t_Co=256
set signcolumn=yes
set cmdheight=1
set hidden
set shortmess+=c
set conceallevel=0
set background=dark
set termguicolors
set noshowmode
set completeopt=menuone,noinsert,noselect
set viminfo+=n~/.cache/viminfo
" setlocal spell
set spelllang=da,en_us
set guifont=Fira\ Code:h22
set rtp+=~/.fzf

colo gruvbox

if exists('+clipboard')
  set clipboard=unnamedplus  " Yanks go to the ctrl-c '+' clipboard register
endif


