-- Leader key
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true })
vim.g.mapleader = ' '

local wk = require('which-key')

wk.register({
  r = {
    r = { ':source $MYVIMRC<cr>', 'Reload neovim config' },
  }
}, { mode = 'n', prefix = '<leader>', noremap = true, silent = true })

--# Window movement
-- Tree
wk.register({
  ['<leader>'] = {
    e = { ':NvimTreeToggle<CR>', 'Toggle tree view' },
  }
}, { mode = 'n', noremap = true, silent = true })

-- Switch window
wk.register({
  h = { '<C-w>h', 'Switch to left window' },
  l = { '<C-w>l', 'Switch to right window' },
  j = { '<C-w>j', 'Switch to bottom window' },
  k = { '<C-w>k', 'Switch to top window' },
}, { prefix = 'C', mode = 'n', silent = true })

-- Switch tab
wk.register({
  ['<TAB>'] = { ':BufferLineCycleNext<CR>', 'Switch to next buffer' },
  ['<S-TAB>'] = { ':BufferLineCyclePrev<CR>', 'Switch to previous buffer' },
  Q = { ':Bdelete<CR>', 'Close current buffer' },
}, { mode = 'n', noremap = true, silent = true })


-- Text editing
wk.register({
  v = {
    name = "Indentation",
    ['<'] = { '<gv', 'Snap left' },
    ['>'] = { '>gv', 'Snap right' },
  },
}, { mode = 'v', noremap = true, silent = true })
wk.register({
  x = {
    name = "Move selected",
    J = { ":move '<-2<CR>gv-gv", 'Move selected line up' },
    K = { ":move '>+1<CR>gv-gv", 'Move selected line down' },
  }
}, { mode = 'x', noremap = true, silent = true })

-- TAB complete
wk.register({
  ['<expr><TAB>'] = { 'pumvisible() ? "\\<C-n>": "\\<TAB>"', 'Tab complete' },
}, { mode = 'x', noremap = true, silent = true })


wk.register({
  -- Telescope
  f = {
    name = "File",
    f = { ':Telescope find_files<CR>', 'Find files' },
    g = { ':Telescope live_grep<CR>', 'Find grep' },
    b = { ':Telescope buffers<CR>', 'List buffers' },
    h = { ':Telescope help_tags<CR>', 'Show help' },
    t = { ':Telescope current_buffer_fuzzy_find<CR>', 'Find in current buffer' },
    -- ranger
    e = { ':RnvimrToggle<CR>', 'Open ranger' },
  },
  -- Git
  g = {
    name = "Git",
    b = { ':Telescope git_branches<CR>', 'List branches' },
    g = { ':LazyGit<CR>', 'Lazy git' },
  },
  -- Debug
  b = {
    name = "Debug",
    c = { ':Telescope dap commands<CR>', 'DAP commands' },
    s = { ':Telescope dap configurations<CR>', 'DAP configurations' },
    l = { ':Telescope dap list_breakpoints<CR>', 'DAP breakpoints' },
    v = { ':Telescope dap variables<CR>', 'DAP variables' },
    f = { ':Telescope dap frames<CR>', 'DAP frames' },
  },
}, { mode = 'n', prefix = '<leader>', noremap = true, silent = true })
