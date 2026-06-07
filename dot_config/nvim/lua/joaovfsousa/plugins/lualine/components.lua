local colors = require("joaovfsousa.plugins.lualine.colors")
local icons = require("joaovfsousa.theme.icons")

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end

return {
  mode = {
    function()
      return " " .. icons.ui.Target .. " "
    end,
    padding = { left = 0, right = 1 },
    color = {},
    cond = nil,
  },
  submode = {
    require("submode").mode,
    padding = { left = 0, right = 1 },
    color = {},
    cond = function()
      return require("submode").mode() ~= nil
    end,
  },
  branch = {
    "branch",
    icon = icons.git.Branch,
  },
  filename = {
    "filename",
    color = {},
    padding = { left = 1, right = 1 },
    path = 1,
    file_status = false,
  },
  diff = {
    "diff",
    source = diff_source,
    symbols = {
      added = icons.git.LineAdded .. " ",
      modified = icons.git.LineModified .. " ",
      removed = icons.git.LineRemoved .. " ",
    },
    padding = { left = 1, right = 1 },
    diff_color = {
      added = { fg = colors.green },
      modified = { fg = colors.yellow },
      removed = { fg = colors.red },
    },
    cond = nil,
  },
  diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = {
      error = icons.diagnostics.BoldError .. " ",
      warn = icons.diagnostics.BoldWarning .. " ",
      info = icons.diagnostics.BoldInformation .. " ",
      hint = icons.diagnostics.BoldHint .. " ",
    },
  },
  progress = { "progress", separator = " ", padding = { left = 0, right = 1 } },
  location = { "location", separator = " ", padding = { left = 1, right = 1 } },
  spaces = {
    function()
      local shiftwidth =
        vim.api.nvim_get_option_value("shiftwidth", { buf = 0 })
      return icons.ui.Tab .. " " .. shiftwidth
    end,
    padding = 1,
  },
  filetype = { "filetype", cond = nil, padding = { left = 1, right = 1 } },
  filetype_icon = {
    "filetype",
    icon_only = true,
    padding = { left = 1, right = 0 },
    separator = "",
  },
  lsp = {
    function()
      local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
      if #buf_clients == 0 then
        return "LSP Inactive"
      end

      local buf_client_names = {}

      -- add client
      for _, client in pairs(buf_clients) do
        table.insert(buf_client_names, client.name)
      end

      local unique_client_names = table.concat(buf_client_names, ", ")

      return string.format("[%s]", unique_client_names)
    end,
    color = { gui = "bold" },
  },
  macro = {
    function()
      return vim.fn.reg_recording()
    end,
    icon = { icons.ui.Circle, color = { fg = colors.red } },
  },
  searchcount = {
    function()
      local search = vim.fn.searchcount({ maxcount = 0 })
      if next(search) ~= nil then
        if search.current > 0 and vim.v.hlsearch ~= 0 then
          return search.current .. "/" .. search.total
        end
      end
      return ""
    end,
    icon = { icons.ui.Search, color = { fg = colors.cyan } },
  },
  selectioncount = {
    function()
      local starts = vim.fn.line("v")
      local ends = vim.fn.line(".")
      local count = starts <= ends and ends - starts + 1 or starts - ends + 1
      local wc = vim.fn.wordcount()
      return count .. ":" .. wc["visual_chars"]
    end,
    cond = function()
      return vim.fn.mode():find("[Vv]") ~= nil
    end,
    icon = { "󰗅", color = { fg = colors.cyan } },
  },
}
