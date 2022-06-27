require 'nvim-treesitter.configs'.setup {
  ensure_installed = 'all',
  ignore_install = { 'phpdoc' },
  highlight = {
    enable = true,
  }
}

vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
