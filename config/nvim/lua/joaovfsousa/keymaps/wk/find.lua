local telescope = require("telescope.builtin")

local openFindFiles = function()
  telescope.find_files({ hidden = true })
end

return {
  name = "Find",
  F = {
    "<cmd>Telescope frecency workpace='CWD'<cr>",
    "Frequent Files",
  },
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
  d = {
    telescope.diagnostics,
    "Diagnostics",
  },
  l = {
    function()
      telescope.resume({
        initial_mode = "normal",
      })
    end,
    "Resume last search",
  },
  T = {
    "<cmd>TodoTelescope<cr>",
    "Todo comments",
  },
  r = {
    "<cmd>lua require 'ssr'.open()<cr>",
    "Find and Replace",
  },
}
