local wk = require("which-key")
local s = require("snacks")

wk.add({
  {
    "<leader>g",
    group = "Git",
  },
  {
    "<leader>gg",
    s.lazygit.open,
    desc = "LazyGit",
  },
  {
    "<leader>gf",
    s.lazygit.log_file,
    desc = "LazyGit Current file",
  },
  {
    "<leader>gl",
    "<cmd>lua require 'gitsigns'.blame_line()<cr>",
    desc = "Line blame",
  },
  {
    "<leader>gb",
    "<cmd>lua require 'gitsigns'.blame()<cr>",
    desc = "File blame",
  },
  {
    "<leader>gi",
    "<cmd>lua vim.cmd(\"call committia#open('git')\")<cr>",
    desc = "Commitia",
  },
  {
    "<leader>gc",
    function()
      local actions =
          require("telescope._extensions.conventional_commits.actions")
      local picker =
          require("telescope._extensions.conventional_commits.picker")

      picker({
        action = actions.prompt,
        include_body_and_footer = true,
      })
    end,
    desc = "Commit",
  },
})
