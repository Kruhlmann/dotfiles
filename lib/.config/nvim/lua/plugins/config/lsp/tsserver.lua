local lspconfig = require('lspconfig')
local coq = require('coq')

local setup = function(on_attach, capabilities)
    lspconfig.tsserver.setup(coq.lsp_ensure_capabilities())
    lspconfig.tsserver.setup({on_attach = function(client, bufnr)
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
        on_attach(client, bufnr)
    end, capabilities = capabilities })
end

return setup
