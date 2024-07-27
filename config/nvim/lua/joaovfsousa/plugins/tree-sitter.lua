return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "hiphish/rainbow-delimiters.nvim",
    },
    config = function()
      local ts_config = require("nvim-treesitter.configs")
      ts_config.setup({
        modules = {},
        ensure_installed = {},
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
    "nvim-treesitter/nvim-treesitter-context",
    opts = {
      min_window_height = 34,
      max_lines = 3,
      mode = "cursor",
      line_numbers = true,
    },
  },
  {
    "gaelph/logsitter.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
}
