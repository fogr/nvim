vim.g.nvim_tree_auto_close = 1
require 'nvim-tree'.setup {
  filters = {
    custom = { '.git', 'node_modules' }
  },
  view = {
    width = 60,
  }
}
