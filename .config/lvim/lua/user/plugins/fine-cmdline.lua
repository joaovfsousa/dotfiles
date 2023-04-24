local fineline = require('fine-cmdline')
local fn = fineline.fn

fineline.setup({
  cmdline = {
    enable_keymaps = true,
    smart_history = true
  },
  popup = {
    position = {
      row = '45%',
      col = '50%'
    },
    border = {
      style = 'rounded'
    }
  },
  hooks = {
    after_mount = function(input)
      vim.keymap.set('i', '<Esc>', '<cmd>stopinsert<cr>', { buffer = input.bufnr })
    end,
    set_keymaps = function(imap)
      imap('<C-k>', fn.up_search_history)
      imap('<C-j>', fn.down_search_history)
    end
  }
})
