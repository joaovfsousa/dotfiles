js_ts_formatters = { "biome", "prettier", stop_after_first = true }
sh_formatters = { "shfmt", "beautysh", stop_after_first = true }

return {
  {
    "stevearc/conform.nvim",
    opts = {
      default_format_opts = {
        timeout_ms = 3000,
        async = false,
        quiet = false,
        lsp_format = "fallback",
      },
      format_on_save = {
        timeout_ms = 3000,
        lsp_format = "fallback",
      },
      formatters_by_ft = {
        bash = sh_formatters,
        javascript = js_ts_formatters,
        javascriptreact = js_ts_formatters,
        lua = { "stylua" },
        make = { "bake" },
        python = { "ruff_organize_imports", "ruff_format" },
        sh = sh_formatters,
        typescript = js_ts_formatters,
        typescriptreact = js_ts_formatters,
        zig = { "zigfmt" },
        zsh = sh_formatters,
      },
      formatters = {
        beautysh = function()
          local shiftwidth = vim.api.nvim_get_option_value(
            "shiftwidth",
            { buf = vim.api.nvim_get_current_buf() }
          )

          return {
            command = "beautysh",
            args = { "-i", tostring(shiftwidth), "$FILENAME" },
            stdin = false,
          }
        end,
      },
    },
  },
}
