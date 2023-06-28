vim.keymap.set("n", "H", "^")
vim.keymap.set("v", "H", "^")
vim.keymap.set("n", "L", "g_")
vim.keymap.set("v", "L", "g_")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("v", "n", "nzz")

vim.keymap.set("n", "mm", "<cmd>BufferLinePick<CR>")
vim.keymap.set("v", "mm", "<cmd>BufferLinePick<CR>")

vim.keymap.set("n", "<c-h>", "<cmd>NavigatorLeft<cr>")
vim.keymap.set("n", "<c-j>", "<cmd>NavigatorDown<cr>")
vim.keymap.set("n", "<c-k>", "<cmd>NavigatorUp<cr>")
vim.keymap.set("n", "<c-l>", "<cmd>NavigatorRight<cr>")

vim.keymap.set("n", "<leader>+", ":vertical resize +10<cr>")
vim.keymap.set("n", "<leader>-", ":vertical resize -10<cr>")
