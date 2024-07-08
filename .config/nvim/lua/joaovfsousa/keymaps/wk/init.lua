local find_maps = require("joaovfsousa.keymaps.wk.find")
local lsp_maps = require("joaovfsousa.keymaps.wk.lsp")
local bufferline = require("bufferline")
local jester_maps = require("joaovfsousa.keymaps.wk.jester")
local refactoring_maps = require("joaovfsousa.keymaps.wk.refactoring")
local dap_maps = require("joaovfsousa.keymaps.wk.dap")
local git_maps = require("joaovfsousa.keymaps.wk.git")

---@param num integer
---@return function
local function navigate_to(num)
  return function()
    bufferline.go_to(num, true)
  end
end

local nmaps = {
  D = {
    "<cmd>DBUIToggle<cr>",
    "Dadbod UI",
  },
  d = dap_maps,
  f = find_maps,
  F = {
    "<cmd>Telescope git_files<cr>",
    "Git Files",
  },
  g = git_maps,
  l = lsp_maps,
  r = refactoring_maps,
  t = jester_maps,
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
  C = {
    "<cmd>pc<cr>",
    "Kill preview windows",
  },
  P = {
    "<cmd>Lazy<cr>",
    "Plugins",
  },
  H = { "<cmd>nohlsearch<CR>", "No Highlight" },
  ["/"] = {
    "<Plug>(comment_toggle_linewise_current)",
    "Comment toggle current line",
  },
  [","] = {
    "<cmd>lua require('chartoggle').toggle(',')<CR>",
    "Toggle comma",
  },
  [";"] = {
    "<cmd>lua require('chartoggle').toggle(';')<CR>",
    "Toggle semicolon",
  },
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
