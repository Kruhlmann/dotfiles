local lspconfig = require('lspconfig')
local null_ls = require("null-ls")

local setup = function(on_attach, capabilities)
    null_ls.setup({
        sources = {
            null_ls.builtins.formatting.black, null_ls.builtins.formatting.isort,
            null_ls.builtins.formatting.pylint, null_ls.builtins.formatting.eslint_d,
            null_ls.builtins.formatting.asmfmt,
            null_ls.builtins.formatting.prettier_d_slim,
            null_ls.builtins.formatting.clang_format,
            null_ls.builtins.formatting.cmake_format,
            null_ls.builtins.formatting.goimports, null_ls.builtins.formatting.golines,
            null_ls.builtins.formatting.gofumpt, null_ls.builtins.formatting.json_tool,
            null_ls.builtins.formatting.lua_format,
            null_ls.builtins.formatting.nginx_beautifier,
            null_ls.builtins.formatting.rufo, null_ls.builtins.formatting.shellcheck,
            null_ls.builtins.formatting.shellharden,
            null_ls.builtins.formatting.uncrustify,
            null_ls.builtins.diagnostics.luacheck,
            null_ls.builtins.diagnostics.write_good,
            null_ls.builtins.diagnostics.misspell, null_ls.builtins.diagnostics.vint
        },
        on_attach = on_attach,
    })
end

return setup
