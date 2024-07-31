local wk = require("which-key")
local jester = require("jester")

wk.add({
  {
    "<leader>t",
    group = "Jester",
  },
  {
    "<leader>tr",
    jester.run,
    desc = "Run nearest",
  },
  {
    "<leader>tf",
    jester.run_file,
    desc = "Run file",
  },
  {
    "<leader>tR",
    jester.debug,
    desc = "Debug nearest",
  },
  {
    "<leader>tF",
    jester.debug_file,
    desc = "Debug file",
  },
  {
    "<leader>tl",
    jester.run_last,
    desc = "Run last",
  },
  {
    "<leader>tL",
    jester.debug_last,
    desc = "Debug last",
  },
})
