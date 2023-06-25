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
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
    build = ":MasonUpdate",
  },
  {
    "williamboman/mason-lspconfig.nvim",
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
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {},
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  { "folke/neodev.nvim", opts = {} },
  {
    "LunarVim/lunar.nvim",
  },
  {
    "nvim-tree/nvim-tree.lua",
  },
})
