local lspconfig = require('lspconfig')
local coq = require('coq')

local setup = function(on_attach, capabilities)
    lspconfig.solargraph.setup(coq.lsp_ensure_capabilities())
    lspconfig.solargraph.setup({on_attach = on_attach, capabilities = capabilities })
end

return setup
