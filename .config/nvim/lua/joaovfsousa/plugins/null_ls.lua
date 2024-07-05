local setup = function()
  if true then
    return
  end
  local null_ls = require("null-ls")

  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics

  null_ls.setup({
    sources = {
      formatting.gofumpt,
      formatting.goimports_reviser,
      formatting.prettierd,
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
