vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    local hl_groups = {
      "Normal",
      "SignColumn",
      "NormalNC",
      "TelescopeBorder",
      "NvimTreeNormal",
      "NvimTreeNormalNC",
      "EndOfBuffer",
      "MsgArea",
    }
    for _, name in ipairs(hl_groups) do
      vim.cmd(string.format("highlight %s ctermbg=none guibg=none", name))
    end

    vim.cmd([[hi LineNr guifg=#888888]])
    vim.cmd([[hi CursorLineNr guifg=#dddddd]])
  end,
})

vim.opt.fillchars = "eob: "

vim.cmd([[colorscheme lunar]])

-- Makes telescope background transparent
vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
