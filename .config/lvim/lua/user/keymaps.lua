lvim.keys.normal_mode[";"] = ":"
lvim.keys.visual_mode[";"] = ":"

lvim.keys.normal_mode["m"] = "q"
lvim.keys.visual_mode["m"] = "q"
lvim.keys.normal_mode["M"] = "Q"
lvim.keys.visual_mode["M"] = "Q"

lvim.keys.normal_mode["H"] = "^"
lvim.keys.visual_mode["H"] = "^"
lvim.keys.normal_mode["L"] = "g_"
lvim.keys.visual_mode["L"] = "g_"

lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"
lvim.keys.normal_mode["n"] = "nzz"
lvim.keys.visual_mode["n"] = "nzz"

lvim.keys.normal_mode["mm"] = "<cmd>BufferLinePick<CR>"
lvim.keys.visual_mode["mm"] = "<cmd>BufferLinePick<CR>"

lvim.keys.normal_mode["|"] = '"_'
lvim.keys.visual_mode["|"] = '"_'

lvim.keys.visual_mode["J"] = ":m '>+1<CR>gv=gv"
lvim.keys.visual_mode["K"] = ":m '<-2<CR>gv=gv"
lvim.keys.visual_mode["<"] = "<gv"
lvim.keys.visual_mode[">"] = ">gv"

lvim.keys.normal_mode["J"] = "<cmd>lua vim.diagnostic.open_float()<cr>"
lvim.keys.normal_mode["E"] = "<cmd>lua require('dapui').eval()<cr>"

lvim.keys.normal_mode["<leader>zz"] = "<cmd>TZAtaraxis<cr><cr>"
lvim.keys.normal_mode["<leader>zt"] = "<cmd>Twilight<cr>"

lvim.keys.normal_mode["<c-h>"] = "<cmd>NavigatorLeft<cr>"
lvim.keys.normal_mode["<c-j>"] = "<cmd>NavigatorDown<cr>"
lvim.keys.normal_mode["<c-k>"] = "<cmd>NavigatorUp<cr>"
lvim.keys.normal_mode["<c-l>"] = "<cmd>NavigatorRight<cr>"
lvim.keys.normal_mode["<c-a>"] = "Nop"

vim.keymap.set("t", "<c-s>", [[<C-\><C-n>]])
vim.keymap.set("i", "<esc>j", "Nop")

lvim.builtin.which_key.mappings["f"] = {
  require("telescope.builtin").git_files,
  "Find Git File",
}

local telescope = require("telescope.builtin")

local openFindFiles = function()
  telescope.find_files({ hidden = true })
end

lvim.builtin.which_key.mappings["f"] = {
  name = "Find",
  f = {
    "<cmd>Telescope git_files<CR>",
    "Git files",
  },
  a = {
    openFindFiles,
    "Find Any File",
  },
  g = {
    telescope.live_grep,
    "Grep",
  },
  t = {
    require("user.plugins.telescope").toggle_layout_strategy,
    "Toggle Vertical/Horizontal Layout",
  },
  b = {
    "<cmd>Telescope buffers<CR>",
    "Buffers",
  },
  p = {
    "<cmd>Telescope projects<CR>",
    "Projects",
  },
  s = {
    require("yaml-companion").open_ui_select,
    "Select schema",
  },
  r = {
    ":MurenToggle<CR>",
    "Replace",
  },
}

local jester = require("jester")

lvim.builtin.which_key.mappings["t"] = {
  name = "Jester",
  r = {
    jester.run,
    "Run nearest",
  },
  f = {
    jester.run_file,
    "Run file",
  },
  R = {
    jester.debug,
    "Debug nearest",
  },
  F = {
    jester.debug_file,
    "Debug file",
  },
  l = {
    jester.run_last,
    "Run last",
  },
  L = {
    jester.debug_last,
    "Debug last",
  },
}

local refactoring = require("refactoring")

lvim.builtin.which_key.mappings["r"] = {
  name = "Refactor",
  r = {
    refactoring.select_refactor,
    "Select",
  },
  v = {
    "<cmd>lua require('refactoring').refactor('Extract Variable')<CR>",
    "Extract Variable",
  },
  f = {
    "<cmd>lua require('refactoring').refactor('Extract Function')<CR>",
    "Extract function",
  },
}

lvim.builtin.which_key.vmappings["r"] = {
  name = "Refactor",
  r = {
    refactoring.select_refactor,
    "Select",
  },
  v = {
    "<cmd>lua require('refactoring').refactor('Extract Variable')<CR>",
    "Extract Variable",
  },
  f = {
    "<cmd>lua require('refactoring').refactor('Extract Function')<CR>",
    "Extract function",
  },
}

lvim.builtin.which_key.mappings[","] = {
  "<cmd>lua require('chartoggle').toggle(',')<CR>",
  "Toggle comma",
}

lvim.builtin.which_key.vmappings[","] = {
  "<cmd>lua require('chartoggle').toggle(',')<CR>",
  "Toggle comma",
}

lvim.builtin.which_key.mappings[";"] = {
  "<cmd>lua require('chartoggle').toggle(';')<CR>",
  "Toggle semicolon",
}

lvim.builtin.which_key.vmappings[";"] = {
  "<cmd>lua require('chartoggle').toggle(';')<CR>",
  "Toggle semicolon",
}

lvim.keys.normal_mode["gt"] = {
  "<cmd>lua vim.lsp.buf.type_definition()<cr>",
  name = "Goto type definition",
}

lvim.keys.normal_mode["gpd"] = {
  "<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
  name = "Preview definition",
}
lvim.keys.normal_mode["gpt"] = {
  "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>",
  name = "Preview type definition",
}
lvim.keys.normal_mode["gpi"] = {
  "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
  name = "Preview implementation",
}
lvim.keys.normal_mode["gpr"] = {
  "<cmd>lua require('goto-preview').goto_preview_references()<CR>",
  name = "Preview references",
}
lvim.keys.normal_mode["gP"] = {
  "<cmd>lua require('goto-preview').close_all_win()<CR>",
  name = "Close preview",
}

lvim.builtin.which_key.mappings["l"]["r"] = {
  ":IncRename ",
  "Rename",
}

lvim.builtin.which_key.mappings["dt"] = {
  "<cmd>PBToggleBreakpoint<CR>",
  "Toggle breakpoint",
}

lvim.builtin.which_key.mappings["dl"] = {
  "<cmd>lua require('dap').list_breakpoints(true)<cr>",
  "List breakpoints",
}

lvim.builtin.which_key.mappings["dL"] = {
  "<cmd>lua require('dap').clear_breakpoints()<cr>",
  "Clear breakpoints",
}

lvim.builtin.which_key.mappings["m"] = {
  ":Telescope buffers<CR>",
  "Navigate buffers",
}

lvim.builtin.which_key.vmappings["m"] = {
  ":Telescope buffers<CR>",
  "Navigate buffers",
}
