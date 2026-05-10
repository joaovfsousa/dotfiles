return {
  {
    "https://github.com/rhysd/committia.vim",
    init = function()
      vim.g.committia_open_only_vim_starting = 0
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    init = function()
      vim.g.lazygit_floating_window_scaling_factor = 1
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPost",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "M" },
        delete = { text = "_" },
        topdelete = { text = "-" },
        changedelete = { text = "-" },
        untracked = { text = "U" },
      },
    },
  }
}
