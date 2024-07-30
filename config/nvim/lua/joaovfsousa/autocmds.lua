local definitions = {
  {
    "TextYankPost",
    {
      group = "_general_settings",
      pattern = "*",
      desc = "Highlight text on yank",
      callback = function()
        vim.highlight.on_yank({ higroup = "Search", timeout = 100 })
      end,
    },
  },
  {
    "FileType",
    {
      group = "_filetype colorizer",
      pattern = "*",
      desc = "Start colorizer",
      callback = function()
        vim.cmd([[ColorizerAttachToBuffer]])
      end,
    },
  },
  {
    "TermOpen",
    {
      group = "bufcheck",
      pattern = "*",
      desc = "Starts terminal in insert mode",
      command = "startinsert | set winfixheight",
    },
  },
  {
    "FileType",
    {
      group = "bufcheck",
      pattern = { "gitcommit", "gitrebase" },
      desc = "Starts git commit and rebase in insert mode",
      command = "startinsert | 1",
    },
  },
  {
    "BufReadPost",
    {
      group = "bufcheck",
      pattern = "*",
      desc = "Return to last edit position when opening files",
      callback = function()
        local fn = vim.fn
        if fn.line("'\"") > 0 and fn.line("'\"") <= fn.line("$") then
          fn.setpos(".", fn.getpos("'\""))
          -- vim.cmd('normal zz') -- how do I center the buffer in a sane way??
          vim.cmd("silent! foldopen")
        end
      end,
    },
  },
  {
    "FocusLost",
    {
      group = "autosave",
      pattern = "*",
      desc = "Write all unsaved buffers on unfocus",
      command = "silent! wa",
    },
  },
  {
    "VimResized",
    {
      group = "on_resize",
      desc = "resize",
      command = "wincmd =",
    },
  },
}

local function define_autocmds(definitions)
  for _, entry in ipairs(definitions) do
    local event = entry[1]
    local opts = entry[2]
    if type(opts.group) == "string" and opts.group ~= "" then
      local exists, _ = pcall(vim.api.nvim_get_autocmds, { group = opts.group })
      if not exists then
        vim.api.nvim_create_augroup(opts.group, {})
      end
    end
    vim.api.nvim_create_autocmd(event, opts)
  end
end

define_autocmds(definitions)
