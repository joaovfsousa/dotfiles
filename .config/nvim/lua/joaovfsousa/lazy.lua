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
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "hiphish/rainbow-delimiters.nvim",
    },
    build = ":TSUpdateSync",
    config = function()
      local ts_config = require("nvim-treesitter.configs")
      ts_config.setup({
        sync_install = false,
        auto_install = true,
        ignore_install = { "phpdoc" },
        highlight = {
          enable = true,
          disable = { "css" },
          additional_vim_regex_highlighting = false,
        },
        autopairs = {
          enable = true,
        },
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
          config = {
            -- Languages that have a single comment style
            typescript = "// %s",
            css = "/* %s */",
            scss = "/* %s */",
            html = "<!-- %s -->",
            svelte = "<!-- %s -->",
            vue = "<!-- %s -->",
            json = "",
          },
        },
        indent = { enable = true, disable = { "yaml", "python" } },
        textobjects = {
          swap = {
            enable = false,
          },
          select = {
            enable = false,
          },
        },
        textsubjects = {
          enable = false,
          keymaps = { ["."] = "textsubjects-smart", [";"] = "textsubjects-big" },
        },
        playground = {
          enable = false,
          disable = {},
          updatetime = 25,
          persist_queries = false,
          keybindings = {
            toggle_query_editor = "o",
            toggle_hl_groups = "i",
            toggle_injected_languages = "t",
            toggle_anonymous_nodes = "a",
            toggle_language_display = "I",
            focus_language = "f",
            unfocus_language = "F",
            update = "R",
            goto_node = "<cr>",
            show_help = "?",
          },
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
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
          "astro",
          "bashls",
          "cssls",
          "emmet_ls",
          "jsonls",
          "eslint",
          "lua_ls",
          "omnisharp",
          "prismals",
          "pylsp",
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
  { "jose-elias-alvarez/null-ls.nvim",     lazy = true },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function()
      local wk = require("which-key")
      wk.setup({
        plugins = {
          presets = {
            operators = false,
            motions = false,
            text_objects = false,
            windows = false,
            nav = false,
            z = false,
          },
        },
      })
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = true,
  },
  {
    "folke/neodev.nvim",
    config = function()
      require("neodev").setup()
    end,
  },
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
      require("Navigator").setup({
        auto_save = "all",
        disable_on_zoom = true,
      })
    end,
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
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
    event = { "InsertEnter", "CmdlineEnter" },
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
    event = "InsertEnter",
    config = function()
      require("copilot_cmp").setup()
    end,
  },
  {
    "rmagatti/goto-preview",
    event = "User FileOpened",
    config = true,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "User FileOpened",
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
    event = "User FileOpened",
    config = true,
  },
  {
    "someone-stole-my-name/yaml-companion.nvim",
    dependencies = {
      { "neovim/nvim-lspconfig" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
      { "b0o/schemastore.nvim" },
    },
    config = function()
      require("telescope").load_extension("yaml_schema")
      local cfg = require("yaml-companion").setup()
      require("lspconfig")["yamlls"].setup({
        settings = {
          yaml = {
            hover = true,
            completion = true,
            validate = true,
            schemaStore = {
              enable = true,
              url = "https://www.schemastore.org/api/json/catalog.json",
            },
            schemas = require("schemastore").yaml.schemas(),
          },
        },
      })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-treesitter.configs").setup({
        autotag = {
          enable = true,
          enable_rename = true,
          enable_close = true,
          enable_close_on_slash = true,
          filetypes = {
            "html",
            "xml",
            "javascriptreact",
            "typescriptreact",
            "tsx",
          },
        },
      })
    end,
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
    "mfussenegger/nvim-dap",
    dependencies = {
      "David-Kunz/jester",
      "Weissle/persistent-breakpoints.nvim",
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
    },
  },
  {
    "RRethy/vim-illuminate",
    config = function()
      require("illuminate").configure()
    end,
  },
  { "lukas-reineke/indent-blankline.nvim", tag = "v2.20.8" },
  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require("telescope").load_extension("frecency")
    end,
    dependencies = { "kkharji/sqlite.lua" },
  },
  {
    "anuvyklack/fold-preview.nvim",
    dependencies = "anuvyklack/keymap-amend.nvim",
    config = function()
      require("fold-preview").setup({})
    end,
  },
  {
    "chentoast/marks.nvim",
    config = true,
  },
  {
    "nvimdev/hlsearch.nvim",
    event = "BufRead",
    config = function()
      require("hlsearch").setup()
    end,
  },
  {
    "gaelph/logsitter.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  {
    "prochri/telescope-all-recent.nvim",
    config = function()
      require("telescope-all-recent").setup({})
    end,
    dependencies = { "kkharji/sqlite.lua" },
  },
  {
    "leafOfTree/vim-matchtag",
    enabled = true,
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
    "cshuaimin/ssr.nvim",
    config = function()
      require("ssr").setup({
        border = "rounded",
        min_width = 50,
        min_height = 5,
        max_width = 120,
        max_height = 25,
        adjust_window = true,
        keymaps = {
          close = "q",
          next_match = "n",
          prev_match = "N",
          replace_confirm = "<cr>",
          replace_all = "<leader><cr>",
        },
      })
    end,
  },
  {
    "Wansmer/symbol-usage.nvim",
    event = "BufReadPre",
    enabled = false,
    config = function()
      require("symbol-usage").setup()
    end,
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    dir = "~/Projects/nvim-plugins/docker.nvim",
    dependencies = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
    },
    enabled = false,
    config = true,
    lazy = false,
  },
  {
    dir = "~/Projects/nvim-plugins/telescope-cc.nvim",
    config = function()
      local telescope = require("telescope")
      telescope.load_extension("conventional_commits")
    end,
    enabled = false,
    lazy = false,
  },
})
