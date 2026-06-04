return {
  {
    {
      "nvim-mini/mini.comment",
      version = "*",
      opts = {
        mappings = {
          comment = "",
          comment_line = "<leader>/",
          comment_visual = "<leader>/",
          textobject = "",
        }
      },
    }
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
  },
}
