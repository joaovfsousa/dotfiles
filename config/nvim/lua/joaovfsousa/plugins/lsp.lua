return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "mason-lspconfig.nvim" },
  },
  {
    "williamboman/mason.nvim",
    opts = {},
    build = ":MasonUpdate",
    event = "User FileOpened",
    lazy = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
    event = "User FileOpened",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      local mason_lspconfig = require("mason-lspconfig")
      -- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
      -- Use lspconfig names
      mason_lspconfig.setup({
        automatic_installation = true,
        ensure_installed = {
          "cssls",
          "eslint",
          "gopls",
          "jsonls",
          "lua_ls",
          "omnisharp", --
          "prismals",
          "pylsp",
          "rust_analyzer",
          "tailwindcss",
          "volar",
          "yamlls",
        },
      })

      mason_lspconfig.setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end,
        ["tailwindcss"] = function()
          local on_attach = function(_, bufnr)
            require("tailwindcss-colors").buf_attach(bufnr)
          end
          require("lspconfig")["tailwindcss"].setup({
            on_attach = on_attach,
          })
        end,
      })

      vim.lsp.handlers["textDocument/hover"] =
        vim.lsp.with(vim.lsp.handlers.hover, {
          border = "rounded",
        })

      vim.lsp.handlers["textDocument/signatureHelp"] =
        vim.lsp.with(vim.lsp.handlers.signature_help, {
          border = "rounded",
        })

      vim.diagnostic.config({
        float = { border = "rounded" },
      })
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    lazy = true,
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
    config = function()
      local null_ls = require("null-ls")

      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

      null_ls.setup({
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ async = false })
              end,
            })
          end
        end,
      })
    end,
  },
  {

    "jayp0521/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    opts = {
      -- Available tools: https://github.com/jay-babu/mason-null-ls.nvim#available-null-ls-sources
      ensure_installed = {
        "stylua",
        "prettier",
        "goimports_reviser",
        "gofumpt",
        "yamlfmt",
      },
      automatic_setup = true,
      automatic_installation = true,
      handlers = {},
    },
  },
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
  { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
  {
    "smjonas/inc-rename.nvim",
    config = true,
  },
  {
    "Wansmer/symbol-usage.nvim",
    event = "BufReadPre",
    enabled = false,
    config = function()
      require("symbol-usage").setup()
    end,
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
      -- on_attach = function(client, bufnr)
      --   if client.server_capabilities.inlayHintProvider then
      --     vim.lsp.inlay_hint.enable(true, { bufnr })
      --   end
      -- end,
      settings = {
        separate_diagnostic_server = true,
        expose_as_code_action = "all",
        tsserver_file_preferences = {
          importModuleSpecifierPreference = "non-relative",
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all'
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHintsWhenTypeMatchesName = false,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayEnumMemberValueHints = false,
        },
      },
    },
  },
}
