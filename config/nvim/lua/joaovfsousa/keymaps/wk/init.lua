require("joaovfsousa.keymaps.wk.find")
require("joaovfsousa.keymaps.wk.search")

local wk = require("which-key")

wk.add({
  {
    "<leader>c",
    "<cmd>BufferKill<cr>",
    desc = "Kill buffer",
  },
  {
    "<leader>e",
    "<cmd>NvimTreeToggle<cr>",
    desc = "Toggle NvimTree",
  },
  {
    "<leader>q",
    "<cmd>q<cr>",
    desc = "Close window",
  },
})
