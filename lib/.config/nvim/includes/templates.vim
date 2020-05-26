" TypeScript.
autocmd bufnewfile *.ts so ~/.config/nvim/templates/ts.vim
autocmd bufnewfile *.ts exe "1," . 10 . "g/\<file\>/s//" .expand("%")
autocmd bufnewfile *.ts exe "1," . 10 . "g/\<date\>/s//" .strftime("%d-%m-%Y")
autocmd Bufwritepre,filewritepre *.ts exe "1," . 10 . "g/\Last modified on.*/s//Last modified on " .strftime("%c")

" JavaScript.
autocmd bufnewfile *.js so ~/.config/nvim/templates/js.vim
autocmd bufnewfile *.js exe "1," . 10 . "g/\<file\>/s//" .expand("%")
autocmd bufnewfile *.js exe "1," . 10 . "g/\<date\>/s//" .strftime("%d-%m-%Y")
autocmd Bufwritepre,filewritepre *.js exe "1," . 10 . "g/\Last modified on.*/s//Last modified on " .strftime("%c")

" Svelte/Sapper.
autocmd bufnewfile *.svelte so ~/.config/nvim/templates/svelte.vim
autocmd bufnewfile *.svelte exe "1," . 10 . "g/\<file\>/s//" .expand("%")
autocmd bufnewfile *.svelte exe "1," . 10 . "g/\<date\>/s//" .strftime("%d-%m-%Y")
autocmd Bufwritepre,filewritepre *.svelte exe "1," . 10 . "g/\Last modified on.*/s//Last modified on " .strftime("%c")

" HTML.
autocmd bufnewfile *.html so ~/.config/nvim/templates/html.vim
autocmd bufnewfile *.html exe "1," . 7 . "g/\<file\>/s//" .expand("%")
autocmd bufnewfile *.html exe "1," . 7 . "g/\<date\>/s//" .strftime("%d-%m-%Y")
autocmd Bufwritepre,filewritepre *.html exe "1," . 10 . "g/\Last modified on.*/s//Last modified on " .strftime("%c")

autocmd bufnewfile *.pug so ~/.config/nvim/templates/pug.vim
autocmd bufnewfile *.pug exe "1," . 5 . "g/\<file\>/s//" .expand("%")
autocmd bufnewfile *.pug exe "1," . 5 . "g/\<date\>/s//" .strftime("%d-%m-%Y")
autocmd Bufwritepre,filewritepre *.pug exe "1," . 5 . "g/\Last modified on.*/s//Last modified on " .strftime("%c")
