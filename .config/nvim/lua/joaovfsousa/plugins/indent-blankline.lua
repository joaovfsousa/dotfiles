local icons = require("joaovfsousa.theme.icons")

local setup = function()
  require("indent_blankline").setup({
    enabled = true,
    buftype_exclude = { "terminal", "nofile" },
    filetype_exclude = {
      "help",
      "startify",
      "dashboard",
      "lazy",
      "neogitstatus",
      "NvimTree",
      "Trouble",
      "text",
    },
    char = icons.ui.LineLeft,
    context_char = icons.ui.LineLeft,
    show_trailing_blankline_indent = false,
    show_first_indent_level = true,
    use_treesitter = true,
    show_current_context = true,
  })
end

return {
  setup = setup,
}
