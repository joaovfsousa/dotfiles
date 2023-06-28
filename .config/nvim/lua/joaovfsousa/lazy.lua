local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    dependencies = { "mason-lspconfig.nvim" },
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
    build = ":MasonUpdate",
    event = "User FileOpened",
    lazy = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
    event = "User FileOpened",
    dependencies = "mason.nvim",
    config = function()
      local mason_lspconfig = require("mason-lspconfig")
      mason_lspconfig.setup({
        automatic_installation = true,
        ensure_installed = {
          "bashls",
          "cssls",
          "emmet_ls",
          "jsonls",
          "lua_ls",
          "prismals",
          "rust_analyzer",
          "tailwindcss",
          "tsserver",
          "vimls",
          "yamlls",
        },
      })

      mason_lspconfig.setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end,
        -- custom example
        -- ["rust_analyzer"] = function()
        --   require("rust-tools").setup({})
        -- end,
      })
    end,
  },
  { "jose-elias-alvarez/null-ls.nvim", lazy = true },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = true,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = true,
  },
  { "folke/neodev.nvim", opts = {}, lazy = true },
  {
    "LunarVim/lunar.nvim",
  },
  {
    "nvim-tree/nvim-tree.lua",
    event = "User DirOpened",
  },
  {
    "numToStr/Navigator.nvim",
    config = function()
      require("Navigator").setup()
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "User FileOpened",
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
    event = "User FileOpened",
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "User FileOpened",
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VimEnter",
  },
  {
    "dbinagi/nomodoro",
    config = true,
    event = "VimEnter",
  },
  {
    "rmagatti/auto-session",
    config = true,
  },
  {
    "David-Kunz/jester",
    event = "User FileOpened",
  },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
    config = true,
    event = "User FileOpened",
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "User FileOpened",
  },
  {
    "saifulapm/chartoggle.nvim",
    event = "User FileOpened",
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
  },
  {
    "hrsh7th/nvim-cmp",
  },
  {
    "hrsh7th/nvim-cmp",
    event = "VeryLazy",
    dependencies = {
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },
      { "hrsh7th/cmp-cmdline" },
      { "petertriho/cmp-git" },
      { "saadparwaiz1/cmp_luasnip" },
      { "L3MON4D3/LuaSnip" },
      {
        "zbirenbaum/copilot-cmp",
      },
    },
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
    end,
  },
  {
    "rmagatti/goto-preview",
    config = true,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "+" },
          change = { text = "M" },
          delete = { text = "_" },
          topdelete = { text = "-" },
          changedelete = { text = "-" },
          untracked = { text = "U" },
        },
      })
    end,
  },
  {
    "axelvc/template-string.nvim",
    config = function()
      require("template-string").setup({
        remove_template_string = true,
      })
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = true,
  },
  {
    "HiPhish/nvim-ts-rainbow2",
    config = function()
      require("nvim-treesitter.configs").setup({
        rainbow = {
          enable = true,
          query = "rainbow-parens",
          strategy = require("ts-rainbow").strategy.global,
        },
      })
    end,
  },
  {
    "alanfortlink/blackjack.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("lsp_signature").setup({
        toggle_key = "<C-s>",
        hint_enable = true,
        floating_window = false,
        toggle_key_flip_floatwin_setting = true,
        floating_window_off_y = -1,
      })
    end,
  },
  {
    "smjonas/inc-rename.nvim",
    config = true,
  },
  {
    "jose-elias-alvarez/typescript.nvim",
    config = true,
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
    config = true,
  },
  {
    "themaxmarchuk/tailwindcss-colors.nvim",
    dependencies = {
      { "neovim/nvim-lspconfig" },
    },
    config = function()
      local on_attach = function(_, bufnr)
        require("tailwindcss-colors").buf_attach(bufnr)
      end
      require("lspconfig")["tailwindcss"].setup({
        on_attach = on_attach,
      })
    end,
  },
  {
    "Pocco81/true-zen.nvim",
    config = function()
      require("true-zen").setup({
        modes = {
          ataraxis = {
            padding = {
              left = 90,
              right = 90,
            },
          },
        },
        integrations = {
          twilight = true,
        },
      })
    end,
  },
  {
    "folke/twilight.nvim",
    config = function()
      require("twilight").setup({
        dimming = {
          alpha = 0.5,
        },
      })
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "dbinagi/nomodoro",
    config = true,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup({
        min_window_height = 34,
        max_lines = 3,
        mode = "cursor",
        line_numbers = true,
      })
    end,
  },
  {
    dir = "~/Projects/nvim-plugins/docker.nvim",
    dependencies = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
    },
    config = true,
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "David-Kunz/jester",
      "Weissle/persistent-breakpoints.nvim",
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      require("joaovfsousa.plugins.dap.config")
    end,
  },
  {
    "RRethy/vim-illuminate",
    config = function()
      require("illuminate").configure()
    end,
  },
  { "lukas-reineke/indent-blankline.nvim" },
  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
})
