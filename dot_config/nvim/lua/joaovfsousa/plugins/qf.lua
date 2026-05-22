return {
  {
    "Chaitanyabsprip/fastaction.nvim",
    name = "fastaction",
    enabled = true,
    ---@module "fastaction"
    ---@type FastActionConfig
    opts = {
      dismiss_keys = { "<esc>" },
      keys = "asdghjklqwertyuiop",
      priority = {
        typescript = {
          { pattern = "add import from", order = 1, key = "a" },
        },
      },
    },
  },
  {
    "kevinhwang91/nvim-bqf",
    opts = {
      preview = {
        winblend = 0,
      },
      auto_resize_height = true,
    },
  },
}
