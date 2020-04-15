" NERDTree
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
let g:NERDTreeIgnore = [
    \'.inject.summary$',
    \'.inject.dart$',
    \'.g.dart$'
    \]
let g:NERDTreeShowHidden = 1
let g:NERDTreeShowBookmarks = 1

" vim8.0+ or neovim: Use the stdio server, it is used asynchronously and there
" is no python requirement.
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_highlight_types = 3
let g:OmniSharp_highlight_groups = {
\ 'csUserIdentifier': [
\   'constant name', 'enum member name', 'field name', 'identifier',
\   'local name', 'parameter name', 'property name', 'static symbol'],
\ 'csUserInterface': ['interface name'],
\ 'csUserMethod': ['extension method name', 'method name'],
\ 'csUserType': ['class name', 'enum name', 'namespace name', 'struct name']
\}
let g:omnicomplete_fetch_full_documentation = 1
autocmd CursorHold *.cs OmniSharpTypeLookup
autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>
autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>
autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>
nnoremap <Leader>P :OmniSharpGetCodeActions<CR>

" Floating term
let g:floaterm_type = 'floating'
let g:floaterm_height = 0.6
let g:floaterm_width = 0.6
let g:floaterm_winblend = 20
let g:floaterm_position = 'center'
hi FloatermNF guibg=black
hi FloatermBorderNF guibg=black

" CoC
let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-pairs',
    \ 'coc-tsserver',
    \ 'coc-eslint',
    \ 'coc-prettier',
    \ 'coc-json',
    \ 'coc-python',
    \]

" Devicons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

" Lightline
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ }

" Goyo
let g:goyo_width = 120

" Rainbow
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
