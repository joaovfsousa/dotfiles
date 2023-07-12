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
      group = "_filetype keymaps",
      pattern = "typescript,typescriptreact",
      desc = "Go to Typescript definition keymap",
      callback = function()
        vim.keymap.set("n", "gd", "<cmd>TypescriptGoToSourceDefinition<cr>", {
          buffer = true,
          desc = "Go to definition",
        })
      end,
    },
  },
  {
    "FileType",
    {
      group = "LogSitter",
      pattern = "javascript,go,lua,typescript,typescriptreact,javascriptreact",
      desc = "Add logsitter keymap",
      callback = function()
        vim.keymap.set("n", "<leader>ll", function()
          require("logsitter").log()
        end, { desc = "Add log" })
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

if vim.fn.has("nvim-0.10") == 1 then
  print("asdfasdf")
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("EnableInlayHints", { clear = true }),
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client.server_capabilities.inlayHintProvider then
        print("server has inlay hints")
        vim.lsp.inlay_hint(args.buf, true)
      end
    end,
  })
end
