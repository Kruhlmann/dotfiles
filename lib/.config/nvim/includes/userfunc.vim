fun! CleanExtraSpaces() "Function to clean unwanted spaces
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

fun! RenameWord()
    let cword = expand("<cword>")
    let rword = input("New variable nmame: ")
    exe "%s/" . cword . "/" . rword . "/gc"
endfun
