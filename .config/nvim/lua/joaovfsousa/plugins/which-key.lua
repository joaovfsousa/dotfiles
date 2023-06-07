local wk = require("which-key")

wk.register({
  q = {
    "<cmd>q<cr>",
    "Quit"
  },
  f = {
    name = "Find",
    f = {
      "<cmd>Telescope git_files<cr>",
      "Git Files"
    },
    t = {
      require('joaovfsousa.plugins.telescope').toggle_layout_strategy,
      "Toggle layout"
    }
  }
}, { prefix = "<leader>" })
