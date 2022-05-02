require('plugins')
require('settings')
require('lsp')
require('plugs-rc')
require('theme')
require('keymappings')
require('dap-rc')

vim.cmd [[
  autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()
]]
