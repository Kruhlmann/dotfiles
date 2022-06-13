local vim = vim

vim.g.coq_settings = {
    ["auto_start"] = 'shut-up',
    ["keymap.pre_select"] = true,
    ["clients.buffers.enabled"] = false,
    ["clients.snippets.enabled"] = false,
    ["clients.tmux.enabled"] = false,
    ["clients.tree_sitter.enabled"] = true,
    ["limits.completion_manual_timeout"] = 0.150
}

local protocol = require('vim.lsp.protocol')
local saga = require("lspsaga")
local coq = require "coq"
local null_ls = require 'null-ls'
local luadev = require("lua-dev").setup({})
local capabilities = protocol.make_client_capabilities()

local on_attach_null_ls = function(client)
    protocol.CompletionItemKind = {
        '', 'ƒ', 'ƒ', '', '識', '𝑋', '', '', '', '',
        '猪', '', '了', '', '﬌', '', '', '', '', '',
        '', '', '', '', ''
    }
    if client.server_capabilities.document_formatting then
        vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    end
end

saga.init_lsp_saga()

package.path = package.path ..
                   ";/home/ges/doc/src/github.com/kruhlmann/dotfiles/lib/.config/nvim/lua/plugins/config/lsp/?.lua"
require'lspconfig'.tsserver.setup {}
require'lspconfig'.tsserver.setup(coq.lsp_ensure_capabilities())
require'lspconfig'.pyright.setup {}
require'lspconfig'.pyright.setup(coq.lsp_ensure_capabilities())
require'lspconfig'.solargraph.setup {}
require'lspconfig'.solargraph.setup(coq.lsp_ensure_capabilities())
require'lspconfig'.solidity_ls.setup {}
require'lspconfig'.solidity_ls.setup(coq.lsp_ensure_capabilities())
require'lspconfig'.cmake.setup {}
require'lspconfig'.cmake.setup(coq.lsp_ensure_capabilities())
require'lspconfig'.bashls.setup {}
require'lspconfig'.bashls.setup(coq.lsp_ensure_capabilities())
require'lspconfig'.dockerls.setup {}
require'lspconfig'.dockerls.setup(coq.lsp_ensure_capabilities())
require'lspconfig'.sumneko_lua.setup(luadev)
require'lspconfig'.sumneko_lua.setup(coq.lsp_ensure_capabilities())
require'lspconfig'.ccls.setup {}
require'lspconfig'.ccls.setup(coq.lsp_ensure_capabilities())

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.black, null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.eslint_d,
        null_ls.builtins.formatting.asmfmt,
        null_ls.builtins.formatting.prettier_d_slim,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.cmake_format,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.golines,
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.json_tool,
        null_ls.builtins.formatting.lua_format,
        null_ls.builtins.formatting.nginx_beautifier,
        null_ls.builtins.formatting.rufo, null_ls.builtins.formatting.shfmt,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.uncrustify,
        null_ls.builtins.diagnostics.alex,
        null_ls.builtins.diagnostics.shellcheck,
        null_ls.builtins.diagnostics.luacheck,
        null_ls.builtins.diagnostics.write_good,
        null_ls.builtins.diagnostics.misspell,
        null_ls.builtins.diagnostics.vint, null_ls.builtins.hover.dictionary,
        null_ls.builtins.code_actions.gitsigns,
        null_ls.builtins.code_actions.proselint,
        null_ls.builtins.code_actions.refactoring,
        null_ls.builtins.completion.spell
    },
    on_attach = on_attach_null_ls,
    capabilities = capabilities
})
