local cmds = {
  {
    name = "BufferKill",
    fn = function()
      require("joaovfsousa.commands.bufferkill")("bd")
    end,
  },
}

local common_opts = { force = true }
for _, cmd in pairs(cmds) do
  local opts = vim.tbl_deep_extend("force", common_opts, cmd.opts or {})
  vim.api.nvim_create_user_command(cmd.name, cmd.fn, opts)
end
