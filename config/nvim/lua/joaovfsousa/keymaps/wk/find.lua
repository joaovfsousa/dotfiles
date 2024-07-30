local wk = require("which-key")
local telescope = require("telescope.builtin")
local us = require("joaovfsousa.utils.selection")

wk.add({
  mode = { "n", "v" },
  {
    "<leader>f",
    group = "Find",
  },
  {
    "<leader>ff",
    function()
      telescope.git_files()
    end,
    desc = "Git Files",
  },
  {
    "<leader>T",
    "<cmd>TodoTelescope<cr>",
    desc = "Todo comments",
  },
  {
    "<leader>fa",
    function()
      telescope.find_files({ hidden = true })
    end,
    desc = "Find Any File",
  },
  {
    "<leader>fl",
    function()
      telescope.resume({
        initial_mode = "normal",
      })
    end,
    desc = "Resume last search",
  },
  {
    "<leader>fh",
    function()
      require("memento").toggle()
    end,
    desc = "File History",
  },
  {
    "<leader>ft",
    function()
      telescope.treesitter({ default_text = "function " })
    end,
    desc = "Buffer functions",
  },
  {
    "<leader>fM",
    telescope.man_pages,
    desc = "Man Pages",
  },
  {
    "<leader>fm",
    telescope.help_tags,
    desc = "Nvim Help",
  },
  {
    mode = { "n" },
    {
      "<leader>fg",
      telescope.live_grep,
      desc = "Grep",
    },
  },
  {
    mode = { "v" },
    {
      "<leader>fg",
      function()
        local selection = us.get_visual_selection()
        telescope.live_grep({
          initial_mode = "normal",
          default_text = selection,
        })
      end,
      desc = "Grep",
    },
  },
})
