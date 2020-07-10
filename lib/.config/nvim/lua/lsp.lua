local has_lsp, nvim_lsp = pcall(require, 'nvim_lsp')
local has_completion, completion = pcall(require, 'completion')
local has_diagnostic, diagnostic = pcall(require, 'diagnostic')
local has_status, lsp_status = pcall(require, 'lsp_status')

if not has_lsp then
    return
end

-- highlights
vim.fn.sign_define('LspDiagnosticsErrorSign', {
    text='✖ ' or 'E',
    texthl='LspDiagnosticsError',
    linehl='',
    numhl=''
})
vim.fn.sign_define('LspDiagnosticsWarningSign', {
    text='⚠' or 'W',
    texthl='LspDiagnosticsWarning',
    linehl='',
    numhl=''
})
vim.fn.sign_define('LspDiagnosticsInformationSign', {
    text='כֿ' or 'I',
    texthl='LspDiagnosticsInformation',
    linehl='',
    numhl=''
})
vim.fn.sign_define('LspDiagnosticsHintSign', {
    text='➤' or 'H',
    texthl='LspDiagnosticsHint',
    linehl='',
    numhl=''
})

local on_attach_vim = function(client, bufnr)
    local resolved_capabilities = client.resolved_capabilities

    if has_status then
        lsp_status.on_attach(client)
    end

    if has_diagnostic then
        diagnostic.on_attach()
    end

    if has_completion then
        completion.on_attach({
            sorter = 'alphabet',
            matcher = {'exact', 'fuzzy'}
        })
    end

    local opts = { noremap=true, silent=true }

    if resolved_capabilities.document_highlight then
        vim.api.nvim_command[[autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()]]
        vim.api.nvim_command[[autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()]]
        vim.api.nvim_command[[autocmd CursorMoved <buffer> lua vim.lsp.util.buf_clear_references()]]
    end
end

local servers = {
    {
        name = 'yamlls',
        config = {
          settings = {
            yaml = {
              schemas = {
                ['http://json.schemastore.org/github-workflow'] = '.github/workflows/*.{yml,yaml}',
                ['http://json.schemastore.org/github-action'] = '.github/action.{yml,yaml}',
                ['http://json.schemastore.org/prettierrc'] = '.prettierrc.{yml,yaml}',
                ['http://json.schemastore.org/gitlab-ci'] = '.gitlab-ci.{yml,yaml}',
                ['https://json.schemastore.org/pre-commit-config'] = '.pre-commit-config.{yml,yaml}'
              }
            }
          },
        }
    },
    {
        name = 'bashls'
    },
    {
        name = 'clangd'
    },
    {
        name = 'jedi_language_server'
    },
    {
        name = 'tsserver'
    },
    {
        name = 'vimls'
    },
    {
        name = 'solargraph'
    }
}

for _, lsp in ipairs(servers) do
  if lsp.config then
    lsp.config.on_attach = on_attach_vim
  else
    lsp.config = {
      on_attach = on_attach_vim
    }
  end

  nvim_lsp[lsp.name].setup(lsp.config)
end
