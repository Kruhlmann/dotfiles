autocmd bufnewfile *.ts so ~/.config/nvim/templates/
autocmd bufnewfile *.ts exe "1," . 10 . "g/\<file\>.*/s//" .expand("%")
autocmd bufnewfile *.ts exe "1," . 10 . "g/\<date\>.*/s//" .strftime("%d-%m-%Y")
autocmd Bufwritepre,filewritepre *.ts execute "normal ma"
autocmd Bufwritepre,filewritepre *.ts exe "1," . 10 . "g/\<last_mod\>.*/s/\<last_mod\>.*/" .strftime("%c")
autocmd bufwritepost,filewritepost *.ts execute "normal `a"
