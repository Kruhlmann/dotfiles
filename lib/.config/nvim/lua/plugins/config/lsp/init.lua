vim.g.coq_settings = {
    ["keymap.pre_select"] = true
}

local protocol = require('vim.lsp.protocol')
local lspconfig = require('lspconfig')
local coq = require('coq')
local saga = require("lspsaga")
local null_ls = require("null-ls")
local capabilities = protocol.make_client_capabilities()

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
    vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")    buf_map(bufnr, "n", "gd", ":LspDef<CR>")

    if client.resolved_capabilities.document_formatting then
        vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    end
end

saga.init_lsp_saga()
protocol.make_client_capabilities()

lspconfig.pyright.setup(coq.lsp_ensure_capabilities());
lspconfig.pyright.setup({on_attach = on_attach, capabilities = capabilities});
lspconfig.tsserver.setup(coq.lsp_ensure_capabilities());
lspconfig.tsserver.setup {
    init_options = require("nvim-lsp-ts-utils").init_options,
    on_attach = function(client, bufnr)
        local ts_utils = require("nvim-lsp-ts-utils")
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false

        ts_utils.setup({
            debug = false,
            disable_commands = false,
            enable_import_on_completion = false,
            import_all_timeout = 5000,
            import_all_priorities = {
                same_file = 1,
                local_files = 2,
                buffer_content = 3,
                buffers = 4,
            },
            import_all_scan_buffers = 100,
            import_all_select_source = false,
            always_organize_imports = true,
            filter_out_diagnostics_by_severity = {},
            filter_out_diagnostics_by_code = {},
            auto_inlay_hints = true,
            inlay_hints_highlight = "Comment",
            inlay_hints_priority = 200,
            inlay_hints_throttle = 150,
            inlay_hints_format = {
                Type = {},
                Parameter = {},
                Enum = {},
            },
            update_imports_on_move = true,
            require_confirmation_on_move = true,
            watch_dir = nil,
        })
        ts_utils.setup_client(client)

        buf_map(bufnr, "n", "ltf", ":TSLspOrganize<CR>")
        buf_map(bufnr, "n", "ltq", ":TSLspImportAll<CR>")
        buf_map(bufnr, "n", "ltr", ":TSLspRenameFile<CR>")
        buf_map(bufnr, "n", "lti", ":TSLspImportAll<CR>")
        local opts = { silent = true }
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts)
        on_attach(client, bufnr)
    end,
    capabilities = capabilities
}
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

-- local on_attach_null_ls = function(client, bufnr)
--     if client.resolved_capabilities.document_formatting then
--         vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
--     end
-- end

-- local null_ls = require("null-ls")

-- local sources = {
--     null_ls.builtins.formatting.black, null_ls.builtins.formatting.isort,
--     null_ls.builtins.formatting.pylint, null_ls.builtins.formatting.eslint_d,
--     null_ls.builtins.formatting.asmfmt,
--     null_ls.builtins.formatting.prettier_d_slim,
--     null_ls.builtins.formatting.clang_format,
--     null_ls.builtins.formatting.cmake_format,
--     null_ls.builtins.formatting.goimports, null_ls.builtins.formatting.golines,
--     null_ls.builtins.formatting.gofumpt, null_ls.builtins.formatting.json_tool,
--     null_ls.builtins.formatting.lua_format,
--     null_ls.builtins.formatting.nginx_beautifier,
--     null_ls.builtins.formatting.rufo, null_ls.builtins.formatting.shellcheck,
--     null_ls.builtins.formatting.shellharden,
--     null_ls.builtins.formatting.uncrustify,
--     null_ls.builtins.diagnostics.luacheck,
--     null_ls.builtins.diagnostics.write_good,
--     null_ls.builtins.diagnostics.misspell, null_ls.builtins.diagnostics.vint
-- }

-- null_ls.config({sources = sources})

-- local cmp = require("cmp")


-- protocol.make_client_capabilities()

-- cmp.setup {
--     snippet = {
--         expand = function(args) require('luasnip').lsp_expand(args.body) end
--     },
--     sources = {
--         {name = "nvim_lsp"},
--         {name = "cmp_tabnine"}
--     },
--     mapping = {
--         ['<S-Tab>'] = cmp.mapping.select_prev_item(), -- previous suggestion
--         ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'}),
--         ['<C-d>'] = cmp.mapping.scroll_docs(-4),
--         ['<C-f>'] = cmp.mapping.scroll_docs(4),
--         ['<C-Space>'] = cmp.mapping.complete(), -- manual completion
--         ['<C-e>'] = cmp.mapping.close(), -- close completion window
--         ['<CR>'] = cmp.mapping.confirm({
--             behavior = cmp.ConfirmBehavior.Insert,
--             select = false
--         })
--     }
-- }

-- local capabilities = protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
-- capabilities.textDocument.completion.completionItem.documentationFormat = {
--     'markdown', 'plaintext'
-- }
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- capabilities.textDocument.completion.completionItem.preselectSupport = true
-- capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
-- capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
-- capabilities.textDocument.completion.completionItem.deprecatedSupport = true
-- capabilities.textDocument.completion.completionItem.commitCharactersSupport =
--     true
-- capabilities.textDocument.completion.completionItem.tagSupport = {
--     valueSet = {1}
-- }
-- capabilities.textDocument.completion.completionItem.resolveSupport = {
--     properties = {'documentation', 'detail', 'additionalTextEdits'}
-- }

-- --- Document highlights
-- local function document_highlight()
--     vim.api.nvim_exec([[
-- 		hi LspReferenceRead  guibg=#121111 guifg=#FFFF00
-- 		hi LspReferenceText  guibg=#121111 guifg=#FFFF00
-- 		hi LspReferenceWrite guibg=#121111 guifg=#FFFF00
-- 		augroup lsp_document_highlight
-- 			autocmd!
-- 			autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()
-- 			autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
-- 		augroup END
-- 	]], false)
-- end

-- local on_attach_def = function(client)
--     protocol.CompletionItemKind = {
--         '', 'ƒ', 'ƒ', '', '識', '𝑋', '', '', '', '',
--         '猪', '', '了', '', '﬌', '', '', '', '', '',
--         '', '', '', '', ''
--     }
--     if client.resolved_capabilities.document_formatting then
--         vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
--     end
-- end
-- -- local on_attach_null_ls = function(client, bufnr)
-- --     if client.resolved_capabilities.document_formatting then
-- --         vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
-- --     end
-- -- end

-- local on_attach = function(client, bufnr)
--     on_attach_def(client)
--     document_highlight()
--     client.resolved_capabilities.document_formatting = false
-- end

-- local on_attach_ts = function(client)
--     client.resolved_capabilities.document_formatting = false
--     client.resolved_capabilities.document_range_formatting = false

--     local ts_utils = require("nvim-lsp-ts-utils")
--     ts_utils.setup {
--         debug = false,
--         disable_commands = false,
--         enable_import_on_completion = true,
--         import_all_timeout = 5000,
--         import_all_priorities = {
--             buffers = 4,
--             buffer_content = 3,
--             local_files = 2,
--             same_file = 1
--         },
--         import_all_scan_buffers = 100,
--         import_all_select_source = false,
--         eslint_enable_code_actions = true,
--         eslint_enable_disable_comments = true,
--         eslint_bin = "eslint_d",
--         eslint_config_fallback = nil,
--         eslint_enable_diagnostics = true,
--         eslint_show_rule_id = true,
--         enable_formatting = true,
--         formatter = "prettier_d_slim",
--         formatter_config_fallback = nil,
--         update_imports_on_move = true,
--         require_confirmation_on_move = false,
--         watch_dir = nil,
--         filter_out_diagnostics_by_severity = {},
--         filter_out_diagnostics_by_code = {}
--     }
--     ts_utils.setup_client(client)
-- end

-- local on_attach_no_hl = function(client, bufnr)
--     on_attach_def(client, bufnr)
--     client.resolved_capabilities.document_formatting = false
-- end

-- vim.lsp.handlers["textDocument/publishDiagnostics"] =
--     vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,
--                  {underline = true, virtual_text = true})

-- local servers = {'pyright', 'rust_analyzer', 'bashls', 'gopls'}
-- for _, lsp in ipairs(servers) do
--     lspconfig[lsp].setup({on_attach = on_attach, capabilities = capabilities})
-- end


-- -- lspconfig["null-ls"].setup {
-- --     on_attach = on_attach_null_ls,
-- --     capabilities = capabilities
-- -- }

-- lspconfig.svelte.setup {
--     on_attach = on_attach_no_hl,
--     capabilities = capabilities
-- }

-- lspconfig.tsserver.setup {on_attach = on_attach_ts, capabilities = capabilities}

-- lspconfig.solargraph.setup {
--     on_attach = on_attach_no_hl,
--     capabilities = capabilities,
--     settings = {solargraph = {autoformat = true, formatting = true}}
-- }

-- local luadev = require("lua-dev").setup {
--     library = {
--         vimruntime = true,
--         types = true,
--         plugins = {"nvim-treesitter", "plenary.nvim", "telescope.nvim"}
--     },
--     lspconfig = {
--         cmd = {"lua-language-server"},
--         on_attach = on_attach,
--         capabilities = capabilities
--     }
-- }
-- lspconfig.sumneko_lua.setup(luadev)
