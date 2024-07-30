return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function()
      local wk = require("which-key")
      wk.setup({
        plugins = {
          presets = {
            operators = false,
            motions = false,
            text_objects = false,
            windows = false,
            nav = false,
            z = false,
          },
        },
      })

      local wkb_maps = require("joaovfsousa.keymaps.wkb")

      wk.register(wkb_maps.nmaps, {
        prefix = "<leader>",
        mode = "n",
        buffer = nil,
        silent = true,
        noremap = true,
        nowait = true,
      })

      wk.register(wkb_maps.vmaps, {
        prefix = "<leader>",
        mode = "v",
        buffer = nil,
        silent = true,
        noremap = true,
        nowait = true,
      })
    end,
  },
}
