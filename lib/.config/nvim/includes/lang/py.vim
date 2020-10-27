let g:formatter_yapf_style = 'pep8'
let g:formatters_python = ['yapf']
au BufWrite *.py :Autoformat
