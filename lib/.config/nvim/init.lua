-- reigster the progress callbak
local lsp = require'nvim_lsp'

local on_attach = function(client)
    require'lsp_status'.on_attach(client)
    require'diagnostic'.on_attach()
    require'completion'.on_attach({
        sorter = 'alphabet',
        matcher = {'exact', 'fuzzy'}
    })
end

--Language server protocol setup
--Python
lsp.pyls_ms.setup{
    on_attach = on_attach;
}

--Vim
lsp.vimls.setup{
    on_attach = on_attach;
}
