let g:floaterm_type = 'floating'
let g:floaterm_height = 0.6
let g:floaterm_width = 0.6
let g:floaterm_winblend = 20
let g:floaterm_position = 'center'
hi FloatermNF guibg=black
hi FloatermBorderNF guibg=black

" Lazygit
map <leader>g :FloatermNew lazygit<CR>

" Toggle floating terminal
let g:floaterm_keymap_toggle = '<C-t>'
let g:floaterm_keymap_close = '<C-x>'
