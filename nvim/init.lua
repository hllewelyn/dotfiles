vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.lazy")
require("config.options")
require("config.keymaps")

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

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.foldmethod = "expr"
    vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
  end,
})

vim.diagnostic.config({
  float = {
    border = "single",
    source = true,
    -- Additional spacing options
    max_width = 80,
    max_height = 20,
  },
  virtual_text = false,
  virtual_lines = { current_line = true }
})

local diagnostics = {
  "DiagnosticUnderlineError",
  "DiagnosticUnderlineWarn",
  "DiagnosticUnderlineInfo",
  "DiagnosticUnderlineHint"
}

for _, diagnostic in ipairs(diagnostics) do
  local hl = vim.api.nvim_get_hl(0, { name = diagnostic })
  hl.undercurl = true
  hl.underline = nil  -- remove straight underline
  vim.api.nvim_set_hl(0, diagnostic, hl)
end
