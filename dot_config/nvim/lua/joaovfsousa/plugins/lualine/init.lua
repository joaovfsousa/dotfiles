local components = require("joaovfsousa.plugins.lualine.components")
local opts = {
  active = true,
  style = "main",
  options = {
    theme = "catppuccin-mocha",
    globalstatus = true,
    icons_enabled = true,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
  },
  sections = {
    lualine_a = {
      components.mode,
      components.submode,
      components.macro,
    },
    lualine_b = {
      components.branch,
    },
    lualine_c = {
      components.filetype_icon,
      components.filename,
      components.diff,
    },
    lualine_x = {
      components.searchcount,
      components.selectioncount,
      components.diagnostics,
      components.lsp,
    },
    lualine_y = {
      components.spaces,
      components.filetype,
    },
    lualine_z = {
      components.location,
      components.progress,
    },
  },
  tabline = {},
  extensions = {},
}

return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "pogyomo/submode.nvim",
    },
    event = "VimEnter",
    opts = opts,
  },
}
