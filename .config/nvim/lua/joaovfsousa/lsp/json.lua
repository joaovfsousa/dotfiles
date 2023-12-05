local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig")["jsonls"].setup({
  capabilities = capabilities,
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
    },
  },
})
