local formatters = require("lvim.lsp.null-ls.formatters")

lvim.lsp.null_ls.setup = {
  sources = require("typescript.extensions.null-ls.code-actions")
}

formatters.setup {
  {
    name = "prettier",
    filetypes = { "typescript", "typescriptreact" },
  },
}
