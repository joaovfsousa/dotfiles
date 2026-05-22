-- Copied from https://github.com/lazyvim/lazyvim/blob/main/lua/lazyvim/util/mini.lua
function setup_mini_pairs(opts)
  local pairs = require("mini.pairs")
  pairs.setup(opts)
  local open = pairs.open
  pairs.open = function(pair, neigh_pattern)
    if vim.fn.getcmdline() ~= "" then
      return open(pair, neigh_pattern)
    end
    local o, c = pair:sub(1, 1), pair:sub(2, 2)
    local line = vim.api.nvim_get_current_line()
    local cursor = vim.api.nvim_win_get_cursor(0)
    local next = line:sub(cursor[2] + 1, cursor[2] + 1)
    local before = line:sub(1, cursor[2])
    if
      opts.markdown
      and o == "`"
      and vim.bo.filetype == "markdown"
      and before:match("^%s*``")
    then
      return "`\n```"
        .. vim.api.nvim_replace_termcodes("<up>", true, true, true)
    end
    if opts.skip_next and next ~= "" and next:match(opts.skip_next) then
      return o
    end
    if opts.skip_ts and #opts.skip_ts > 0 then
      local ok, captures = pcall(
        vim.treesitter.get_captures_at_pos,
        0,
        cursor[1] - 1,
        math.max(cursor[2] - 1, 0)
      )
      for _, capture in ipairs(ok and captures or {}) do
        if vim.tbl_contains(opts.skip_ts, capture.capture) then
          return o
        end
      end
    end
    if opts.skip_unbalanced and next == c and c ~= o then
      local _, count_open = line:gsub(vim.pesc(pair:sub(1, 1)), "")
      local _, count_close = line:gsub(vim.pesc(pair:sub(2, 2)), "")
      if count_close > count_open then
        return o
      end
    end
    return open(pair, neigh_pattern)
  end
end

return {
  {
    "johmsalas/text-case.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("textcase").setup({})
      require("telescope").load_extension("textcase")
    end,
    cmd = {
      -- NOTE: The Subs command name can be customized via the option "substitude_command_name"
      "Subs",
      "TextCaseOpenTelescope",
      "TextCaseOpenTelescopeQuickChange",
      "TextCaseOpenTelescopeLSPChange",
      "TextCaseStartReplacingCommand",
    },
    lazy = false,
  },
  {
    "saifulapm/chartoggle.nvim",
    event = "User FileOpened",
  },
  {
    "nvim-mini/mini.align",
    version = "*",
    opts = {
      mappings = {
        start = "",
        start_with_preview = "<leader>Ta",
      },
    },
  },
  {
    "nvim-mini/mini.splitjoin",
    version = "*",
    opts = {
      mappings = {
        toggle = "<leader>Ts",
      },
    },
    {
      "nvim-mini/mini.pairs",
      version = "*",
      opts = {
        modes = { insert = true, command = true, terminal = false },
        skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
        skip_ts = { "string" },
        skip_unbalanced = true,
        markdown = true,
        mappings = {
          ["("] = { action = "open", pair = "()", neigh_pattern = "^[^\\]" },
          ["["] = { action = "open", pair = "[]", neigh_pattern = "^[^\\]" },
          ["{"] = { action = "open", pair = "{}", neigh_pattern = "^[^\\]" },

          [")"] = { action = "close", pair = "()", neigh_pattern = "^[^\\]" },
          ["]"] = { action = "close", pair = "[]", neigh_pattern = "^[^\\]" },
          ["}"] = { action = "close", pair = "{}", neigh_pattern = "^[^\\]" },

          ['"'] = {
            action = "closeopen",
            pair = '""',
            neigh_pattern = "^[^%a\\]",
            register = { cr = false },
          },
          ["'"] = {
            action = "closeopen",
            pair = "''",
            neigh_pattern = "^[^%a\\]",
            register = { cr = false },
          },
          ["`"] = {
            action = "closeopen",
            pair = "``",
            neigh_pattern = "^[^%a\\]",
            register = { cr = false },
          },
        },
      },
      config = function(_, opts)
        setup_mini_pairs(opts)
      end,
    },
  },
}
