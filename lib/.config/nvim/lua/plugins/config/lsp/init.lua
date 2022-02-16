vim.g.coq_settings = {
    ["keymap.pre_select"] = true,
    ["auto_start"] = true,
}

local protocol = require('vim.lsp.protocol')
local saga = require("lspsaga")

local buf_map = function(bufnr, mode, lhs, rhs, opts)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
        silent = true,
    })
end

local on_attach = function(client, bufnr)
    protocol.CompletionItemKind = {
        '', 'ƒ', 'ƒ', '', '識', '𝑋', '', '', '', '',
        '猪', '', '了', '', '﬌', '', '', '', '', '',
        '', '', '', '', ''
    }
    if client.resolved_capabilities.document_formatting then
        vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    end

    vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
    vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
    vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
    vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
    vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
    vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
    vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
    vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
    vim.cmd("command! LspDiagPrev lua vim.diagnostic.goto_prev()")
    vim.cmd("command! LspDiagNext lua vim.diagnostic.goto_next()")
    vim.cmd("command! LspDiagLine lua vim.diagnostic.open_float()")
    vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")

    if client.resolved_capabilities.document_formatting then
        vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    end
end

saga.init_lsp_saga()
local capabilities = protocol.make_client_capabilities()

package.path = package.path .. ";/home/ges/doc/src/github.com/kruhlmann/dotfiles/lib/.config/nvim/lua/plugins/config/lsp/?.lua"
require "tsserver"(on_attach, capabilities, buf_map)
require "pyright"(on_attach, capabilities, buf_map)
require "null_ls"(on_attach, capabilities, buf_map)
require "solargraph"(on_attach, capabilities, buf_map)
-- require "sumneko_lua"(on_attach, capabilities, buf_map)
