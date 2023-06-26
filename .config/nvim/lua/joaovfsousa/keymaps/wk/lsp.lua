return {
  name = "LSP",
  i = { "<cmd>LspInfo<cr>", "Info" },
  I = { "<cmd>Mason<cr>", "Mason Info" },
  j = {
    "<cmd>lua vim.diagnostic.goto_next()<cr>",
    "Next Diagnostic",
  },
  k = {
    "<cmd>lua vim.diagnostic.goto_prev()<cr>",
    "Prev Diagnostic",
  },
}
