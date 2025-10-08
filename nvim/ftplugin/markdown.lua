-- vim.opt_local.conceallevel = 2
vim.opt_local.spell = true
vim.opt_local.textwidth = 115

vim.schedule(function()
  vim.opt_local.foldmethod = "expr"
  vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
end)
