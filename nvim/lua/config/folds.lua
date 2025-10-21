local opt          = vim.opt

opt.foldlevel      = 99
opt.foldlevelstart = 2
opt.foldnestmax    = 4
opt.foldmethod     = "expr"
opt.foldexpr       = "v:lua.vim.treesitter.foldexpr()"
