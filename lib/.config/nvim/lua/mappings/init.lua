local map = vim.api.nvim_set_keymap
local cmd = vim.cmd
local g = vim.g
local opts = {noremap = true, silent = true}

g.mapleader = " "
g.maplocalleader = " "
map("n", "<Space>", "<Nop>", opts)

map('n', '<Up>', '<Nop>', {noremap = true})
map('n', '<Down>', '<Nop>', {noremap = true})
map('n', '<Left>', '<Nop>', {noremap = true})
map('n', '<Right>', '<Nop>', {noremap = true})
map('i', '<Up>', '<Nop>', {noremap = true})
map('i', '<Down>', '<Nop>', {noremap = true})
map('i', '<Left>', '<Nop>', {noremap = true})
map('i', '<Right>', '<Nop>', {noremap = true})
map('n', 'n', 'nzzzv', {noremap = false})
map('n', 'N', 'Nzzzv', {noremap = false})
map('n', '*', '*<C-O>', {noremap = true})
map('n', ';', ':', {noremap = true})
map('n', 'k', "v:count == 0 ? 'gk' : 'k'",
    {noremap = true, expr = true, silent = true})
map('n', 'j', "v:count == 0 ? 'gj' : 'j'",
    {noremap = true, expr = true, silent = true})
map('n', 'Y', 'y$', {noremap = true})

map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)

map("v", "<leader>/", "gc", {noremap = false})
map("n", "<leader>/", "gcc", {noremap = false})
map("n", "<leader>f", "<cmd>NvimTreeToggle<CR>", {noremap = true})
map("n", "<leader>p",
    [[<cmd>lua require("telescope.builtin").find_files()<cr>]], opts)
map("n", "<leader><space>",
    [[<cmd>lua require("telescope.builtin").buffers()<cr>]], opts)

map('n', '<leader>ld', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', '<leader>lD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
map('n', '<leader>lr', '<cmd>lua require("lspsaga.rename").rename()<CR>', opts)
map('n', '<leader>lR', '<cmd>lua require("lspsaga.provider").lsp_finder()<CR>',
    opts)
map('n', '<leader>li', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
map('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
map('n', '<leader>le',
    '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
map("n", "<leader>lq", "<cmd>LspTroubleToggle quickfix<cr>", opts)
map('n', '<leader>lN', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
map('n', '<leader>ln', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
map("n", "<leader>ls",
    [[<cmd>lua require("telescope.builtin").lsp_document_symbols()<cr>]], opts)
map('n', 'K', '<Cmd>lua require("lspsaga.hover").render_hover_doc()<CR>', opts)
map('n', '<C-k>',
    '<cmd>lua require("lspsaga.signaturehelp").signature_help()<CR>', opts)
map('i', '<C-k>',
    '<cmd>lua require("lspsaga.signaturehelp").signature_help()<CR>', opts)
map('n', '<leader>la',
    '<cmd>lua require("lspsaga.codeaction").code_action()<CR>', opts)
map('v', '<leader>la',
    ':<C-U>lua require("lspsaga.codeaction").range_code_action()<CR>', opts)
map('n', '<leader>le',
    '<cmd>lua require("lspsaga.diagnostic").show_line_diagnostics()<CR>', opts)

map("n", "<leader>ltf", ":TSLspOrganize<CR>", opts)
map("n", "<leader>ltr", ":TSLspRenameFile<CR>", opts)
map("n", "<leader>lti", ":TSLspImportAll<CR>", opts)

map("n", "<leader>tf",
    [[<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<cr>]],
    opts)
map("n", "<leader>tt", [[<cmd>lua require("telescope.builtin").tags()<cr>]],
    opts)
map("n", "<leader>t?", [[<cmd>lua require("telescope.builtin").oldfiles()<cr>]],
    opts)
map("n", "<leader>tg",
    [[<cmd>lua require("telescope.builtin").grep_string()<cr>]], opts)
map("n", "<leader>tp",
    [[<cmd>lua require("telescope.builtin").live_grep()<cr>]], opts)
map("n", "<leader>tl",
    [[<cmd>lua require("telescope.builtin").tags{ only_current_buffer = true }<cr>]],
    opts)
map("n", "<leader>tc",
    [[<cmd>lua require("telescope.builtin").git_commits()<cr>]], opts)
map("n", "<leader>tb",
    [[<cmd>lua require("telescope.builtin").git_branches()<cr>]], opts)
map("n", "<leader>ts",
    [[<cmd>lua require("telescope.builtin").git_status()<cr>]], opts)

map('n', '<leader>,', '<cmd>vsplit<CR>', opts)
map('n', '<leader>.', '<cmd>split<CR>', opts)
