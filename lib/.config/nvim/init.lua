--
-- 
-- Packer bootstrapping
--
--

local vim = vim
local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}
vim.loader.enable()

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "ellisonleao/gruvbox.nvim"
  use "RishabhRD/nvim-lsputils"
  use "tpope/vim-commentary"
  use 'norcalli/nvim-colorizer.lua'
  use "folke/which-key.nvim"
  use "ray-x/lsp_signature.nvim"
  use "tami5/lspsaga.nvim"
  use "jose-elias-alvarez/null-ls.nvim"
  use "neovim/nvim-lspconfig"
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use { "nvim-telescope/telescope.nvim", requires = {"nvim-lua/popup.nvim", "nvim-lua/plenary.nvim"} }
  use { "hoob3rt/lualine.nvim", requires = {"kyazdani42/nvim-web-devicons"} }
  use { "folke/trouble.nvim", requires = { "kyazdani42/nvim-web-devicons" } }
  use { "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } }
  use { 'ms-jpq/coq.artifacts', branch = 'artifacts' }
  use { 'ms-jpq/coq_nvim', branch = 'coq' }
  use { 'ms-jpq/coq.thirdparty', branch = '3p' }
  if packer_bootstrap then
    require('packer').sync()
  end
end)

--
-- 
-- Bindings
--
--

vim.g.mapleader = " "
vim.g.maplocalleader = " "
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
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", {noremap = true, expr = true, silent = true})
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", {noremap = true, expr = true, silent = true})
map('n', 'Y', 'y$', {noremap = true})
map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
map("v", "<leader>/", "gc", {noremap = false})
map("n", "<leader>/", "gcc", {noremap = false})
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", {noremap = true})
map("n", "<leader>p", [[<cmd>lua require("telescope.builtin").find_files()<cr>]], opts)
map("n", "<leader><space>", [[<cmd>lua require("telescope.builtin").buffers()<cr>]], opts)
map("n", "<leader>g", [[<cmd>lua require("telescope.builtin").live_grep()<cr>]], opts)
map('n', '<leader>ld', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', '<leader>lD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
map('n', '<leader>lr', '<cmd>lua require("lspsaga.rename").rename()<CR>', opts)
map('n', '<leader>lR', '<cmd>lua require("lspsaga.provider").lsp_finder()<CR>', opts)
map('n', '<leader>li', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
map('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
map('n', '<leader>le', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
map("n", "<leader>lq", "<cmd>LspTroubleToggle quickfix<cr>", opts)
map('n', '<leader>lN', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
map('n', '<leader>ln', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
map("n", "<leader>ls", [[<cmd>lua require("telescope.builtin").lsp_document_symbols()<cr>]], opts)
map('n', 'K', '<Cmd>lua require("lspsaga.hover").render_hover_doc()<CR>', opts)
map('n', '<C-k>', '<cmd>lua require("lspsaga.signaturehelp").signature_help()<CR>', opts)
map('i', '<C-k>', '<cmd>lua require("lspsaga.signaturehelp").signature_help()<CR>', opts)
map('n', '<leader>la', '<cmd>lua require("lspsaga.codeaction").code_action()<CR>', opts)
map('v', '<leader>la', ':<C-U>lua require("lspsaga.codeaction").range_code_action()<CR>', opts)
map('n', '<leader>le', '<cmd>lua require("lspsaga.diagnostic").show_line_diagnostics()<CR>', opts)
map("n", "<leader>tf", [[<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<cr>]], opts)
map("n", "<leader>tt", [[<cmd>lua require("telescope.builtin").tags()<cr>]], opts)
map("n", "<leader>t?", [[<cmd>lua require("telescope.builtin").oldfiles()<cr>]], opts)
map("n", "<leader>tg", [[<cmd>lua require("telescope.builtin").grep_string()<cr>]], opts)
map("n", "<leader>tp", [[<cmd>lua require("telescope.builtin").live_grep()<cr>]], opts)
map("n", "<leader>tl", [[<cmd>lua require("telescope.builtin").tags{ only_current_buffer = true }<cr>]], opts)
map("n", "<leader>tc", [[<cmd>lua require("telescope.builtin").git_commits()<cr>]], opts)
map("n", "<leader>tb", [[<cmd>lua require("telescope.builtin").git_branches()<cr>]], opts)
map("n", "<leader>ts", [[<cmd>lua require("telescope.builtin").git_status()<cr>]], opts)
map("v", "<leader>rr", [[<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>]], opts)
map('n', '<leader>,', '<cmd>vsplit<CR>', opts)
map('n', '<leader>.', '<cmd>split<CR>', opts)

--
--
-- Autocommands
--
--

vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    vim.cmd "hi link illuminatedWord LspReferenceText"
  end,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
  end,
})

vim.api.nvim_exec([[ autocmd BufNewFile,BufRead *.sol set filetype=solidity ]], false)

vim.cmd "autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif"

vim.api.nvim_create_autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd "tabdo wincmd ="
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "qf", "help", "man", "lspinfo", "spectre_panel", "lir" },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]]
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

--
--
-- Common
--
--

local colorscheme = "gruvbox"
vim.g.gruvbox_italic=1
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("Colorscheme " .. colorscheme .. " not found!")
end
local home_directory = vim.fn.expand('~')
vim.o.inccommand = "nosplit"
vim.o.shell = "zsh"
vim.o.number = true
vim.o.cursorline = true
vim.o.wrap = true
vim.o.syntax = "on"
vim.o.relativenumber = true
vim.o.hlsearch = true
vim.o.hidden = true
vim.o.mouse = "a"
vim.o.autoindent = true
vim.o.clipboard = "unnamedplus"
vim.o.history = 1000
vim.o.background = "dark"
vim.o.ruler = true
vim.o.smarttab = true
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.termguicolors = true
vim.o.updatetime = 250
vim.o.ffs = "unix,dos"
vim.o.cmdheight = 1
vim.o.showmatch = true
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.signcolumn = "yes"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.termguicolors = true
vim.o.completeopt = "menuone,noinsert,noselect"
vim.o.undodir = home_directory .. "/.cache/nvim/undo/"
vim.o.backupdir = home_directory .. "/.cache/nvim/backup/"
vim.o.directory = home_directory .. "/.cache/nvim/swap/"
vim.o.undofile = true
vim.o.backup = true
vim.o.swapfile = false
vim.g.indent_blankline_char = "┊"
vim.g.indent_blankline_filetype_exclude = {'help', 'packer'}
vim.g.indent_blankline_buftype_exclude = {'terminal', 'nofile'}
vim.g.indent_blankline_char_highlight = 'LineNr'
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true


--
--
-- Plugin configuration
--
--
require("mason").setup()
require("mason-lspconfig").setup()

require("nvim-treesitter.configs").setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  rainbow = {
    enable = true,
    extended_mode = true,
  },
}

require("telescope").setup {
  defaults = {
    file_ignore_patterns = {"node_modules", "__sapper__", "__pycache__", "venv"},
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-d>"] = false,
      },
    },
    generic_sorter =  require("telescope.sorters").get_fzy_sorter,
    file_sorter =  require("telescope.sorters").get_fzy_sorter,
  }
}

require('lualine').setup{
  options = {
    theme = "gruvbox"
  }
}

require('colorizer').setup({ "*" }, {
  RGB = true, -- #RGB hex codes
  RRGGBB = true, -- #RRGGBB hex codes
  names = false, -- "Name" codes like Blue oe blue
  RRGGBBAA = true, -- #RRGGBBAA hex codes
  rgb_fn = true, -- CSS rgb() and rgba() functions
  hsl_fn = true, -- CSS hsl() and hsla() functions
  css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
  css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
  -- Available modes: foreground, background, virtualtext
  mode = "background", -- Set the display mode.)
})

require('nvim-web-devicons').set_icon {
  sh = {
    icon = "",
    color = "#1DC123",
    cterm_color = "59",
    name = "Sh",
  },
  [".gitattributes"] = {
    icon = "",
    color = "#e24329",
    cterm_color = "59",
    name = "GitAttributes",
  },
  [".gitconfig"] = {
    icon = "",
    color = "#e24329",
    cterm_color = "59",
    name = "GitConfig",
  },
  [".gitignore"] = {
    icon = "",
    color = "#e24329",
    cterm_color = "59",
    name = "GitIgnore",
  },
  [".gitlab-ci.yml"] = {
    icon = "",
    color = "#e24329",
    cterm_color = "166",
    name = "GitlabCI",
  },
  [".gitmodules"] = {
    icon = "",
    color = "#e24329",
    cterm_color = "59",
    name = "GitModules",
  },
  ["diff"] = {
    icon = "",
    color = "#e24329",
    cterm_color = "59",
    name = "Diff",
  },
}

require("nvim-tree").setup()

--
--
-- Language Server Protocol
--
--

vim.g.coq_settings = {
	["auto_start"] = "shut-up",
	["keymap.pre_select"] = true,
	["clients.buffers.enabled"] = false,
	["clients.snippets.enabled"] = false,
	["clients.tmux.enabled"] = false,
	["clients.tree_sitter.enabled"] = true,
	["limits.completion_manual_timeout"] = 0.150,
}

local protocol = require("vim.lsp.protocol")
local saga = require("lspsaga")
local coq = require("coq")

saga.init_lsp_saga()

require("lspconfig").tsserver.setup(coq.lsp_ensure_capabilities())
require("lspconfig").lua_ls.setup(coq.lsp_ensure_capabilities())
require("lspconfig").rust_analyzer.setup(coq.lsp_ensure_capabilities())
