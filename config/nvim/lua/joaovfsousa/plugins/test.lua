---@type LazySpec
return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-jest",
    },

    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-jest")({
            jestArguments = function(defaultArguments, context)
              local extArguments = { "--no-cache" }

              local result =
                vim.tbl_extend("force", defaultArguments, extArguments)

              return result
            end,
            jestCommand = "npm test --",
            jestConfigFile = function()
              -- cwd = vim.fn.getcwd()
              -- TODO: add list of files to check
              return "jest.setup.ts"
            end,
            cwd = function(path)
              return vim.fn.getcwd()
            end,
            isTestFile = require("neotest-jest.jest-util").defaultIsTestFile,
            jest_test_discovery = true, --support for `it.each` and `test.each`
          }),
        },
        quickfix = {
          enabled = true,
          open = function()
            vim.cmd("copen")
          end,
        },
      })
    end,
  },
}
