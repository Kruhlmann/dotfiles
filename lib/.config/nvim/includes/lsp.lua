local lsp_status = require('lsp-status')
local nvim_lsp = require('nvim_lsp')
local completion = require('completion')

lsp_status.register_progress()

nvim_lsp.tsserver.setup{
    on_attach=completion.on_attach
}
