vim.keymap.set("n", ";", ":")
vim.keymap.set("v", ";", ":")

vim.keymap.set("n", "|", '"_')
vim.keymap.set("v", "|", '"_')

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "E", "<cmd>lua require('dapui').eval()<cr>")

vim.keymap.set("n", "<leader>zz", "<cmd>TZAtaraxis<cr><cr>")
vim.keymap.set("n", "<leader>zt", "<cmd>Twilight<cr>")

-- Enter normal mode in terminal
vim.keymap.set("t", "<c-s>", [[<C-\><C-n>]])
vim.keymap.set("n", "<c-a>", "Nop")

vim.keymap.set("v", "/", 'y<ESC>/<c-r>"<CR><ESC>')

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

require("joaovfsousa.keymaps.lsp")
require("joaovfsousa.keymaps.navigation")
