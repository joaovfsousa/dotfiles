local telescope = require('telescope')
local previewers = require("telescope.previewers")
local sorters = require("telescope.sorters")

local cfg = {
  defaults = {
    layout_config = {
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
    },
    layout_strategy = "vertical",
    file_ignore_patterns = {
      "^.git/"
    },
    path_display = {
      "truncate"
    },
    file_previewer = previewers.vim_buffer_cat.new,
    grep_previewer = previewers.vim_buffer_vimgrep.new,
    qflist_previewer = previewers.vim_buffer_qflist.new,
    file_sorter = sorters.get_fuzzy_file,
    generic_sorter = sorters.get_generic_fuzzy_sorter,

  }
}

local toggle_layout_strategy = function()
  local config = require("telescope.config")

  if (cfg.defaults.layout_strategy == "vertical")
  then
    cfg.defaults.layout_strategy = "horizontal"
  else
    cfg.defaults.layout_strategy = "vertical"
  end

  config.set_defaults(cfg.defaults)
end

local setup = function()
  telescope.setup(cfg)
end



return {
  toggle_layout_strategy = toggle_layout_strategy,
  setup = setup
}
