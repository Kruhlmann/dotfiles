autocmd BufWritePre * :call CleanExtraSpaces()
autocmd BufWritePre *.ts,*.js :CocCommand eslint.executeAutofix
autocmd BufWritePost *.ts,*.js,*.svelte silent! !ctags -R --exclude=.git --exclude=node_modules --exclude=test --exclude=__sapper__
