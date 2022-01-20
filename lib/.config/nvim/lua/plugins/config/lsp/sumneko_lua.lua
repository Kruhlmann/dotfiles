local lspconfig = require('lspconfig')

local setup = function(on_attach, capabilities)
    lspconfig.sumneko_lua.setup(coq.lsp_ensure_capabilities())
    local luadev = require("lua-dev").setup {
        library = {
            vimruntime = true,
            types = true,
            plugins = {"nvim-treesitter", "plenary.nvim", "telescope.nvim"}
        },
        lspconfig = {
            cmd = {"lua-language-server"},
            on_attach = on_attach,
            capabilities = capabilities
        }
    }
    lspconfig.sumneko_lua.setup(luadev)
end

return setup
