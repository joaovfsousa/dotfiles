local formatters = require("lvim.lsp.null-ls.formatters")
local linters = require("lvim.lsp.null-ls.linters")

lvim.lsp.null_ls.setup = {
  sources = require("typescript.extensions.null-ls.code-actions"),
}

formatters.setup({
  {
    name = "prettier",
    filetypes = { "typescript", "typescriptreact" },
  },
  {
    name = "stylua",
    filetypes = { "lua" },
  },
})

linters.setup({
  {
    name = "eslint",
    filetypes = { "typescriptreact" },
  },
  -- {
  -- 	name = "selene",
  -- 	filetypes = { "lua" },
  -- },
})
