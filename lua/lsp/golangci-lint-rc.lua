local nvim_lsp = require 'lspconfig'

require 'lspconfig'.golangci_lint_ls.setup {
  root_dir = nvim_lsp.util.root_pattern('go.mod', '.golangci.yaml', '.git')
}
