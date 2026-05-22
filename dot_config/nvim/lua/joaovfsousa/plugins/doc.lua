return {
  {
    "danymat/neogen",
    config = true,
    keys = {
      {
        "<leader>ld",
        function()
          require("neogen").generate()
        end,
        desc = "Gen doc",
      },
    },
  },
}
