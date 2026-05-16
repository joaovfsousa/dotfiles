local wk = require("which-key")

local neotest = require("neotest")

wk.add({
  {
    "<leader>t",
    group = "Test",
  },
  {
    "<leader>tr",
    neotest.run.run,
    desc = "Run nearest",
  },
  {
    "<leader>tf",
    function()
      neotest.run.run(vim.fn.expand("%"))
    end,
    desc = "Run file",
  },
  {
    "<leader>tl",
    neotest.run.run_last,
    desc = "Run last",
  },
  {
    "<leader>ts",
    function()
      require("neotest").summary.toggle()
    end,
    desc = "Toggle Summary Panel",
  },
  {
    "<leader>tS",
    neotest.run.stop,
    desc = "Stop",
  },
  {
    "<leader>to",
    function()
      require("neotest").output.open({ enter = true, auto_close = true })
    end,
    desc = "Show Output(Single test)",
  },
  {
    "<leader>tO",
    neotest.output_panel.toggle,
    desc = "Show Output Panel(All tests)",
  },
})
