require 'lsp.tsserver-rc'
require 'lsp.gopls-rc'
require 'lsp.lua-rc'
-- require 'lsp.golangci-lint-rc'
require 'lsp.dockerls-rc'
require 'lsp.bashls-rc'
require 'lsp.vscodels-rc'
require 'lsp.vuels-rc'

local nvim_lsp = require('lspconfig')
local wk = require('which-key')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local fn = function(func, api)
    api = api or 'lsp.buf'
    return ':lua vim.' .. api .. '.' .. func .. '()<cr>'
  end

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  wk.register({
    ['<leader>'] = {
      e = { ':NvimTreeToggle<CR>', 'Toggle tree view' },
    }
  }, { buffer = bufnr, mode = 'n', noremap = true, silent = true })

  wk.register({
    g = {
      name = 'Code navigation',
      D = { fn('declaration'), 'Go to declaration' },
      d = { fn('definition'), 'Go to definition' },
      i = { fn('implementation'), 'Go to implementation' },
      r = { fn('references'), 'Go to references' },
    },
    ['<leader>'] = {
      w = {
        name = 'Workspace',
        a = { fn('add_workspace_folder'), 'Add workspace folder' },
        r = { fn('remove_workspace_folder'), 'Remove workspace folder' },
        l = { fn('list_workspace_folders'), 'List workspace folders' },
        e = { ':NvimTreeFindFile<cr>', 'Show current file in tree' }
      },
      c = {
        name = 'Code',
        n = { fn('rename'), 'Rename' },
        a = { fn('code_action'), 'Code action' },
        s = { fn('signature_help'), 'Signature help' },
        f = { fn('format'), 'Format' },
      },
      l = {
        e = { fn('open_float', 'diagnostic'), 'Show line diagnostic' },
        -- l = { fn('setloclist', 'diagnostic'), 'Set loclist' },
        l = { ":lua require('telescope.builtin').diagnostics()<cr>", 'Show line diagnostic' },
        n = { fn('goto_next', 'diagnostic'), 'Next diagnostic' },
        p = { fn('goto_prev', 'diagnostic'), 'Previous diagnostic' },
      }
    },
    ['<C-h>'] = { fn('hover') },
  }, { mode = 'n', noremap = true, silent = true })

  -- highlight
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
    vim.api.nvim_clear_autocmds { buffer = bufnr, group = "lsp_document_highlight" }
    vim.api.nvim_create_autocmd("CursorHold", {
      callback = vim.lsp.buf.document_highlight,
      buffer = bufnr,
      group = "lsp_document_highlight",
      desc = "Document Highlight",
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
      callback = vim.lsp.buf.clear_references,
      buffer = bufnr,
      group = "lsp_document_highlight",
      desc = "Clear All the references",
    })
  end

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {
  "gopls",
  "tsserver",
  "sumneko_lua",
  "html",
  "cssls",
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 200,
    }
  }
end
