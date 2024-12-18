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
    dependencies = { "williamboman/mason.nvim", "b0o/schemastore.nvim" },
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
          "ts_ls",
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
        ["ts_ls"] = function()
          -- Should not init. It's being installed to be used by "pmizio/typescript-tools.nvim"
          -- in js projects
        end,
        ["jsonls"] = function()
          local capabilities = vim.lsp.protocol.make_client_capabilities()
          capabilities.textDocument.completion.completionItem.snippetSupport =
            true
          require("lspconfig").jsonls.setup({
            capabilities = capabilities,
            settings = {
              json = {
                schemas = require("schemastore").json.schemas(),
                validate = { enable = true },
              },
            },
          })
        end,
        ["yamlls"] = function()
          require("lspconfig").yamlls.setup({
            settings = {
              yaml = {
                schemaStore = {
                  -- You must disable built-in schemaStore support if you want to use
                  -- this plugin and its advanced options like `ignore`.
                  enable = false,
                  -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
                  url = "",
                },
                schemas = require("schemastore").yaml.schemas(),
              },
            },
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
        "goimports-reviser",
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
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
      on_attach = function(_, bufnr)
        local filename = vim.api.nvim_buf_get_name(bufnr)

        if not filename:match(".tsx$") then
          return
        end

        local wk = require("which-key")
        wk.add({
          {
            "gd",
            "<cmd>TSToolsGoToSourceDefinition<cr>",
            desc = "TS Goto definition",
            buffer = bufnr,
          },
        })
      end,
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
  {
    "leoluz/nvim-dap-go",
    opts = {},
  },
}
