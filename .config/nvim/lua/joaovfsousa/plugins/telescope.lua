local telescope = require("telescope")
local previewers = require("telescope.previewers")
local sorters = require("telescope.sorters")

local cfg = {
  defaults = {
    layout_config = {
      horizontal = {
        height = 0.8,
        width = 0.8,
        mirror = false,
        prompt_position = "top",
      },
      vertical = {
        height = 0.8,
        width = 0.8,
        mirror = true,
        prompt_position = "top",
      },
    },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
      "--glob=!.git/",
    },
    layout_strategy = "horizontal",
    sorting_strategy = "ascending",
    file_ignore_patterns = {
      "^.git/",
      "%.png",
      "%.jpg",
      "%.zip",
      "%.pdf",
      "%.o",
      "%.out",
      ".cache",
      ".next",
    },
    path_display = {
      "truncate",
    },
    file_previewer = previewers.vim_buffer_cat.new,
    grep_previewer = previewers.vim_buffer_vimgrep.new,
    qflist_previewer = previewers.vim_buffer_qflist.new,
    file_sorter = sorters.get_fuzzy_file,
    generic_sorter = sorters.get_generic_fuzzy_sorter,
  },
  pickers = {
    git_files = {
      hidden = true,
      show_untracked = true,
    },
    grep_string = {
      only_sort_text = true,
      hidden = true,
    },
    live_grep = {
      --@usage don't include the filename in the search results
      only_sort_text = true,
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                   -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true,    -- override the file sorter
      case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
    },
    frecency = {
      show_scores = false,
      show_unindexed = false,
      ignore_patterns = { "*.git/*", "*/tmp/*", "*/node_modules/*" },
      default_workspace = { "CWD" },
    },
  },
}

local toggle_layout_strategy = function()
  local config = require("telescope.config")

  if cfg.defaults.layout_strategy == "vertical" then
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
  setup = setup,
}
