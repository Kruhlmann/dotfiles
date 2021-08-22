local map = vim.api.nvim_set_keymap
local cmd = vim.cmd
local g = vim.g
local opts = { noremap=true, silent=true }

g.mapleader = " "
g.maplocalleader = " "
map("n", "<Space>", "<Nop>", opts)

map('n', '<Up>', '<Nop>', { noremap = true})
map('n', '<Down>', '<Nop>', { noremap = true})
map('n', '<Left>', '<Nop>', { noremap = true})
map('n', '<Right>', '<Nop>', { noremap = true})
map('i', '<Up>', '<Nop>', { noremap = true})
map('i', '<Down>', '<Nop>', { noremap = true})
map('i', '<Left>', '<Nop>', { noremap = true})
map('i', '<Right>', '<Nop>', { noremap = true})
map('n', 'n', 'nzzzv', { noremap = true})
map('n', 'N', 'Nzzzv', { noremap = true})
map('n', '*', '*<C-O>', { noremap = true})
map('n', ';', ':', { noremap = true})
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true})
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true})
map('n', 'Y', 'y$', { noremap = true})

map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)

map("n", "<leader>f", "<cmd>NvimTreeToggle<CR>", {noremap = true})
map("n", "<leader>p", [[<cmd>lua require("telescope.builtin").find_files()<cr>]], opts)
map("n", "<leader><space>", [[<cmd>lua require("telescope.builtin").buffers()<cr>]], opts)

map('n', '<leader>ld', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', '<leader>lD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
map('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
map('n', '<leader>lR', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
map('n', '<leader>li', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
map('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
map('n', '<leader>le', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
map("n", "<leader>lq", "<cmd>LspTroubleToggle quickfix<cr>", opts)
map('n', '<leader>lN', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
map('n', '<leader>ln', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
map("n", "<leader>ls", [[<cmd>lua require("telescope.builtin").lsp_document_symbols()<cr>]], opts)

map("n", "<leader>tf", [[<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<cr>]], opts)
map("n", "<leader>tt", [[<cmd>lua require("telescope.builtin").tags()<cr>]], opts)
map("n", "<leader>t?", [[<cmd>lua require("telescope.builtin").oldfiles()<cr>]], opts)
map("n", "<leader>tg", [[<cmd>lua require("telescope.builtin").grep_string()<cr>]], opts)
map("n", "<leader>tp", [[<cmd>lua require("telescope.builtin").live_grep()<cr>]], opts)
map("n", "<leader>tl", [[<cmd>lua require("telescope.builtin").tags{ only_current_buffer = true }<cr>]], opts)
map("n", "<leader>tc", [[<cmd>lua require("telescope.builtin").git_commits()<cr>]], opts)
map("n", "<leader>tb", [[<cmd>lua require("telescope.builtin").git_branches()<cr>]], opts)
map("n", "<leader>ts", [[<cmd>lua require("telescope.builtin").git_status()<cr>]], opts)

map('i', '<Esc>', 'pumvisible() ? "<C-e><Esc>" : "<Esc>"', { noremap = true, expr = true, silent = true})
map('i', '<C-c>', 'pumvisible() ? "<C-e><C-c>" : "<C-c>"', { noremap = true, expr = true, silent = true})
map('i', '<BS>', 'pumvisible() ? "<C-e><BS>"  : "<BS>"', { noremap = true, expr = true, silent = true})
map('i', '<CR>', 'pumvisible() ? (complete_info().selected == -1 ? "<C-e><CR>" : "<C-y>") : "<CR>"', { noremap = true, expr = true, silent = true})
map('i', '<Tab>', 'pumvisible() ? "<C-n>" : "<Tab>"', { noremap = true, expr = true, silent = true})
map('i', '<S-Tab>', 'pumvisible() ? "<C-p>" : "<BS>"', { noremap = true, expr = true, silent = true})
