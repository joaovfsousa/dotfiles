return {
  {
    "nvimdev/hlsearch.nvim",
    event = "BufRead",
    config = function()
      require("hlsearch").setup()
    end,
  },
  {
    "MagicDuck/grug-far.nvim",
    opts = {},
  },
}
