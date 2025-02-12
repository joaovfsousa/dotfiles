local wk = require("which-key")
local qf = require("joaovfsousa.utils.quickfix")

wk.add({
  {
    "<leader>b",
    group = "Quickfix",
  },
  {
    "<leader>bb",
    qf.toggle_qf,
    desc = "Toggle Quickfix",
  },
})
