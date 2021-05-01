nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

let g:which_key_map =  {}
let g:which_key_sep = '→'
let g:which_key_use_floating_win = 0

nnoremap <leader>? :CocSearch <C-R>=expand("<cword>")<CR><CR>

let g:which_key_map['?'] = 'search word'
let g:which_key_map['n'] = [ ':noh'                         , 'remove search highlight' ]
let g:which_key_map['/'] = [ '<plug>NERDCommenterToggle'          , 'toggle commenting' ]
let g:which_key_map['d'] = [ ':ddelete'                           , 'delete buffer']
let g:which_key_map['f'] = [ ':CocCommand explorer'               , 'explorer' ]
let g:which_key_map['i'] = [ ':PlugInstall'                       , 'install plugins' ]
let g:which_key_map['j'] = [ ':bnext'                             , 'next buffer' ]
let g:which_key_map['k'] = [ ':bprevious'                         , 'previous buffer' ]
let g:which_key_map['o'] = [ ':Tags'                              , 'search tags' ]
let g:which_key_map['p'] = [ ':Files'                             , 'search files' ]
let g:which_key_map['q'] = [ ':quit'                              , 'quit' ]
let g:which_key_map['r'] = [ ':Ranger'                            , 'ranger' ]
let g:which_key_map['u'] = [ ':PlugUpdate'                        , 'update plugins' ]
let g:which_key_map['z'] = [ ':Goyo'                              , 'zen' ]

let g:which_key_map.e = {
      \ 'name' : '+files' ,
      \ '.' : [':e ~/.config/nvim/init.vim'                                    , 'neovim rc'],
      \ 'i' : ['<Plug>(emoji-start-complete)'                                            , 'insert emoji'],
      \ 'k' : [':e ~/.config/nvim/includes/plugins/vim-which-key.vim'          , 'vim keybinds'],
      \ 'p' : [':e ~/.config/polybar/config'                                   , 'polybar config'],
      \ 'm' : [':e ~/.config/polybar/modules.conf'                             , 'polybar modules'],
      \ 'd' : [':e $DOTFILES/setup'                                            , 'dotfiles setup'],
      \ 'x' : [':e ~/.xmonad/xmonad.hs'                                        , 'xmonad config'],
      \ }
let g:which_key_map.w = {
      \ 'name' : '+windows' ,
      \ 'w' : ['<C-W>w'     , 'other-window']          ,
      \ 'd' : ['<C-W>c'     , 'delete-window']         ,
      \ '-' : ['<C-W>s'     , 'split-window-below']    ,
      \ '|' : ['<C-W>v'     , 'split-window-right']    ,
      \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
      \ 'h' : ['<C-W>h'     , 'window-left']           ,
      \ 'j' : ['<C-W>j'     , 'window-below']          ,
      \ 'l' : ['<C-W>l'     , 'window-right']          ,
      \ 'k' : ['<C-W>k'     , 'window-up']             ,
      \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
      \ 'J' : ['resize +5'  , 'expand-window-below']   ,
      \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
      \ 'K' : ['resize -5'  , 'expand-window-up']      ,
      \ '=' : ['<C-W>='     , 'balance-window']        ,
      \ 's' : ['<C-W>s'     , 'split-window-below']    ,
      \ 'v' : ['<C-W>v'     , 'split-window-below']    ,
      \ '?' : ['Windows'    , 'fzf-window']            ,
      \ }

"let g:which_key_map.l = {
      "\ 'name' : '+lsp' ,
      "\ 'd' : [':lua vim.lsp.buf.definition()'       , 'definition'],
      "\ 'D' : [':lua vim.lsp.util.show_line_diagnostics()', 'diagnostics'],
      "\ 'f' : [':lua vim.lsp.buf.formatting()'          , 'format'],
      "\ 'r' : [':lua vim.lsp.buf.rename()'          , 'rename'],
      "\ 'R' : [':lua vim.lsp.buf.references()'          , 'references'],
    "\ }
let g:which_key_map.l = {
      \ 'name' : '+coc' ,
      \ '.' : [':CocConfig'                          , 'config'],
      \ ';' : ['<Plug>(coc-refactor)'                , 'refactor'],
      \ 'a' : ['<Plug>(coc-codeaction)'              , 'line action'],
      \ 'A' : ['<Plug>(coc-codeaction-selected)'     , 'selected action'],
      \ 'b' : [':CocNext'                            , 'next action'],
      \ 'B' : [':CocPrev'                            , 'prev action'],
      \ 'c' : [':CocList commands'                   , 'commands'],
      \ 'd' : ['<Plug>(coc-definition)'              , 'definition'],
      \ 'D' : ['<Plug>(coc-declaration)'             , 'declaration'],
      \ 'e' : [':CocList extensions'                 , 'extensions'],
      \ 'E' : [':CocList extensions'                 , 'extensions'],
      \ 'f' : ['<Plug>(coc-format-selected)'         , 'format selected'],
      \ 'F' : ['<Plug>(coc-format)'                  , 'format'],
      \ 'h' : ['<Plug>(coc-float-hide)'              , 'hide'],
      \ 'i' : ['<Plug>(coc-implementation)'          , 'implementation'],
      \ 'I' : [':CocList diagnostics'                , 'diagnostics'],
      \ 'j' : ['<Plug>(coc-float-jump)'              , 'float jump'],
      \ 'l' : ['<Plug>(coc-codelens-action)'         , 'code lens'],
      \ 'n' : ['<Plug>(coc-diagnostic-next)'         , 'next diagnostic'],
      \ 'N' : ['<Plug>(coc-diagnostic-next-error)'   , 'next error'],
      \ 'O' : [':CocList outline'                    , 'outline'],
      \ 'p' : ['<Plug>(coc-diagnostic-prev)'         , 'prev diagnostic'],
      \ 'P' : ['<Plug>(coc-diagnostic-prev-error)'   , 'prev error'],
      \ 'q' : ['<Plug>(coc-fix-current)'             , 'quickfix'],
      \ 'r' : ['<Plug>(coc-rename)'                  , 'rename'],
      \ 'R' : ['<Plug>(coc-references)'              , 'references'],
      \ 's' : [':CocList -I symbols'                 , 'cymbols'],
      \ 'S' : [':CocList snippets'                   , 'snippets'],
      \ 't' : ['<Plug>(coc-type-definition)'         , 'type definition'],
      \ 'u' : [':CocListResume'                      , 'resume list'],
      \ 'U' : [':CocUpdate'                          , 'update CoC'],
      \ 'z' : [':CocDisable'                         , 'disable CoC'],
      \ 'Z' : [':CocEnable'                          , 'enable CoC'],
      \ }
let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 'a' : [':Git add .'                        , 'add all'],
      \ 'A' : [':Git add %'                        , 'add current'],
      \ 'b' : [':Git blame'                        , 'blame'],
      \ 'B' : [':GBrowse'                          , 'browse'],
      \ 'c' : [':Git commit'                       , 'commit'],
      \ 'd' : [':Git diff'                         , 'diff'],
      \ 'D' : [':Gdiffsplit'                       , 'diff split'],
      \ 'g' : [':GGrep'                            , 'git grep'],
      \ 'G' : [':Gstatus'                          , 'status'],
      \ 'h' : [':GitGutterLineHighlightsToggle'    , 'highlight hunks'],
      \ 'H' : ['<Plug>(GitGutterPreviewHunk)'      , 'preview hunk'],
      \ 'j' : ['<Plug>(GitGutterNextHunk)'         , 'next hunk'],
      \ 'k' : ['<Plug>(GitGutterPrevHunk)'         , 'prev hunk'],
      \ 'l' : [':Git log'                          , 'log'],
      \ 'm' : ['<Plug>(git-messenger)'             , 'message'],
      \ 'p' : [':Git push'                         , 'push'],
      \ 'P' : [':Git pull'                         , 'pull'],
      \ 'r' : [':GRemove'                          , 'remove'],
      \ 's' : ['<Plug>(GitGutterStageHunk)'        , 'stage hunk'],
      \ 'S' : [':!git status'                      , 'status'],
      \ 't' : [':GitGutterSignsToggle'             , 'toggle signs'],
      \ 'u' : ['<Plug>(GitGutterUndoHunk)'         , 'undo hunk'],
      \ 'v' : [':GV'                               , 'view commits'],
      \ 'V' : [':GV!'                              , 'view buffer commits'],
      \ }

let g:which_key_map.m = {
      \ 'name' : '+make' ,
      \ 'b' : [':!make build'                      , 'build'],
      \ 'c' : [':!make clean'                      , 'clean'],
      \ 'f' : [':!make fix'                        , 'fix'],
      \ 'i' : [':!make test-integration'           , 'integration test'],
      \ 'I' : [':!make install'                    , 'intall'],
      \ 'l' : [':!make lint'                       , 'lint'],
      \ 't' : [':!make test'                       , 'test'],
      \ 'u' : [':!make test-unit'                  , 'unit test'],
      \ }

call which_key#register('<Space>', "g:which_key_map")

"nnoremap <silent> <leader>ld    <cmd>lua vim.lsp.buf.declaration()<CR>
"nnoremap <silent> <leader>lD    <cmd>lua vim.lsp.util.show_line_diagnostics()<CR>
"nnoremap <silent> <leader>lr    <cmd>lua vim.lsp.buf.rename()<CR>
"nnoremap <silent> <leader>lR    <cmd>lua vim.lsp.buf.references()<CR>
"nnoremap <silent> <leader>lf    <cmd>lua vim.lsp.buf.formatting()<CR>
"nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
"nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
"nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
"nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
"nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
"nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
"nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
