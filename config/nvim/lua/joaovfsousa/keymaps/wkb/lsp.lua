return {
  name = "LSP",
  a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
  i = {
    function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
    end,
    "Toggle Inlay Hints",
  },
  I = { "<cmd>LspInfo<cr>", "Info" },
  m = { "<cmd>Mason<cr>", "Mason Info" },
  j = {
    "<cmd>lua vim.diagnostic.goto_next()<cr>",
    "Next Diagnostic",
  },
  k = {
    "<cmd>lua vim.diagnostic.goto_prev()<cr>",
    "Prev Diagnostic",
  },
  r = {
    ":IncRename ",
    "Rename",
  },
  R = {
    function()
      return ":IncRename " .. vim.fn.expand("<cword>")
    end,
    "Rename selected",
    expr = true,
  },
}
