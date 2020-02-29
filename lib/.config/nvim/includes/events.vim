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

function! ReloadFlutter()
    silent execute '!kill $(pgrep -f flutter\ run)'
    "silent execute '!kill $(pgrep -f /opt/flutter/bin/cache/dart-sdk/bin/dart)'
    silent execute '!flutter run'
    echo 1
endfunction

" Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Close NERDTree if it's the only buffer left
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" CoC prettier command on save
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Rainbow
au VimEnter * RainbowParenthesesActivate
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Flutter pseudo hot-reload
autocmd! BufWritePost *.dart call ReloadFlutter()
