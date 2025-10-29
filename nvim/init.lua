vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.options")
require("config.folds")
require("config.keymaps")
require("config.lsp")

vim.cmd('syntax enable')

vim.cmd.packadd('cfilter')

local group = vim.api.nvim_create_augroup("Misc", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  desc = "Trim whitespace for buffer on write",
  callback = function()
    local save = vim.fn.winsaveview()
    vim.cmd [[ keeppatterns %s/\s\+$//e ]]
    vim.fn.winrestview(save)
  end,
  group = group
})

vim.api.nvim_create_autocmd("VimResized", { command = "wincmd =" })
