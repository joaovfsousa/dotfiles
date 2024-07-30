local M = {}

-- https://github.com/nvim-pack/nvim-spectre/blob/master/lua/spectre/utils.lua
function M.get_visual_selection()
  local start_pos = vim.api.nvim_buf_get_mark(0, "<")
  local end_pos = vim.api.nvim_buf_get_mark(0, ">")
  print(start_pos[1] .. " end " .. end_pos[1])
  local lines = vim.fn.getline(start_pos[1], end_pos[1])
  -- add when only select in 1 line
  local plusEnd = 0
  local plusStart = 1
  if #lines == 0 then
    return ""
  elseif #lines == 1 then
    plusEnd = 1
    plusStart = 1
  end
  lines[#lines] = string.sub(lines[#lines], 0, end_pos[2] + plusEnd)
  lines[1] =
    string.sub(lines[1], start_pos[2] + plusStart, string.len(lines[1]))
  local query = table.concat(lines, "")
  return query
end

return M
