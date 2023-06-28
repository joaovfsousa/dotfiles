local setup = function()
  local null_ls = require("null-ls")

  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics
  local code_actions = null_ls.builtins.code_actions

  null_ls.setup({
    sources = {
      formatting.prettierd,
      formatting.stylua,
      diagnostics.eslint_d,
      diagnostics.shellcheck,
      diagnostics.yamllint,
      diagnostics.eslint_d,
      formatting.yamlfix,
      code_actions.shellcheck,
      code_actions.eslint_d,
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
