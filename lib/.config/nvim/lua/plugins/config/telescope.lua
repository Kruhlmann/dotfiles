-- Telescope
require("telescope").setup {
  defaults = {
    file_ignore_patterns = {"node_modules", "__sapper__"},
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
