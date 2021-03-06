--vim.o.iskeyword = vim.o.iskeyword .. '-'
--vim.o.formatoptions = "-=cro"
vim.o.wrap = false

vim.o.encoding = 'utf-8'
vim.o.fileencoding = 'utf-8'

vim.o.ruler = true

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.smarttab = true
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true

vim.o.number = true
vim.o.relativenumber = true
vim.o.showmode = false

vim.t_Co = "256"

vim.o.clipboard = "unnamedplus"

vim.o.timeoutlen = 500

vim.o.cursorline = true

vim.wo.foldcolumn = '1'
vim.wo.foldlevel = 99
vim.wo.foldenable = true

vim.o.updatetime = 100

vim.o.list = true

vim.opt.listchars = {
  tab = '┊ ',
  extends = '⟩',
  precedes = '⟨',
  trail = '·',
  eol = '↲',
}

vim.o.ignorecase = true
