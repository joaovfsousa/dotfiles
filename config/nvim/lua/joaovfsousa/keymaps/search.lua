local wk = require("which-key")
local gf = require("grug-far")
local us = require("joaovfsousa.utils.selection")

wk.add({
  {
    "<leader>s",
    group = "Search",
  },
  {
    mode = { "n" },
    {
      "<leader>sr",
      function()
        gf.open({ transient = true })
      end,
      desc = "SaR",
    },
    {
      "<leader>sR",
      function()
        gf.open({
          transient = true,
          prefills = { search = vim.fn.expand("<cword>") },
        })
      end,
      desc = "Search current word",
    },
    {
      "<leader>sf",
      function()
        gf.open({
          transient = true,
          prefills = { paths = vim.fn.expand("%") },
        })
      end,
      desc = "Search current file",
    },
    {
      "<leader>si",
      function()
        gf.open({ transient = true, extraRgArgs = "-uuu" })
      end,
      desc = "Search ignoring gitignore",
    },
  },
  {
    mode = { "v" },
    {
      "<leader>sr",
      function()
        local selection = us.get_visual_selection()
        gf.open({
          transient = true,
          prefills = { search = selection },
        })
      end,
      desc = "SaR selection",
    },
    {
      "<leader>sf",
      function()
        local selection = us.get_visual_selection()
        gf.open({
          transient = true,
          prefills = { search = selection, paths = vim.fn.expand("%") },
        })
      end,
      desc = "Search current file",
    },
  },
})
