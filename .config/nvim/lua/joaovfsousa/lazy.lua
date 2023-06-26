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
    dependencies = { "mason-lspconfig.nvim", "nlsp-settings.nvim" },
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
    dependencies = { "nvim-lua/plenary.nvim", "telescope-fzf-native.nvim" },
    lazy = true
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
    setup = true,
  },
})
