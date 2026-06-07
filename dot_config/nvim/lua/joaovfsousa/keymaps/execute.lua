local wk = require("which-key")

wk.add({
  {
    "<leader>X",
    group = "Execute",
  },
  {
    "<leader>Xf",
    "<cmd>source %<cr>",
    desc = "Execute file",
  },
  {
    "<leader>Xl",
    ":.lua<cr>",
    desc = "Execute line",
    mode = "n"
  },
  {
    "<leader>Xs",
    ":lua<cr>",
    desc = "Execute selection",
    mode = "v"
  }
})
