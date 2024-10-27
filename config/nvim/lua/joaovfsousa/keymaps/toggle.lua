local wk = require("which-key")

local config = {
  diagnostic = vim.diagnostic.is_enabled(),
}

wk.add({
  {
    "<leader>x",
    group = "Toggle",
  },
  {
    mode = { "n", "v" },
    {
      "<leader>xd",
      function()
        if config.diagnostic then
          vim.diagnostic.enable(false)
        else
          vim.diagnostic.enable()
        end

        config.diagnostic = vim.diagnostic.is_enabled()
      end,
      desc = "SaR",
    },
  },
})
