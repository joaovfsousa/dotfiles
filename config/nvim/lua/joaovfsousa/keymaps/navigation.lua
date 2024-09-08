vim.keymap.set("n", "H", "^")
vim.keymap.set("v", "H", "^")
vim.keymap.set("n", "L", "g_")
vim.keymap.set("v", "L", "g_")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("v", "n", "nzz")

local open_buffer_menu = function()
  require("snipe").open_buffer_menu({ max_path_width = 3 })
end

vim.keymap.set("n", "mm", open_buffer_menu)
vim.keymap.set("v", "mm", open_buffer_menu)

vim.keymap.set("n", "<c-h>", "<cmd>NavigatorLeft<cr>")
vim.keymap.set("n", "<c-j>", "<cmd>NavigatorDown<cr>")
vim.keymap.set("n", "<c-k>", "<cmd>NavigatorUp<cr>")
vim.keymap.set("n", "<c-l>", "<cmd>NavigatorRight<cr>")
