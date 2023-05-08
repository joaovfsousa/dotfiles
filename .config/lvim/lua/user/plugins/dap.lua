local status_ok, dap = pcall(require, "dap")
if not status_ok then
  return
end

dap.active = true

dap.configurations.typescript = {
  {
    type = "node",
    name = "node attach",
    request = "attach",
    program = "${file}",
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = "inspector",
  }
}


local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")

dap.adapters.node = {
  type = "executable",
  command = "node",
  name = "node-debug",
  args = { mason_path .. "packages/node-debug2-adapter/out/src/nodeDebug.js" }
}
