local icons = require("joaovfsousa.theme.icons")

return {
  {
    "LunarVim/lunar.nvim",
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "User FileOpened",
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
  },
  {
    "dbinagi/nomodoro",
    config = true,
    event = "VimEnter",
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = true,
  },
  {
    "themaxmarchuk/tailwindcss-colors.nvim",
  },
  {
    "levouh/tint.nvim",
    enabled = true,
    config = function()
      require("tint").setup({
        tint = -20,
      })
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    tag = "v2.20.8",
    opts = {
      enabled = true,
      buftype_exclude = { "terminal", "nofile" },
      filetype_exclude = {
        "help",
        "startify",
        "dashboard",
        "lazy",
        "neogitstatus",
        "NvimTree",
        "Trouble",
        "text",
      },
      char = icons.ui.LineLeft,
      context_char = icons.ui.LineLeft,
      show_trailing_blankline_indent = false,
      show_first_indent_level = true,
      use_treesitter = true,
      show_current_context = true,
    },
  },
  {
    "RRethy/vim-illuminate",
    config = function()
      require("illuminate").configure()
    end,
  },
}
