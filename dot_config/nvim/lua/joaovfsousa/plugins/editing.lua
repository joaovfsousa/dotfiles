---@type LazySpec
return {
  {
    "pogyomo/submode.nvim",
    lazy = true,
    version = "6.4.3"
  },
  {
    "jake-stewart/multicursor.nvim",
    lazy = false,
    config = function()
      local mc = require("multicursor-nvim")
      local sm = require("submode")

      local mc_mode = "MultiCursor"

      mc.setup()

      vim.keymap.set({ "n", "x" }, "<leader>i", function()
        if mc.hasCursors() then
          mc.clearCursors()
          sm.leave()
        else
          mc.enableCursors()
          sm.enter(mc_mode)
        end
      end)

      vim.api.nvim_create_autocmd("User", {
        group = vim.api.nvim_create_augroup("SubmodeEnterPre", {}),
        pattern = "SubmodeLeavePre",
        callback = function(env)
          if env.data.name == mc_mode then
            mc.clearCursors()
          end
        end
      })

      sm.create(mc_mode, {
        mode = "n",
        enter = {},
        leave = { "q" },
        default = function(register)
          -- Line by line
          register("k", function()
            mc.lineSkipCursor(-1)
          end)
          register("j", function()
            mc.lineSkipCursor(1)
          end)
          register("K", function()
            mc.lineAddCursor(-1)
          end)
          register("J", function()
            mc.lineAddCursor(1)
          end)

          -- Matching word/selection
          register("N", function()
            mc.matchAddCursor(-1)
          end)
          register("n", function()
            mc.matchAddCursor(1)
          end)
          register("S", function()
            mc.matchSkipCursor(-1)
          end)
          register("s", function()
            mc.matchSkipCursor(1)
          end)
        end
      })

      vim.keymap.set({ "x" }, "gai", mc.insertVisual, { desc = "Insert cursor for every line in selection" })
      vim.keymap.set({ "x" }, "gaa", mc.appendVisual, { desc = "Append cursor for every line in selection" })
      vim.keymap.set({ "n", "x" }, "gaA", mc.alignCursors, { desc = "Align cursors" })

      vim.keymap.set({ "n", "x" }, "gas", mc.addCursorOperator,
        { desc = "Cursor on every selected line or operator(gasip => add cursor select inside paragraph)" })
      vim.keymap.set({ "n", "x" }, "gam", mc.matchAllAddCursors, { desc = "Add cursors to allm matches" })
      vim.keymap.set({ "n", "x" }, "gac", function()
        mc.clearCursors()
        sm.leave()
      end, { desc = "Clear cursor" })
      vim.keymap.set({ "n", "x" }, "gau", mc.restoreCursors, { desc = "Restore cursors" })

      vim.keymap.set({ "n", "x" }, "gat", function() mc.transposeCursors(1) end, {
        desc =
        "Rotate text between cursor down"
      })
      vim.keymap.set({ "n", "x" }, "gaT", function() mc.transposeCursors(-1) end, {
        desc =
        "Rotate text between cursor up"
      })
    end
  }
}
