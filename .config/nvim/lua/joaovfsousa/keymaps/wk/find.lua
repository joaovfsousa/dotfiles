local telescope = require("telescope.builtin")

local openFindFiles = function()
  telescope.find_files({ hidden = true })
end

return {
  name = "Find",
  f = {
    "<cmd>Telescope git_files<cr>",
    "Git Files",
  },
  a = {
    openFindFiles,
    "Find Any File",
  },
  g = {
    telescope.live_grep,
    "Grep",
  },
  t = {
    require("joaovfsousa.plugins.telescope").toggle_layout_strategy,
    "Toggle layout",
  },
}
