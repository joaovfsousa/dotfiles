local icons = require("joaovfsousa.theme.icons")

return {
  {
    "LunarVim/lunar.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 10000,
    opts = {
      flavour = "mocha",
      default_integrations = true,
      integrations = {
        grug_far = true,
        mason = true,
        dadbod_ui = true,
        lsp_trouble = true,
        which_key = true,
      },
      custom_highlights = function(colors)
        return {
          BqfPreviewFloat = {
            bg = colors.crust,
          },
          BqfPreviewBorder = {
            bg = colors.crust,
          },
          BqfPreviewTitle = {
            bg = colors.crust,
            fg = colors.text,
          },
        }
      end,
    },
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
