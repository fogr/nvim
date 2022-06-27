require('plugins')
require('settings')
require('lsp')
require('plugs-rc')
require('theme')
require('keymappings')
require('dap-rc')

vim.cmd [[
  autocmd BufWritePre * lua vim.lsp.buf.format()
]]

vim.lsp.handlers['textDocument/references'] = require('telescope.builtin').lsp_references

-- vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
--   vim.lsp.diagnostic.on_publish_diagnostics,
--   {
--     underline = false,
--     virtual_text = false,
--     update_in_insert = false
--   }
-- )
--

vim.cmd [[
  hi Folded guibg=Black
]]
