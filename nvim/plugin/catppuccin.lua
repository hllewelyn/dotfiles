vim.pack.add({
  {
    src = "https://github.com/catppuccin/nvim", name = "catppuccin"
  }
})

local catppuccin = require("catppuccin")
catppuccin.setup({
  background = {
    light = "latte",
    dark = "frappe"
  },
  term_colors = true,
  integrations = {
    telescope = true,
  },
})

vim.cmd.colorscheme("catppuccin")

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
