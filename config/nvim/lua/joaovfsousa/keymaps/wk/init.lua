require("joaovfsousa.keymaps.wk.debug")
require("joaovfsousa.keymaps.wk.find")
require("joaovfsousa.keymaps.wk.git")
require("joaovfsousa.keymaps.wk.goto")
require("joaovfsousa.keymaps.wk.lsp")
require("joaovfsousa.keymaps.wk.navigation")
require("joaovfsousa.keymaps.wk.refactoring")
require("joaovfsousa.keymaps.wk.search")
require("joaovfsousa.keymaps.wk.test")

local wk = require("which-key")

wk.add({
  {
    "<leader>c",
    "<cmd>BufferKill<cr>",
    desc = "Kill buffer",
  },
  {
    "<leader>C",
    "<cmd>pc<cr>",
    desc = "Kill preview windows",
  },
  {
    "<leader>D",
    "<cmd>DBUIToggle<cr>",
    desc = "Dadbod UI",
  },
  {
    "<leader>e",
    "<cmd>NvimTreeToggle<cr>",
    desc = "Toggle NvimTree",
  },
  {
    "<leader>q",
    "<cmd>q<cr>",
    desc = "Close window",
  },
  {
    "<leader>w",
    "<cmd>w<cr>",
    desc = "Save",
  },
  {
    "<leader>,",
    "<cmd>lua require('chartoggle').toggle(',')<CR>",
    desc = "Toggle comma",
  },
  {
    "<leader>;",
    "<cmd>lua require('chartoggle').toggle(';')<CR>",
    desc = "Toggle semicolon",
  },
  {
    "<leader>+",
    ":vertical resize +10<cr>",
    desc = "Resize +",
  },
  {
    "<leader>-",
    ":vertical resize -10<cr>",
    desc = "Resize -",
  },
  {
    mode = "n",
    {
      "<leader>/",
      "<Plug>(comment_toggle_linewise_current)",
      desc = "Comment toggle current line",
    },
  },
  {
    mode = "v",
    {
      "<leader>/",
      "<Plug>(comment_toggle_linewise_visual)",
      desc = "Comment toggle linewise (visual)",
    },
  },
})
