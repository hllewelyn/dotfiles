vim.keymap.set('n', 'dd', function()
  local cursor = vim.api.nvim_win_get_cursor(0)
  local items = vim.fn.getqflist()
  local line = cursor[1]

  table.remove(items, line)
  vim.fn.setqflist(items, 'r')

  -- Close quickfix on last item remove
  if #items == 0 then
    vim.cmd.cclose()
  else
    -- Restore cursor position (stay on same line, or move up if we deleted the last item)
    local new_line = math.min(line, #items)
    vim.api.nvim_win_set_cursor(0, { new_line, cursor[2] })
  end

  -- Make repeatable with vim-repeat
  vim.fn['repeat#set'](vim.api.nvim_replace_termcodes('dd', true, true, true))
end, { buffer = 0, silent = true, desc = 'Remove item under cursor' })
