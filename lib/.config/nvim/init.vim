" Global configuration.
so ~/.config/nvim/includes/pluginlist.vim               " Basic vim settings.
so ~/.config/nvim/includes/basic.vim               " Basic vim settings.
so ~/.config/nvim/includes/wildmenu.vim            " Basic vim settings.
so ~/.config/nvim/includes/backup.vim              " Vim backup and swap files.
so ~/.config/nvim/includes/userfunc.vim            " User-defined functions.
so ~/.config/nvim/includes/binds.vim               " Key bindings.
so ~/.config/nvim/includes/ftypes.vim              " Non-traditional filetypes.
so ~/.config/nvim/includes/events.vim              " Vim event handling.
so ~/.config/nvim/includes/plugins.vim             " Plugin configuration.

" Filetype specific configuration.
so ~/.config/nvim/includes/lang/py.vim             " Python specific config.

" Custom syntax configuration.
so ~/.config/nvim/includes/syntax/pgn.vim          " PGN syntax highlighting.
so ~/.config/nvim/includes/syntax/vcard.vim        " VCard syntax highlighting.

" Language server configuration.
"luafile ~/.config/nvim/lua/lsp.lua
"luafile ~/.config/nvim/lua/tree_sit.lua
" so ~/.config/nvim/includes/statusline.vim          " Plugin configuration.
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    --disable = { "c", "rust" },  -- list of language that will be disabled
  },
}
EOF
