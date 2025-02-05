return {
  {
    dir = "/Users/joaovfsousa/projects/nvim-plugins/fastaction.nvim",
    name = "fastaction",
    enabled = true,
    ---@module "fastaction"
    ---@type FastActionConfig
    opts = {
      dismiss_keys = { "<esc>" },
      keys = "asdfghjklqwertyuiop",
      priority = {
        typescript = {
          { pattern = "add import from", order = 1, key = "a" },
        },
      },
      format_right_section = function(item)
        return "[" .. vim.lsp.get_client_by_id(item.ctx.client_id).name .. "]"
      end,
    },
  },
}
