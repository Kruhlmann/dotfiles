local g = vim.g

g.nvim_tree_side = "left"
g.nvim_tree_width = 35
g.nvim_tree_ignore = {".git", "node_modules", ".cache", "__pycache__"}
g.nvim_tree_auto_open = 0
g.nvim_tree_auto_close = 0
g.nvim_tree_quit_on_open = 0
g.nvim_tree_follow = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_hide_dotfiles = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_gitignore = 1
g.nvim_tree_root_folder_modifier = ":~"
g.nvim_tree_allow_resize = 1
g.nvim_tree_lsp_diagnostics = 1

g.nvim_tree_show_icons = {git = 1, folders = 1, files = 1}

g.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = {
        unstaged = "-",
        staged = "✓",
        unmerged = "",
        renamed = "~",
        untracked = "?",
        deleted = "",
        ignored = ""
    },
    folder = {
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
        symlink_open = ""
    },
    lsp = {hint = "", info = "", warning = "", error = ""}
}

require'nvim-tree'.setup {
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    ignore_ft_on_setup = {},
    auto_close = true,
    open_on_tab = false,
    update_to_buf_dir = {enable = true, auto_open = true},
    hijack_cursor = true,
    update_cwd = true,
    diagnostics = {
        enable = false,
        icons = {hint = "", info = "", warning = "", error = ""}
    },
    update_focused_file = {enable = false, update_cwd = false, ignore_list = {}},
    system_open = {cmd = nil, args = {}},

    view = {
        width = 35,
        height = 30,
        side = 'left',
        auto_resize = true,
        mappings = {custom_only = false, list = {}}
    }
}
