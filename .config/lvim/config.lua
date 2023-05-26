reload('user.keymaps')
reload('user.options')
reload('user.plugins')
reload('user.plugins-config')

require('dap.ext.vscode').load_launchjs(nil, { node = { 'typescript', 'typescriptreact' } })

vim.api.nvim_create_autocmd({ "ColorScheme" }, {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#888888" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#dddddd" })
  end
})
