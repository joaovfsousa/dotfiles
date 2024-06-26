return {
  name = "Git",
  g = {
    "<cmd>LazyGit<cr>",
    "LazyGit",
  },
  f = {
    "<cmd>LazyGitFilterCurrentFile<cr>",
    "LazyGit Current file",
  },
  j = {
    "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>",
    "Next Hunk",
  },
  k = {
    "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>",
    "Prev Hunk",
  },
  l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
  p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
  r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
  R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
  s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
  u = {
    "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
    "Undo Stage Hunk",
  },
  o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
  b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
  c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
  C = {
    "<cmd>Telescope git_bcommits<cr>",
    "Checkout commit(for current file)",
  },
  d = {
    "<cmd>Gitsigns diffthis HEAD<cr>",
    "Git Diff",
  },
  i = {
    "<cmd>lua vim.cmd(\"call committia#open('git')\")<cr>",
    "Commitia"
  },
  m = {
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
    "Commit",
  },
}
