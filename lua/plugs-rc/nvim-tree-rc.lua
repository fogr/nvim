vim.g.nvim_tree_auto_close = 1
require 'nvim-tree'.setup {
  filters = {
    custom = { '.git', 'node_modules' }
  },
  open_on_setup = true,
  view = {
    width = 60,
  }
}
