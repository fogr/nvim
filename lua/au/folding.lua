vim.api.nvim_create_augroup("FoldViews", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  group = "FoldViews",
  desc = "Save fold view",
  pattern = "?*",
  callback = function()
    vim.api.nvim_command("mkview")
    vim.lsp.buf.format()
    vim.api.nvim_command("loadview")
  end
})
