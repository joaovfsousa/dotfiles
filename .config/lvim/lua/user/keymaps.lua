lvim.keys.visual_mode[":"] = "<cmd>FineCmdline '<'><CR>"
lvim.keys.normal_mode[":"] = "<cmd>FineCmdline<CR>"
lvim.keys.visual_mode[";"] = "<cmd>FineCmdline '<'><CR>"
lvim.keys.normal_mode[";"] = "<cmd>FineCmdline<CR>"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

lvim.keys.normal_mode["m"] = "q"
lvim.keys.visual_mode["m"] = "q"

lvim.keys.normal_mode["q"] = "^"
lvim.keys.visual_mode["q"] = "^"
lvim.keys.normal_mode["t"] = "$"
lvim.keys.visual_mode["t"] = "$"

lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"

lvim.builtin.which_key.mappings["f"] = {
  require("telescope.builtin").git_files,
  "Find Git File"
}

lvim.builtin.which_key.mappings["F"] = {
  f = {
    require("telescope.builtin").find_files,
    "Find File"
  },
  g = {
    require("telescope.builtin").live_grep,
    "Grep"
  },
  t = {
    require('user.plugins.telescope').toggle_layout_strategy,
    "Toggle Vertical/Horizontal Layout"
  }
}
