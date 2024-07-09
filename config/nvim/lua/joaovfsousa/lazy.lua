local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("joaovfsousa.plugins", {
  install = {
    missing = true,
    colorscheme = { "lunar" },
  },
  change_detection = {
    notify = false, -- Suppress change notices (default true results in having to dismiss the notice every time you change plugin config).
  },
})

--   {
--     "anuvyklack/fold-preview.nvim",
--     dependencies = "anuvyklack/keymap-amend.nvim",
--     config = function()
--       require("fold-preview").setup({})
--     end,
--   },
--   ,
--   ,
-- }
