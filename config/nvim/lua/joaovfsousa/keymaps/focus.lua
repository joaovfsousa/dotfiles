function open_nvim_tree_in_left_panel()
  local state = require("no-neck-pain").state
  require("nvim-tree.api").tree.open({
    winid = state.get_tab(state).wins.main.left,
  })
end

vim.keymap.set("n", "<leader>zz", function()
  local nnp = require("no-neck-pain")

  -- NNP not set up yet
  if not nnp.state then
    nnp.enable()
  else
    if nnp.state.enabled then
      nnp.disable()
    else
      nnp.enable()
    end
  end
end)

vim.keymap.set("n", "<leader>ze", open_nvim_tree_in_left_panel)
