local wk = require("which-key")

wk.add({
  {
    "g",
    group = "Goto",
  },
  {
    "gd",
    vim.lsp.buf.definition,
    desc = "Goto definition",
  },
  {
    "gD",
    vim.lsp.buf.declaration,
    desc = "Goto Declaration",
  },
  {
    "gI",
    vim.lsp.buf.implementation,
    desc = "Goto Implementation",
  },
  {
    "gl",
    function()
      local float = vim.diagnostic.config().float

      if float then
        local config = type(float) == "table" and float or {}
        config.scope = "line"
        vim.diagnostic.open_float(config)
      end
    end,
    desc = "Show line diagnostics",
  },
  {
    "gr",
    vim.lsp.buf.references,
    desc = "Goto references",
  },
  {
    "gs",
    vim.lsp.buf.signature_help,
    desc = "Show signature help",
  },
  {
    "gt",
    vim.lsp.buf.type_definition,
    desc = "Goto type definition",
  },
})
