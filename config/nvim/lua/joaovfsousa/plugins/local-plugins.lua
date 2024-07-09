return {
  {
    dir = "~/projects/nvim-plugins/telescope-cc.nvim",
    config = function()
      local telescope = require("telescope")
      telescope.load_extension("conventional_commits")
    end,
    enabled = false,
    lazy = false,
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
  },
}
