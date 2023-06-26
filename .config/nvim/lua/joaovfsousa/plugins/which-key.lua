local wk = require("which-key")
local wk_maps = require("joaovfsousa.keymaps.wk")

wk.register(wk_maps.nmaps, {
  prefix = "<leader>",
  mode = "n",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
})

wk.register(wk_maps.vmaps, {
  prefix = "<leader>",
  mode = "v",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
})
