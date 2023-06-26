local find_maps = require("joaovfsousa.keymaps.wk.find")
local lsp_maps = require("joaovfsousa.keymaps.wk.lsp")
local bufferline = require("bufferline")
local jester_maps = require("joaovfsousa.keymaps.wk.jester")
local refactoring_maps = require("joaovfsousa.keymaps.wk.refactoring")

---@param num integer
---@return function
local function navigate_to(num)
  return function()
    bufferline.go_to(num, true)
  end
end

local nmaps = {
  l = lsp_maps,
  f = find_maps,
  t = jester_maps,
  r = refactoring_maps,
  q = {
    "<cmd>q<cr>",
    "Quit",
  },
  e = {
    "<cmd>NvimTreeToggle<cr>",
    "File Explorer",
  },
  c = {
    "<cmd>BufferKill<cr>",
    "Close buffer",
  },
  P = {
    "<cmd>Lazy<cr>",
    "Plugins",
  },
  h = { "<cmd>nohlsearch<CR>", "No Highlight" },
  ["/"] = {
    "<Plug>(comment_toggle_linewise_current)",
    "Comment toggle current line",
  },
  [","] = {
    "<cmd>lua require('chartoggle').toggle(',')<CR>",
    "Toggle comma",
  }
}

local vmaps = {
  ["/"] = {
    "<Plug>(comment_toggle_linewise_visual)",
    "Comment toggle linewise (visual)",
  },
}

for i = 1, 10 do
  nmaps[tostring(i)] = {
    navigate_to(i),
    "Go to buffer " .. i,
  }
end

return {
  nmaps = nmaps,
  vmaps = vmaps,
}

-- local refactoring = require("refactoring")

-- lvim.builtin.which_key.mappings["r"] = {
--   name = "Refactor",
--   r = {
--     refactoring.select_refactor,
--     "Select",
--   },
--   v = {
--     "<cmd>lua require('refactoring').refactor('Extract Variable')<CR>",
--     "Extract Variable",
--   },
--   f = {
--     "<cmd>lua require('refactoring').refactor('Extract Function')<CR>",
--     "Extract function",
--   },
-- }

-- lvim.builtin.which_key.vmappings["r"] = {
--   name = "Refactor",
--   r = {
--     refactoring.select_refactor,
--     "Select",
--   },
--   v = {
--     "<cmd>lua require('refactoring').refactor('Extract Variable')<CR>",
--     "Extract Variable",
--   },
--   f = {
--     "<cmd>lua require('refactoring').refactor('Extract Function')<CR>",
--     "Extract function",
--   },
-- }

-- lvim.builtin.which_key.mappings[","] = {
--   "<cmd>lua require('chartoggle').toggle(',')<CR>",
--   "Toggle comma",
-- }

-- lvim.builtin.which_key.vmappings[","] = {
--   "<cmd>lua require('chartoggle').toggle(',')<CR>",
--   "Toggle comma",
-- }

-- lvim.builtin.which_key.mappings[";"] = {
--   "<cmd>lua require('chartoggle').toggle(';')<CR>",
--   "Toggle semicolon",
-- }

-- lvim.builtin.which_key.vmappings[";"] = {
--   "<cmd>lua require('chartoggle').toggle(';')<CR>",
--   "Toggle semicolon",
-- }

-- lvim.keys.normal_mode["gt"] = {
--   "<cmd>lua vim.lsp.buf.type_definition()<cr>",
--   name = "Goto type definition",
-- }

-- lvim.keys.normal_mode["gpd"] = {
--   "<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
--   name = "Preview definition",
-- }
-- lvim.keys.normal_mode["gpt"] = {
--   "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>",
--   name = "Preview type definition",
-- }
-- lvim.keys.normal_mode["gpi"] = {
--   "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
--   name = "Preview implementation",
-- }
-- lvim.keys.normal_mode["gpr"] = {
--   "<cmd>lua require('goto-preview').goto_preview_references()<CR>",
--   name = "Preview references",
-- }
-- lvim.keys.normal_mode["gP"] = {
--   "<cmd>lua require('goto-preview').close_all_win()<CR>",
--   name = "Close preview",
-- }

-- lvim.builtin.which_key.mappings["l"]["r"] = {
--   ":IncRename ",
--   "Rename",
-- }

-- lvim.builtin.which_key.mappings["dt"] = {
--   "<cmd>PBToggleBreakpoint<CR>",
--   "Toggle breakpoint",
-- }

-- lvim.builtin.which_key.mappings["dl"] = {
--   "<cmd>lua require('dap').list_breakpoints(true)<cr>",
--   "List breakpoints",
-- }

-- lvim.builtin.which_key.mappings["dL"] = {
--   "<cmd>lua require('dap').clear_breakpoints()<cr>",
--   "Clear breakpoints",
-- }

-- lvim.builtin.which_key.mappings["m"] = {
--   ":Telescope buffers<CR>",
--   "Navigate buffers",
-- }

-- lvim.builtin.which_key.vmappings["m"] = {
--   ":Telescope buffers<CR>",
--   "Navigate buffers",
-- }
