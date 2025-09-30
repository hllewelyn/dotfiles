local opt = vim.opt

opt.compatible                 = false
opt.autoread                   = true               -- automatically reload if file changes outside of vim
opt.ruler                      = true               -- show the cursor position all the time
opt.number                     = true               -- show line numbers
opt.relativenumber             = true               -- show relative line numbers
opt.numberwidth                = 5                  -- width of the number gutter
opt.showmode                   = true               -- show --INSERT-- in cmdline
opt.hlsearch                   = true               -- highlight search results
opt.incsearch                  = true               -- incremental search
opt.splitbelow                 = true               -- open horizontal splits below
opt.splitright                 = true               -- open vertical splits to the right
opt.backspace                  = "indent,eol,start" -- backspace over everything in insert
opt.backup                     = false
opt.writebackup                = false
opt.swapfile                   = false
opt.history                    = 200
opt.autoindent                 = true -- always have automatic indenting on
opt.shiftwidth                 = 2
opt.smarttab                   = true
opt.expandtab                  = true -- spaces instead of tabs
opt.scrolloff                  = 3    -- start scrolling 5 lines before edge of viewport
opt.clipboard                  = opt.clipboard + 'unnamedplus'
opt.mouse                      = 'a'
opt.foldlevel                  = 1
opt.foldmethod                 = 'indent'

opt.termguicolors              = true
opt.textwidth                  = 110

-- Netrw
vim.g.netrw_winsize                = 30
vim.g.netrw_banner                 = 0
vim.g.netrw_localcopydircmr        = 'cp -r'
