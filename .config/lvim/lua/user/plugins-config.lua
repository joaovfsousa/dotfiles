reload('user.plugins.fine-cmdline')
reload('user.plugins.telescope')
reload('user.plugins.nvimtree')
reload('user.plugins.dap')

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup {
  {
    name = "prettier",
    filetypes = { "typescript", "typescriptreact" },
  },
}
