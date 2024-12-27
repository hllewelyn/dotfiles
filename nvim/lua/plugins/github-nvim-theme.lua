return {
  {
    'projekt0n/github-nvim-theme',
    name = 'github-theme',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('github-theme').setup({
        options = {
          hide_nc_statusline = false,
        }
      })

      vim.cmd('syntax enable')
      vim.cmd('colorscheme github_light')
      vim.cmd [[
        " Change the color of the editor after 120 chars, except for the quickfix panel.
        let &colorcolumn=join(range(121,999),",")
        au FileType qf setlocal nonumber colorcolumn=

        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

        " Shortcut commands to change the colorscheme - mainly used for pairing
        command! DD execute "colorscheme github_dark"
        command! DL execute "colorscheme github_light"
      ]]
    end,
  }
}

