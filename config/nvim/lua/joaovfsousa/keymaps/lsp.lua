vim.keymap.set(
  "n",
  "K",
  "<cmd>lua vim.lsp.buf.hover()<cr>",
  { desc = "Show hover" }
)
vim.keymap.set(
  "n",
  "gd",
  "<cmd>lua vim.lsp.buf.definition()<cr>",
  { desc = "Goto definition" }
)
vim.keymap.set(
  "n",
  "gD",
  "<cmd>lua vim.lsp.buf.declaration()<cr>",
  { desc = "Goto Declaration" }
)
vim.keymap.set(
  "n",
  "gr",
  "<cmd>lua vim.lsp.buf.references()<cr>",
  { desc = "Goto references" }
)
vim.keymap.set(
  "n",
  "gI",
  "<cmd>lua vim.lsp.buf.implementation()<cr>",
  { desc = "Goto Implementation" }
)
vim.keymap.set(
  "n",
  "gs",
  "<cmd>lua vim.lsp.buf.signature_help()<cr>",
  { desc = "Show signature help" }
)

local show_line_diagnostics = function()
  local float = vim.diagnostic.config().float

  if float then
    local config = type(float) == "table" and float or {}
    config.scope = "line"

    vim.diagnostic.open_float(config)
  end
end

vim.keymap.set(
  "n",
  "gl",
  show_line_diagnostics,
  { desc = "Show line diagnostics" }
)

vim.keymap.set("n", "J", "<cmd>lua vim.diagnostic.open_float()<cr>")

vim.keymap.set(
  "n",
  "gt",
  "<cmd>lua vim.lsp.buf.type_definition()<cr>",
  { desc = "Goto type definition" }
)

vim.keymap.set("n", "<leader>ll", function()
  require("logsitter").log()
end, { desc = "Add log" })
