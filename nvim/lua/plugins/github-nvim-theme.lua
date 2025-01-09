return {
  {
    'projekt0n/github-nvim-theme',
    name = 'github-theme',
    enabled = false,
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('github-theme').setup({
        options = {
          hide_nc_statusline = false,
        }
      })

    end,
  }
}

