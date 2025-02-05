return {
  {
    dir = "/Users/joaovfsousa/projects/nvim-plugins/fastaction.nvim",
    name = "fastaction",
    enabled = true,
    ---@type FastActionConfig
    opts = {
      dismiss_keys = { "<esc>" },
      keys = "asdfghjklqwertyuiop",
      priority = {
        typescript = {
          { pattern = "add import from", order = 1 },
        },
      },
      format_item = function(item)
        return item.action.title
          .. " ["
          .. vim.lsp.get_client_by_id(item.ctx.client_id).name
          .. "]"
      end,
    },
  },
}
