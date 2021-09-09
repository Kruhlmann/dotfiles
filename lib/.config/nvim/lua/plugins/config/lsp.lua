local protocol = require('vim.lsp.protocol')
local lspconfig = require('lspconfig')
local null_ls = require("null-ls")

local sources = {
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
}

null_ls.config({sources = sources})

local saga = require("lspsaga")
local cmp = require('cmp')
-- setup nvim-cmp

saga.init_lsp_saga()
protocol.make_client_capabilities()

cmp.setup {
    snippet = {
        expand = function(args) require('luasnip').lsp_expand(args.body) end
    },
    sources = {{name = "nvim_lsp"}},
    mapping = {
        ['<S-Tab>'] = cmp.mapping.select_prev_item(), -- previous suggestion
        ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'}),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(), -- manual completion
        ['<C-e>'] = cmp.mapping.close(), -- close completion window
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = false
        })
    }
}

local capabilities = protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.documentationFormat = {
    'markdown', 'plaintext'
}
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport =
    true
capabilities.textDocument.completion.completionItem.tagSupport = {
    valueSet = {1}
}
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {'documentation', 'detail', 'additionalTextEdits'}
}

--- Document highlights
local function document_highlight()
    vim.api.nvim_exec([[
		hi LspReferenceRead  guibg=#121111 guifg=#FFFF00
		hi LspReferenceText  guibg=#121111 guifg=#FFFF00
		hi LspReferenceWrite guibg=#121111 guifg=#FFFF00
		augroup lsp_document_highlight
			autocmd!
			autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()
			autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
		augroup END
	]], false)
end

local on_attach_def = function(client)
    protocol.CompletionItemKind = {
        '', 'ƒ', 'ƒ', '', '識', '𝑋', '', '', '', '',
        '猪', '', '了', '', '﬌', '', '', '', '', '',
        '', '', '', '', ''
    }
    if client.resolved_capabilities.document_formatting then
        vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    end
end
local on_attach_null_ls =
    function(client, bufnr) on_attach_def(client, bufnr) end

local on_attach = function(client, bufnr)
    on_attach_def(client, bufnr)
    document_highlight()
    client.resolved_capabilities.document_formatting = false
end

local on_attach_ts = function(client)
    -- disable tsserver formatting if you plan on formatting via null-ls
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false

    local ts_utils = require("nvim-lsp-ts-utils")

    -- defaults
    ts_utils.setup {
        debug = false,
        disable_commands = false,
        enable_import_on_completion = true,

        -- import all
        import_all_timeout = 5000, -- ms
        import_all_priorities = {
            buffers = 4, -- loaded buffer names
            buffer_content = 3, -- loaded buffer content
            local_files = 2, -- git files or files with relative path markers
            same_file = 1 -- add to existing import statement
        },
        import_all_scan_buffers = 100,
        import_all_select_source = false,

        -- eslint
        eslint_enable_code_actions = true,
        eslint_enable_disable_comments = true,
        eslint_bin = "eslint_d",
        eslint_config_fallback = nil,
        eslint_enable_diagnostics = true,
        eslint_show_rule_id = true,

        -- formatting
        enable_formatting = true,
        formatter = "prettier_d_slim",
        formatter_config_fallback = nil,

        -- update imports on file move
        update_imports_on_move = true,
        require_confirmation_on_move = true,
        watch_dir = nil,

        -- filter diagnostics
        filter_out_diagnostics_by_severity = {},
        filter_out_diagnostics_by_code = {}
    }

    -- required to fix code action ranges and filter diagnostics
    ts_utils.setup_client(client)
end

local on_attach_no_hl = function(client, bufnr)
    on_attach_def(client, bufnr)
    client.resolved_capabilities.document_formatting = false
end

vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,
                 {underline = true, virtual_text = true})

local servers = {'pyright', 'rust_analyzer', 'bashls'}
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup({on_attach = on_attach, capabilities = capabilities})
end

lspconfig.jdtls.setup {
    root_dir = lspconfig.util.root_pattern(".git"),
    on_attach = on_attach,
    cmd = {"jdtls"},
    capabilities = capabilities
}

lspconfig["null-ls"].setup {
    on_attach = on_attach_null_ls,
    capabilities = capabilities
}

lspconfig.tsserver.setup {on_attach = on_attach_ts, capabilities = capabilities}

lspconfig.svelte.setup {
    on_attach = on_attach_no_hl,
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
