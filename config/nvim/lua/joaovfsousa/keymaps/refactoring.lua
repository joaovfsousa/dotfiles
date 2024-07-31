local wk = require("which-key")
local refactoring = require("refactoring")

wk.add({
  mode = { "n", "v" },
  {
    "<leader>r",
    refactoring.select_refactor,
    desc = "Refactor",
  },
})
