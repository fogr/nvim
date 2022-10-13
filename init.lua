require('plugins')
require('settings')
require('lsp')
require('plugs-rc')
require('theme')
require('dap-rc')

require('utils')
require('keymappings')

require('au')

vim.lsp.handlers['textDocument/references'] = require('telescope.builtin').lsp_references

vim.cmd [[
  hi Folded guibg=#232b2d
  hi CursorLine guibg=#2C3639
]]
