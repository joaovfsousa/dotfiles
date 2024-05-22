vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] =
    vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = "rounded",
    })

vim.diagnostic.config({
  float = { border = "rounded" },
})

require("joaovfsousa.lsp.lua")
require("joaovfsousa.lsp.astro")
require("joaovfsousa.lsp.javascript")
require("joaovfsousa.lsp.json")
