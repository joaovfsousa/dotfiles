local wk = require("which-key")

local config = require("joaovfsousa.config")

vim.keymap.set(
  "n",
  "J",
  vim.diagnostic.open_float,
  { desc = "Show line diagnostics" }
)
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover" })

wk.add({
  {
    "<leader>l",
    group = "LSP",
  },
  {
    "<leader>la",
    vim.lsp.buf.code_action,
    desc = "Code Action",
  },
  {
    "<leader>lf",
    function()
      vim.lsp.buf.format({ async = false })
    end,
    desc = "Format",
  },
  {
    "<leader>li",
    function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
    end,
    desc = "Toggle Inlay Hints",
  },
  {
    "<leader>lj",
    function()
      vim.diagnostic.goto_next({ severity = { min = config.severity } })
    end,
    desc = "Next Diagnostic",
  },
  {
    "<leader>lk",
    function()
      vim.diagnostic.goto_prev({ severity = { min = config.severity } })
    end,
    desc = "Prev Diagnostic",
  },
  {
    "<leader>ll",
    function()
      require("logsitter").log()
    end,
    desc = "Add log",
  },

  {
    "<leader>lq",
    function()
      vim.diagnostic.setloclist({ severity = config.severity })
    end,
    desc = "QuickFix",
  },
  {
    "<leader>lr",
    ":IncRename ",
    desc = "Rename",
  },
  {
    "<leader>lR",
    function()
      return ":IncRename " .. vim.fn.expand("<cword>")
    end,
    desc = "Rename selected",
    expr = true,
  },
})
