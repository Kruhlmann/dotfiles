require("options.autocommands")
require("options.colorscheme")
require("options.common")
local vim = vim
local g = vim.g
local cmd = vim.cmd

WriteServerName = function()
    local file = assert(io.open("/tmp/current_nvim_servername", "w"))
    local servername = vim.v.servername;
    file:write(servername .. "\n");
    file:close()
end

cmd([[
  augroup vimtex_common
    autocmd!
    autocmd FileType tex lua WriteServerName()
]], false)


g.completion_enable_snippet = 'vim-vsnip'
g.markdown_syntax_conceal = 0
g.splitbelow = true

local bufferline = {
    icons = true,
    animation = true,
    semantic_letters = true,
    clickable = false,
    letters = 'asdfjkl;ghnmxcbziowerutyqpASDFJKLGHNMXCBZIOWERUTYQP',
    maximum_padding = 4
}

g.bufferline = bufferline
