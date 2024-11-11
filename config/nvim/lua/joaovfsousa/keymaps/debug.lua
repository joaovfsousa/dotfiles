local wk = require("which-key")
local dap = require("dap")
local dapui = require("dapui")

local function find_launch_json()
  local cwd = vim.fn.getcwd()
  local path = cwd .. "/.nvim/launch.json"

  local file = io.open(path, "r")

  if file ~= nil then
    io.close(file)
    return path
  end

  path = cwd .. "/.vscode/launch.json"

  file = io.open(path, "r")
  if file ~= nil then
    io.close(file)
    return path
  end

  return nil
end

local function start()
  require("dap.ext.vscode").load_launchjs(
    find_launch_json(),
    { node = { "typescript", "typescriptreact" } }
  )

  dap.continue()
end

wk.add({
  {
    "<leader>d",
    group = "Debug",
  },
  { "<leader>dg", dap.session, desc = "Get Session" },
  { "<leader>dS", start, desc = "Start" },
  { "<leader>dp", dap.pause, desc = "Pause" },
  { "<leader>dc", dap.continue, desc = "Continue" },
  { "<leader>dd", dap.disconnect, desc = "Disconnect" },
  { "<leader>dq", dap.terminate, desc = "Quit(Terminate)" },
  {
    "<leader>ds",
    group = "Step",
  },
  { "<leader>dsb", dap.step_back, desc = "Step Back" },
  { "<leader>dsi", dap.step_into, desc = "Step Into" },
  { "<leader>dsu", dap.step_out, desc = "Step Out" },
  { "<leader>dso", dap.step_over, desc = "Step Over" },
  {
    "<leader>du",
    function()
      dapui.toggle({ reset = true })
    end,
    desc = "Toggle UI",
  },
  { "<leader>dC", dap.run_to_cursor, desc = "Run To Cursor" },
  { "<leader>dr", dap.repl.toggle, desc = "Toggle Repl" },
  { "<leader>de", dapui.eval, desc = "Eval Hover" },
  { "<leader>db", dap.toggle_breakpoint, desc = "Toggle Breakpoint" },
  {
    "<leader>dB",
    group = "Breakpoint",
  },
  {
    "<leader>dBc",
    function()
      dap.set_breakpoint(vim.fn.input("[Condition] > "))
    end,
    desc = "Conditional Breakpoint",
  },
  {
    "<leader>dBl",
    function()
      dap.set_breakpoint(nil, nil, vim.fn.input("[Message] > "))
    end,
    desc = "Log Point",
  },
  {
    "<leader>dBd",
    dap.clear_breakpoints,
    desc = "Clear breakpoints",
  },
})
