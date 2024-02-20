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
vim.keymap.set("v", "?", 'y<ESC>:%s/<c-r>"/')
vim.keymap.set("n", "?", ":s/")

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

vim.keymap.set("n", "<c-m>", "<c-a>")
vim.keymap.set("v", "<c-m>", "<c-a>")

vim.keymap.set("n", "<c-n>", "<c-x>")
vim.keymap.set("v", "<c-n>", "<c-x>")

require("joaovfsousa.keymaps.lsp")
require("joaovfsousa.keymaps.navigation")
