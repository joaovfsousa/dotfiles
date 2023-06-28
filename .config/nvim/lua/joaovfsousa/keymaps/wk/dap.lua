return {
  name = "Debug",
  C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
  U = { "<cmd>lua require'dapui'.toggle({reset = true})<cr>", "Toggle UI" },
  b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
  c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
  d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
  g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
  i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
  o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
  p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
  q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
  r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
  s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
  u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
  t = {
    "<cmd>PBToggleBreakpoint<CR>",
    "Toggle breakpoint",
  },
  l = {
    "<cmd>lua require('dap').list_breakpoints(true)<cr>",
    "List breakpoints",
  },
  L = {
    "<cmd>lua require('dap').clear_breakpoints()<cr>",
    "Clear breakpoints",
  },
  w = {
    "<cmd>:require('dap.ui.widgets').hover()<cr>",
    "Widgets",
  },
}
