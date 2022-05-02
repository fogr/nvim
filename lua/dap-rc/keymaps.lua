local wk = require('which-key')

local keymap = {
  d = {
    name = "Debug",
    R = { ":lua require'dap'.run_to_cursor()<cr>", "Run to Cursor" },
    E = { ":lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
    C = { ":lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "Conditional Breakpoint" },
    U = { ":lua require'dapui'.toggle()<cr>", "Toggle UI" },
    b = { ":lua require'dap'.step_back()<cr>", "Step Back" },
    c = { ":lua require'dap'.continue()<cr>", "Continue" },
    d = { ":lua require'dap'.disconnect()<cr>", "Disconnect" },
    e = { ":lua require'dapui'.eval()<cr>", "Evaluate" },
    g = { ":lua require'dap'.session()<cr>", "Get Session" },
    h = { ":lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
    S = { ":lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" },
    i = { ":lua require'dap'.step_into()<cr>", "Step Into" },
    o = { ":lua require'dap'.step_over()<cr>", "Step Over" },
    p = { ":lua require'dap'.pause.toggle()<cr>", "Pause" },
    q = { ":lua require'dap'.close()<cr>", "Quit" },
    r = { ":lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
    s = { ":lua require'dap'.continue()<cr>", "Start" },
    t = { ":lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
    x = { ":lua require'dap'.terminate()<cr>", "Terminate" },
    u = { ":lua require'dap'.step_out()<cr>", "Step Out" },
  },
}
wk.register(keymap, {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
})

local keymap_v = {
  name = "Debug",
  e = { ":lua require'dapui'.eval()<cr>", "Evaluate" },
}

wk.register(keymap_v, {
  mode = "v",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
})
