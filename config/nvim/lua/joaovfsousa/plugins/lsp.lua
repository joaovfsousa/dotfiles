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
          "eslint",
          "gopls",
          "jsonls",
          "lua_ls",
          "prettier",
          "tailwindcss",
          "ts_ls",
          "yamlls",
        },
      })

      vim.lsp.config("tailwindcss", {
        on_attach = function(_, bufnr)
          require("tailwindcss-colors").buf_attach(bufnr)
        end
      })

      local jsonls_capabilities = vim.lsp.protocol.make_client_capabilities()
      jsonls_capabilities.textDocument.completion.completionItem.snippetSupport =
          true

      vim.lsp.config("jsonls", {
        capabilities = jsonls_capabilities,
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
            format = {
              enable = false
            }
          },
        },
      })

      vim.lsp.config("yamlls", {
        settings = {
          yaml = {
            schemaStore = {
              -- You must disable built-in schemaStore support if you want to use
              -- this plugin and its advanced options like `ignore`.
              enable = false,
              -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
              url = "",
            },
            -- schemas = {
            --   kubernetes = "*.yaml",
            --   ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
            --   ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
            --   ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
            --   ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
            --   ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
            --   ["http://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
            --   ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
            --   ["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
            --   ["https://json.schemastore.org/gitlab-ci"] = "*gitlab-ci*.{yml,yaml}",
            --   ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] =
            --   "*api*.{yml,yaml}",
            --   ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] =
            --   "*docker-compose*.{yml,yaml}",
            --   ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] =
            --   "*flow*.{yml,yaml}",
            -- },
            schemas = require("schemastore").yaml.schemas()
          },
        },
      })

      vim.diagnostic.config({
        float = { border = "rounded" },
      })
    end,
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
    opts = {},
  },
}
