-- lvim.keys.normal_mode[":"] = "<cmd>FineCmdline<CR>"
-- lvim.keys.visual_mode[":"] = "<cmd>FineCmdline '<'><CR>"
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

lvim.keys.normal_mode["|"] = '\"_'
lvim.keys.visual_mode["|"] = '\"_'

lvim.keys.visual_mode["J"] = ":m '>+1<CR>gv=gv"
lvim.keys.visual_mode["K"] = ":m '<-2<CR>gv=gv"

lvim.builtin.which_key.mappings["f"] = {
  require("telescope.builtin").git_files,
  "Find Git File"
}

local telescope = require("telescope.builtin")

local openFindFiles = function()
  telescope.find_files({ hidden = true })
end

lvim.builtin.which_key.mappings["F"] = {
  name = "Find",
  f = {
    openFindFiles,
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
  p = {
    "<cmd>Telescope projects<CR>",
    "Projects"
  },
}

local jester = require("jester")

lvim.builtin.which_key.mappings["t"] = {
  name = "Jester",
  r = {
    jester.run,
    "Run nearest"
  },
  f = {
    jester.run_file,
    "Run file"
  },
  R = {
    jester.debug,
    "Debug nearest"
  },
  F = {
    jester.debug_file,
    "Debug file"
  },
  l = {
    jester.run_last,
    "Run last"
  },
  L = {
    jester.debug_last,
    "Debug last"
  }
}

local refactoring = require('refactoring')

lvim.builtin.which_key.mappings["r"] = {
  name = "Refactor",
  r = {
    refactoring.select_refactor,
    "Select"
  },
  v = {
    "<cmd>lua require('refactoring').refactor('Extract Variable')<CR>",
    "Extract Variable"
  },
  f = {
    "<cmd>lua require('refactoring').refactor('Extract Function')<CR>",
    "Extract function"
  }
}

lvim.builtin.which_key.vmappings["r"] = {
  name = "Refactor",
  r = {
    refactoring.select_refactor,
    "Select"
  },
  v = {
    "<cmd>lua require('refactoring').refactor('Extract Variable')<CR>",
    "Extract Variable"
  },
  f = {
    "<cmd>lua require('refactoring').refactor('Extract Function')<CR>",
    "Extract function"
  }
}

local fn = function()
  local utils = require "lvim.utils"
  local paths = {}
  local user_snippets = utils.join_paths(get_config_dir(), "snippets")
  if utils.is_directory(user_snippets) then
    paths[#paths + 1] = user_snippets
  end
  print(paths)
  print(get_runtime_dir())
end

lvim.keys.normal_mode['P'] = fn
