vim.cmd [[
  autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()
]]

vim.cmd [[
  autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]]
