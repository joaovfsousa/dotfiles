require("jester").setup({
  path_to_jest_run = "npm test",
  dap = {
    type = 'node2',
    request = 'launch',
    cwd = vim.fn.getcwd(),
    args = { '--no-cache' },
    sourceMaps = true,
    protocol = 'inspector',
    skipFiles = { '<node_internals>/**/*.js' },
    port = 9229,
    disableOptimisticBPs = true,
    testTimeout = 30000
  }
})
