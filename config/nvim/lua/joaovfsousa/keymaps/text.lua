local wk = require("which-key")

wk.add({
  {
    "<leader>Tc",
    "<cmd>TextCaseOpenTelescope<cr>",
    desc = "Text case change",
  },
  {
    "<leader>,",
    "<cmd>lua require('chartoggle').toggle(',')<CR>",
    desc = "Toggle comma",
  },
  {
    "<leader>;",
    "<cmd>lua require('chartoggle').toggle(';')<CR>",
    desc = "Toggle semicolon",
  },
})
