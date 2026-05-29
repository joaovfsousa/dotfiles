return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      indent = {
        enabled = true,
        animate = {
          enabled = false,
        }
      },
      lazygit = {
        configure = true,
        config = {
          os = { editPreset = "nvim-remote" },
          keybinding = {
            universal = {
              pullFiles = "P",
              pushFiles = "p",
            },
          },
          notARepository = "skip",
          git = {
            overrideGpg = true
          },
          promptToReturnFromSubprocess = false
        },
        win = {
          -- make it full screen
          height = 0,
          width = 0
        }
      }
    },
  },
}
