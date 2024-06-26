local setup = function()
  local null_ls = require("null-ls")

  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics
  local code_actions = null_ls.builtins.code_actions

  null_ls.setup({
    sources = {
      require("typescript.extensions.null-ls.code-actions"),
      formatting.prettierd,
      formatting.stylua,
      diagnostics.shellcheck,
      diagnostics.yamllint,
      formatting.yamlfix,
      code_actions.shellcheck,
      formatting.gofumpt,
      formatting.goimports_reviser,
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
