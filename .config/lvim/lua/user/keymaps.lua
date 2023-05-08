lvim.keys.normal_mode[":"] = "<cmd>FineCmdline<CR>"
lvim.keys.visual_mode[":"] = "<cmd>FineCmdline '<'><CR>"
lvim.keys.normal_mode[";"] = "<cmd>FineCmdline<CR>"
lvim.keys.visual_mode[";"] = "<cmd>FineCmdline '<'><CR>"

lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

lvim.keys.normal_mode["m"] = "q"
lvim.keys.visual_mode["m"] = "q"
lvim.keys.normal_mode["M"] = "Q"
lvim.keys.visual_mode["M"] = "Q"

lvim.keys.normal_mode["q"] = "^"
lvim.keys.visual_mode["q"] = "^"
lvim.keys.normal_mode["t"] = "g_"
lvim.keys.visual_mode["t"] = "g_"

lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"
lvim.keys.normal_mode["n"] = 'nzz'
lvim.keys.visual_mode["n"] = 'nzz'

lvim.keys.normal_mode["mm"] = "<cmd>BufferLinePick<CR>"
lvim.keys.visual_mode["mm"] = "<cmd>BufferLinePick<CR>"


lvim.keys.normal_mode["dd"] = '\"_dd'
lvim.keys.visual_mode["dd"] = '\"_dd'
lvim.keys.normal_mode["d"] = '\"_d'
lvim.keys.visual_mode["d"] = '\"_d'

lvim.keys.normal_mode["x"] = 'd'
lvim.keys.visual_mode["x"] = 'd'
lvim.keys.normal_mode["xx"] = 'dd'
lvim.keys.visual_mode["xx"] = 'dd'

lvim.keys.visual_mode["J"] = ":m '>+1<CR>gv=gv"
lvim.keys.visual_mode["K"] = ":m '<-2<CR>gv=gv"

lvim.builtin.which_key.mappings["f"] = {
  require("telescope.builtin").git_files,
  "Find Git File"
}

local telescope = require("telescope.builtin")

lvim.builtin.which_key.mappings["F"] = {
  f = {
    telescope.find_files,
    "Find File"
  },
  g = {
    telescope.live_grep,
    "Grep"
  },
  t = {
    require('user.plugins.telescope').toggle_layout_strategy,
    "Toggle Vertical/Horizontal Layout"
  },
  b = {
    "<cmd>Telescope buffers<CR>",
    "Buffers"
  },
}
