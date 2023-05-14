lvim.builtin.telescope.defaults.path_display = {
  "truncate"
}

lvim.builtin.telescope.defaults.file_ignore_patterns = {
  "^.git/"
}

lvim.builtin.telescope.defaults.layout_strategy = "vertical"

lvim.builtin.telescope.defaults.layout_config = {
  horizontal = {
    height = 0.8,
    width = 0.8,
    mirror = true,
    prompt_position = "top"
  },
  vertical = {
    height = 0.8,
    width = 0.8,
    mirror = true,
    prompt_position = "top"
  },
}

local toggle_layout_strategy = function()
  local cfg = require("telescope.config")

  if (lvim.builtin.telescope.defaults.layout_strategy == "vertical")
  then
    lvim.builtin.telescope.defaults.layout_strategy = "horizontal"
  else
    lvim.builtin.telescope.defaults.layout_strategy = "vertical"
  end

  cfg.set_defaults(lvim.builtin.telescope.defaults)
end

local helpers = {}

helpers.toggle_layout_strategy = toggle_layout_strategy

return helpers
