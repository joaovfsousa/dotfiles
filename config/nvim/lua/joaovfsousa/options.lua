vim.cmd("syntax enable")
vim.cmd("syntax on")

local options = {
  showtabline = 2,
  -- Search Settings
  smartcase = true, -- smart case
  ignorecase = true, -- ignore case in search patterns
  hlsearch = true, -- highlight all matches on previous search pattern/
  incsearch = true, -- Incremental search
  -- Apparence Settings
  termguicolors = true, -- set term gui colors (most terminals support this)
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  background = "dark",
  number = true, -- set numbered lines
  numberwidth = 4, -- set number column width to 2 {default 4}
  relativenumber = true, -- set relative numbered lines
  cmdheight = 1, -- more space in the neovim command line for displaying messages
  -- Clipboard Settings
  clipboard = "unnamedplus",
  -- Windows Settings
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  -- Indentation Settings
  smartindent = true, -- make indenting smarter again
  -- Tabs Settings
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  tabstop = 2, -- insert 4 spaces for a tab
  softtabstop = 2,
  expandtab = true, -- convert tabs to spaces
  -- Editor Settings
  fileencoding = "utf-8", -- the encoding written to a file
  scrolloff = 10, -- is one of my fav
  sidescrolloff = 8,
  -- Misc Settings
  backup = false, -- creates a backup file
  completeopt = { "menu", "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0, -- so that `` is visible in markdown files
  hidden = true, -- hidden buffer instead of just delete it
  mouse = "a", -- allow the mouse to be used in neovim
  pumheight = 10, -- pop up menu height
  showmatch = true,
  showmode = false, -- we don't need to see things like -- INSERT -- anymore
  swapfile = false, -- creates a swapfile
  undodir = os.getenv("HOME") .. "/.local/share/nvim/undodir", -- For the undo history
  undofile = true, -- enable persistent undo
  updatetime = 50, -- faster completion (4000ms default)
  timeoutlen = 500, -- time to wait for a mapped sequence to complete (in milliseconds)
  wrap = false, -- display lines as one long line
  foldmethod = "indent", -- indentention fold method
  foldlevelstart = 99, -- expand folds to 20 levels - for open at first opening of a file
  foldenable = false,
  spellsuggest = "best",
  list = false,
  guicursor = "",
  previewheight = 30,
}

vim.o.sessionoptions =
  "blank,folds,buffers,curdir,help,tabpages,winsize,winpos,terminal,localoptions"

vim.opt.shortmess:append("c")
vim.opt.iskeyword:append("-")
vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.db_ui_notification_width = 1

for key, value in pairs(options) do
  vim.opt[key] = value
end

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd("set relativenumber cursorline")
