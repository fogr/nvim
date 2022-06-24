require 'lsp.tsserver-rc'
require 'lsp.gopls-rc'

local nvim_lsp = require('lspconfig')
local wk = require('which-key')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  local fn = function(func, api)
    api = api or 'buf'
    return ':lua vim.lsp.buf.' .. func .. '()<cr>'
  end

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  wk.register({
    ['<leader>'] = {
      e = {':NvimTreeToggle<CR>', 'Toggle tree view'},
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
      },
      c = {
        name = 'Code',
        n = { fn('rename'), 'Rename' },
        a = { fn('code_action'), 'Code action'},
        s = { fn('signature_help'), 'Signature help' },
        f = { fn('formatting'), 'Formatting'},
      },
      l = {
        e = { fn('show_line_diagnostics', 'diagnostic'), 'Show line diagnostic'},
        l = { fn('set_loclist', 'diagnostic'), 'Set loclist'},
        n = { fn('goto_next', 'diagnostic'), 'Next diagnostic' },
        p = { fn('goto_prev', 'diagnostic'), 'Previous diagnostic' },
      }
    },
    ['<C-h>'] = { fn('hover')},
  }, { mode = 'n', noremap = true, silent = true })
  -- buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  -- buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  -- buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  -- buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  -- buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  -- buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  -- buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "gopls", "tsserver" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
