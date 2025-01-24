return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    dependencies = {
      {
        "f-person/auto-dark-mode.nvim",
        opts = {
          update_interval = 1000,
          set_dark_mode = function()
            vim.api.nvim_set_option_value("background", "dark", {})
            vim.cmd('colorscheme catppuccin-frappe')
          end,
          set_light_mode = function()
            vim.api.nvim_set_option_value("background", "light", {})
            vim.cmd("colorscheme catppuccin-latte")
          end,
        },
      }
    },
    background = {
      light = "latte",
      dark = "frappe"
    },
    config = function()
      require("auto-dark-mode").init()

      vim.cmd.colorscheme("catppuccin-latte")

      vim.api.nvim_create_user_command('DD', function()
        vim.cmd.colorscheme("catppuccin-frappe")
      end, {})

      vim.api.nvim_create_user_command('DL', function()
        vim.cmd.colorscheme("catppuccin-latte")
      end, {})

      vim.opt.colorcolumn = table.concat(vim.fn.range(121, 999), ',')

      -- Set different ColorColumn colors based on colorscheme
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
          local colors = require("catppuccin.palettes").get_palette()
          vim.api.nvim_set_hl(0, "ColorColumn", { bg = colors.mantle })
          vim.api.nvim_set_hl(0, "Folded", { bg = colors.crust, fg = colors.green })
        end,
      })

      -- Disable colorcolumn and line numbers in quickfix windows
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "qf",
        callback = function()
          vim.opt_local.colorcolumn = ""
          vim.opt_local.number = false
        end,
      })
    end
  }
}
