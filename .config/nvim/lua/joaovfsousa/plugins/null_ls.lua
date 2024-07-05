local setup = function()
  local null_ls = require("null-ls")

  local formatting = null_ls.builtins.formatting

  null_ls.setup({
    sources = {
      require("typescript.extensions.null-ls.code-actions"),
      formatting.gofumpt,
      formatting.goimports_reviser,
      formatting.prettierd,
      formatting.prettier,
      formatting.stylua,
      formatting.yamlfix,
    },
  })

  vim.cmd([[
    augroup format_on_save
    autocmd!
    autocmd BufWritePre * lua vim.lsp.buf.format({ async = false })
    augroup end
  ]])
end

return {
  setup = setup,
}
