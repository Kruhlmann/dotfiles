local lspconfig = require('lspconfig')
local coq = require('coq')

local setup = function(on_attach, capabilities)
    lspconfig.pyright.setup(coq.lsp_ensure_capabilities())
    lspconfig.pyright.setup({on_attach = on_attach, capabilities = capabilities })
end

return setup
