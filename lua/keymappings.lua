-- Leader key
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true})
vim.g.mapleader = ' '

local wk = require('which-key')

--# Window movement
-- Tree
wk.register({
  ['<leader>'] = {
    e = {':NvimTreeToggle<CR>', 'Toggle tree view'},
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
  ['<TAB>'] = { ':bnext<CR>', 'Switch to next buffer' },
  ['<S-TAB>'] = { ':bnext<CR>', 'Switch to previous buffer' },
}, { mode = 'n', noremap = true, silent = true })


--# Text editing
-- Indentation
wk.register({
  v = {
    ['<'] = {'<gv', 'Snap left'},
    ['>'] = {'>gv', 'Snap right'},
  },
}, { mode = 'v', noremap = true, silent = true})

-- Move selected in visual mode
wk.register({
  x = {
    J = {":move '<-2<CR>gv-gv", 'Move selected line up'},
    K = {":move '>+1<CR>gv-gv", 'Move selected line down'},
  }
}, { mode = 'x', noremap = true, silent = true})

-- TAB complete
wk.register({
  ['<expr><TAB>'] = {'pumvisible() ? "\\<C-n>": "\\<TAB>"', 'Tab complete'},
}, { mode = 'x', noremap = true, silent = true })


--# Telescope
wk.register({
  -- Navigate through files and buffers
  f = {
    f = {':Telescope find_files<CR>', 'Find files'},
    g = {':Telescope live_grep<CR>', 'Find grep'},
    b = {':Telescope buffers<CR>', 'List buffers'},
    h = {':Telescope help_tags<CR>', 'Show help'},
  },
  -- Git utilities
  g = {
    b = {':Telescope git_branches<CR>', 'List branches'},
    g = {':LazyGit<CR>', 'Lazy git'},
  }
}, { mode = 'n', prefix='<leader>', noremap = true, silent = true })
