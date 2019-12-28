" Svelte
au BufNewFile,BufRead *.svelte set syntax=html
au FileType svelte UltiSnipsAddFiletypes html
au FileType svelte UltiSnipsAddFiletypes javascript
au FileType svelte UltiSnipsAddFiletypes css
au FileType svelte UltiSnipsAddFiletypes scss

" PGN
au BufNewFile,BufRead *.pgn set syntax=pgn

" Calcurse files
au BufRead,BufNewFile /tmp/calcurse* set filetype=markdown
au BufRead,BufNewFile ~/.calcurse/notes/* set filetype=markdown
