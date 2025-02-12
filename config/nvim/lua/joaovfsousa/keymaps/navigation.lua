vim.keymap.set("n", "H", "^")
vim.keymap.set("v", "H", "^")
vim.keymap.set("n", "L", "g_")
vim.keymap.set("v", "L", "g_")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("v", "n", "nzz")

vim.keymap.set("n", "mm", "<cmd>BufferLinePick<cr>")
vim.keymap.set("v", "mm", "<cmd>BufferLinePick<cr>")

local qf = require("joaovfsousa.utils.quickfix")

vim.keymap.set({ "n", "v" }, "<leader>mm", qf.buffers, {
  desc = "List buffers",
})
