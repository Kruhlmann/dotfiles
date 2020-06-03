let g:OmniSharp_server_stdio = 1
let g:OmniSharp_highlight_types = 3
let g:OmniSharp_highlight_groups = {
\ 'csUserIdentifier': [
\   'constant name', 'enum member name', 'field name', 'identifier',
\   'local name', 'parameter name', 'property name', 'static symbol'],
\ 'csUserInterface': ['interface name'],
\ 'csUserMethod': ['extension method name', 'method name'],
\ 'csUserType': ['class name', 'enum name', 'namespace name', 'struct name']
\}
let g:omnicomplete_fetch_full_documentation = 1
autocmd CursorHold *.cs OmniSharpTypeLookup
autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>
autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>
autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>
nnoremap <Leader>P :OmniSharpGetCodeActions<CR>
