-- Themeing
require('github-theme').setup({
  options = {
    hide_nc_statusline = false,
  }
})

-- vim.cmd('colorscheme onehalflight')
-- vim.cmd('colorscheme github_dark')
vim.cmd('syntax enable')

local auto_dark_mode = require('auto-dark-mode')

auto_dark_mode.setup({
  update_interval = 1000,
  set_dark_mode = function()
    vim.api.nvim_set_option_value('background', 'dark', {})
    vim.cmd('colorscheme github_dark')
  end,
  set_light_mode = function()
    vim.api.nvim_set_option_value('background', 'light', {})
    vim.cmd('colorscheme onehalflight')
  end,
})

vim.cmd [[
  " Change the color of the editor after 120 chars, except for the quickfix panel.
  let &colorcolumn=join(range(121,999),",")
  au FileType qf setlocal nonumber colorcolumn=

  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

  " Shortcut commands to change the colorscheme - mainly used for pairing
  command! DD execute "colorscheme github_dark"
  command! DL execute "colorscheme onehalflight"
]]

