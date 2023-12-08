local cmd = vim.api.nvim_command

local function BufOnly()
  local current_buf = vim.api.nvim_get_current_buf()
  local all_bufs = vim.api.nvim_list_bufs()

  for _, buf in ipairs(all_bufs) do
    if buf ~= current_buf then
      cmd('bdelete' .. buf)
    end
  end
end

cmd('command! BufOnly lua BufOnly()')

return BufOnly
