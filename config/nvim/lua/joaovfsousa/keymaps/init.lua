require("joaovfsousa.keymaps.debug")
require("joaovfsousa.keymaps.find")
require("joaovfsousa.keymaps.git")
require("joaovfsousa.keymaps.goto")
require("joaovfsousa.keymaps.lsp")
require("joaovfsousa.keymaps.navigation")
require("joaovfsousa.keymaps.refactoring")
require("joaovfsousa.keymaps.search")
require("joaovfsousa.keymaps.test")
require("joaovfsousa.keymaps.zen")

local wk = require("which-key")

wk.add({
  {
    "<leader>c",
    "<cmd>BufferKill<cr>",
    desc = "Kill buffer",
  },
  {
    "<leader>T",
    "<cmd>TextCaseOpenTelescope<cr>",
    desc = "Text case change",
  },
  {
    "<leader>C",
    "<cmd>ccl<cr>",
    desc = "Close quickfix window",
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

vim.keymap.set("n", ";", ":")
vim.keymap.set("v", ";", ":")

vim.keymap.set("n", "|", '"_')
vim.keymap.set("v", "|", '"_')

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Enter normal mode in terminal
vim.keymap.set("t", "<c-s>", [[<C-\><C-n>]])
vim.keymap.set("n", "<c-a>", "Nop")

vim.keymap.set("v", "/", 'y<ESC>/<c-r>"<CR><ESC>')
vim.keymap.set("v", "?", 'y<ESC>:%s/<c-r>"/')
vim.keymap.set("n", "?", ":s/")

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

vim.keymap.set("n", "<c-m>", "<c-a>")
vim.keymap.set("v", "<c-m>", "<c-a>")

vim.keymap.set("n", "<c-n>", "<c-x>")
vim.keymap.set("v", "<c-n>", "<c-x>")
