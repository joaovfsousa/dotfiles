local nvimtree_prev = { new_name = "", old_name = "" }

local definitions = {
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
    "FileType",
    {
      group = "close-with-q",
      pattern = { "qf", "help", "spectre_panel", "checkhealth", "lazy" },
      desc = "Close with q",
      callback = function(event)
        vim.keymap.set(
          { "n", "v" },
          "q",
          "<cmd>q<cr>",
          { desc = "Close", buffer = event.buf }
        )
      end,
    },
  },
  {
    "FileType",
    {
      group = "qf",
      pattern = { "qf" },
      desc = "quickfix keymaps",
      callback = function(event)
        local qf = require("joaovfsousa.utils.quickfix")

        vim.keymap.set(
          { "n", "v" },
          "dd",
          qf.delete_qf_entry,
          { desc = "Delete entry", buffer = event.buf }
        )

        vim.keymap.set(
          { "n", "v" },
          "D",
          qf.delete_buf_from_qf,
          { desc = "Delete buffer", buffer = event.buf }
        )
      end,
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
    "FocusLost",
    {
      group = "autosave",
      pattern = "*",
      desc = "Write all unsaved buffers on unfocus",
      command = "silent! wa",
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
      pattern = "help",
      callback = function()
        vim.keymap.set("n", "gd", "<C-]>", { buffer = true, silent = true })

        vim.keymap.set("n", "<C-O>", "<C-T>", { buffer = true, silent = true })
      end,
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
  {
    "User",
    {
      pattern = "OilActionsPost",
      desc = "LSP Rename on Oil save",
      callback = function(event)
        if event.data.actions[1].type == "move" then
          Snacks.rename.on_rename_file(
            event.data.actions[1].src_url,
            event.data.actions[1].dest_url
          )
        end
      end,
    },
  },
  {
    "User",
    {
      pattern = "NvimTreeSetup",
      group = "file_manager_rename",
      desc = "LSP Rename on NvimTree save",
      callback = function()
        local events = require("nvim-tree.api").events
        events.subscribe(events.Event.NodeRenamed, function(data)
          if
            nvimtree_prev.new_name ~= data.new_name
            or nvimtree_prev.old_name ~= data.old_name
          then
            data = data
            Snacks.rename.on_rename_file(data.old_name, data.new_name)
          end
        end)
      end,
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
