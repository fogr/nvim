local loadRunConfig = function(opts)
  return require('utils.run-config').convertRunConfig(opts)
end

vim.api.nvim_create_user_command('LoadRunConfig', loadRunConfig, { nargs = 1 })
