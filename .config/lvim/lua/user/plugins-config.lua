reload('user.plugins.fine-cmdline')
reload('user.plugins.telescope')

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup {
  {
    name = "prettier",
    filetypes = { "typescript", "typescriptreact" },
  },
}
