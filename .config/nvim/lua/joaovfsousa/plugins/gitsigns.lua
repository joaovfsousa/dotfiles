local setup = function()
  require("gitsigns").setup({
    signs = {
      add = { text = "+" },
      change = { text = "M" },
      delete = { text = "_" },
      topdelete = { text = "-" },
      changedelete = { text = "-" },
      untracked = { text = "U" },
    },
  })
end

return {
  setup = setup
}

