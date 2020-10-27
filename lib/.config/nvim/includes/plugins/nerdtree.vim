let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
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
    \'.g.dart$',
    \'yarn.lock$',
    \'package-lock.json$',
    \'.o$',
    \'LICENSE$'
    \]
let g:NERDTreeShowHidden = 1
let g:NERDTreeShowBookmarks = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
"function! s:CloseIfOnlyNerdTreeLeft()
    "if exists("t:NERDTreeBufName")
        "if bufwinnr(t:NERDTreeBufName) != -1
            "if winnr("$") == 1
                "q
            "endif
        "endif
    "endif
"endfunction

" Check if NERDTree is open or active
"function! IsNERDTreeOpen()
  "return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
"endfunction

" Close NERDTree if it's the only buffer left
"autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" File system navigation
"nmap <leader>f :NERDTreeToggle<CR>
