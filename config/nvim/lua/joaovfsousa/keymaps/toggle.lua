local wk = require("which-key")

local config = require("joaovfsousa.config")

wk.add({
  {
    "<leader>x",
    group = "Toggle",
  },
  {
    "<leader>xd",
    group = "Diagnostics",
  },
  {
    "<leader>xl",
    group = "LSP",
  },
  {
    mode = { "n", "v" },
    {
      "<leader>xda",
      function()
        config.diagnostic = not config.diagnostic
        vim.diagnostic.enable(config.diagnostic)
      end,
      desc = "Diagnostic",
    },
    {
      "<leader>xdw",
      function()
        if config.severity == vim.diagnostic.severity.ERROR then
          config.severity = vim.diagnostic.severity.HINT
        else
          config.severity = vim.diagnostic.severity.ERROR
        end

        vim.diagnostic.config({
          float = {
            float = { border = "rounded" },
          },
          virtual_text = {
            severity = { min = config.severity },
          },
          signs = {
            severity = { min = config.severity },
          },
        })
      end,
      desc = "Diagnostic warnings",
    },
    {
      "<leader>xli",
      function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
      end,
      desc = "Toggle Inlay Hints",
    },
    {
      "<leader>xw",
      function()
        if config.textwidth == 0 then
          vim.cmd("set textwidth=80")
          config.textwidth = 80
        else
          vim.cmd("set textwidth=0")
          config.textwidth = 0
        end
      end,
      desc = "Toggle Text Wrap",
    },
  },
})
