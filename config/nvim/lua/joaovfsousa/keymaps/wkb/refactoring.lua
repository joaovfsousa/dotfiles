local refactoring = require("refactoring")

return {
  name = "Refactor",
  r = {
    refactoring.select_refactor,
    "Select",
  },
  v = {
    "<cmd>lua require('refactoring').refactor('Extract Variable')<CR>",
    "Extract Variable",
  },
  f = {
    "<cmd>lua require('refactoring').refactor('Extract Function')<CR>",
    "Extract function",
  },
}
