autocmd BufWritePre * :call CleanExtraSpaces()
autocmd BufWritePre *.ts,*.js :CocCommand eslint.executeAutofix
