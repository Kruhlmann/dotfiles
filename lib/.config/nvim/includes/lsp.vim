lua << EOF
vim.cmd('packadd nvim-lsp')
require'nvim_lsp'.gopls.setup{}
EOF
