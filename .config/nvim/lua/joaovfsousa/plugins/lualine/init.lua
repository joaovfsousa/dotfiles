local lualine = require("lualine")
local components = require("joaovfsousa.plugins.lualine.components")

local setup = function()
  local cfg = {
    active = true,
    style = "main",
    options = {
      theme = "auto",
      globalstatus = true,
      icons_enabled = true,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = { "alpha" },
    },
    sections = {
      lualine_a = {
        components.mode,
      },
      lualine_b = {
        components.branch,
      },
      lualine_c = {
        components.diff,
        components.python_env,
      },
      lualine_x = {
        components.diagnostics,
        components.lsp,
        components.spaces,
        components.filetype,
      },
      lualine_y = { components.location, require("nomodoro").status },
      lualine_z = {
        components.progress,
      },
    },
    inactive_sections = {
      lualine_a = {
        components.mode,
      },
      lualine_b = {
        components.branch,
      },
      lualine_c = {
        components.diff,
        components.python_env,
      },
      lualine_x = {
        components.diagnostics,
        components.lsp,
        components.spaces,
        components.filetype,
      },
      lualine_y = { components.location },
      lualine_z = {
        components.progress,
      },
    },
    tabline = {},
    extensions = {},
  }

  lualine.setup(cfg)
end

return {
  setup = setup,
}
