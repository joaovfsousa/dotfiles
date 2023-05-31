require("jester").setup({
  path_to_jest_run = "npm test",
  dap = {
    type = 'node2',
    request = 'launch',
    cwd = vim.fn.getcwd(),
    runtimeArgs = { '--inspect-brk', '$path_to_jest', '--testTimeout=120000', '--no-coverage', '-t', '$result', '--',
      '$file' },
    args = { '--no-cache' },
    sourceMaps = true,
    protocol = 'inspector',
    skipFiles = { '<node_internals>/**/*.js' },
    port = 9229,
    disableOptimisticBPs = true
  }
})
