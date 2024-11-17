local wk = require("which-key")

local config = require("joaovfsousa.config")

wk.add({
  {
    "<leader>x",
    group = "Toggle",
  },
  {
    mode = { "n", "v" },
    {
      "<leader>xd",
      function()
        config.diagnostic = not config.diagnostic
        vim.diagnostic.enable(config.diagnostic)
      end,
      desc = "Diagnostic",
    },
    {
      "<leader>xw",
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
      "<leader>xi",
      function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
      end,
      desc = "Toggle Inlay Hints",
    },
  },
})
