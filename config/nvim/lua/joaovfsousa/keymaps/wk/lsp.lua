local wk = require("which-key")

wk.add({
  { "J", vim.diagnostic.open_float, desc = "Show line diagnostics" },
  { "K", vim.lsp.buf.hover, desc = "Show hover" },
})

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
    vim.diagnostic.goto_next,
    desc = "Next Diagnostic",
  },
  {
    "<leader>lk",
    vim.diagnostic.goto_prev,
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
    vim.diagnostic.setloclist,
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
