require('plugins')
require('settings')
require('lsp')
require('plugs-rc')
require('theme')
require('dap-rc')

require('utils')
require('keymappings')

-- TODO: remove all old vim.cmd to vim.api autocmd
vim.cmd [[
  autocmd BufWritePre * lua vim.lsp.buf.format()
]]

vim.lsp.handlers['textDocument/references'] = require('telescope.builtin').lsp_references

vim.cmd [[
  hi Folded guibg=#232b2d
  hi CursorLine guibg=#2C3639
]]
