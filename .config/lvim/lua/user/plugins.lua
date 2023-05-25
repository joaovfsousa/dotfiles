lvim.plugins = {
  {
    "David-Kunz/jester"
  },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" }
    },
    config = function()
      require("refactoring").setup({})
    end
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add          = { text = '++' },
          change       = { text = 'MM' },
          delete       = { text = '__' },
          topdelete    = { text = '--' },
          changedelete = { text = '--' },
          untracked    = { text = '~~' },
        }
      })
    end
  },
  {
    "axelvc/template-string.nvim",
    config = function()
      require("template-string").setup({
        remove_template_string = true
      })
    end
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end
  },
  {
    "HiPhish/nvim-ts-rainbow2",
    config = function()
      require("nvim-treesitter.configs").setup {
        rainbow = {
          enable = true,
          query = "rainbow-parens",
          strategy = require("ts-rainbow").strategy.global,
        }
      }
    end
  },
  {
    "alanfortlink/blackjack.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "saifulapm/chartoggle.nvim",
  },
  {
    "rmagatti/goto-preview",
    config = function()
      require("goto-preview").setup()
    end
  },
  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("lsp_signature").setup({
        toggle_key = "<C-s>",
        hint_enable = true,
        toggle_key_flip_floatwin_setting = true,
      })
    end
  },
  {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
    end
  },
  {
    "jose-elias-alvarez/typescript.nvim",
    config = function()
      require("typescript").setup({})
    end
  },
  {
    "someone-stole-my-name/yaml-companion.nvim",
    dependencies = {
      { "neovim/nvim-lspconfig" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
    },
    config = function()
      require("telescope").load_extension("yaml_schema")
      local cfg = require("yaml-companion").setup()
      require("lspconfig")["yamlls"].setup(cfg)
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end
  },
  {
    "Weissle/persistent-breakpoints.nvim",
    config = function()
      require("persistent-breakpoints").setup({
        load_breakpoints_event = { "BufReadPost" }
      })
    end
  },
  {
    "AckslD/muren.nvim",
    config = true
  },
  {
    "rmagatti/auto-session",
    config = function()
      require('auto-session').setup()
    end
  }
}
