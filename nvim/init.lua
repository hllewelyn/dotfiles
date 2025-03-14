vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.lazy")

vim.opt.background = "dark"

vim.opt.compatible                 = false
vim.opt.autoread                   = true               -- automatically reload if file changes outside of vim
vim.opt.ruler                      = true               -- show the cursor position all the time
vim.opt.number                     = true               -- show line numbers
vim.opt.relativenumber             = true               -- show relative line numbers
vim.opt.numberwidth                = 5                  -- width of the number gutter
vim.opt.showmode                   = true               -- show --INSERT-- in cmdline
vim.opt.hlsearch                   = true               -- highlight search results
vim.opt.incsearch                  = true               -- incremental search
vim.opt.splitbelow                 = true               -- open horizontal splits below
vim.opt.splitright                 = true               -- open vertical splits to the right
vim.opt.backspace                  = "indent,eol,start" -- backspace over everything in insert
vim.opt.backup                     = false
vim.opt.writebackup                = false
vim.opt.swapfile                   = false
vim.opt.history                    = 200
vim.opt.autoindent                 = true -- always have automatic indenting on
vim.opt.shiftwidth                 = 2
vim.opt.smarttab                   = true
vim.opt.expandtab                  = true -- spaces instead of tabs
vim.opt.scrolloff                  = 3    -- start scrolling 5 lines before edge of viewport
vim.opt.clipboard                  = vim.opt.clipboard + 'unnamedplus'
vim.opt.mouse                      = 'a'
vim.opt.foldlevel                  = 1
vim.opt.foldmethod                 = 'indent'

vim.opt.termguicolors              = true
vim.opt.textwidth                  = 110

-- Netrw
vim.g.netrw_winsize                = 30
vim.g.netrw_banner                 = 0
vim.g.netrw_localcopydircmr        = 'cp -r'

vim.keymap.set('', '<Leader>so', ':so ~/.config/nvim/init.lua<cr>') -- Reload nvim config

-- Tab mappings
vim.keymap.set('', '<Leader>tt', ':tabnew<cr>')
vim.keymap.set('', '<Leader>tc', ':tabclose<cr>')
vim.keymap.set('', '<Leader>tn', ':tabnext<cr>')
vim.keymap.set('', '<Leader>tp', ':tabprevious<cr>')

-- Test mappings
vim.keymap.set('n', '<Leader>t', ':TestFile<cr>')
vim.keymap.set('n', '<Leader>s', ':TestNearest<cr>')
vim.keymap.set('n', '<Leader>l', ':TestLast<cr>')
vim.keymap.set('n', '<Leader>a', ':TestSuite<cr>')
vim.keymap.set('n', '<Leader>gt', ':TestVisit<cr>')
vim.keymap.set('t', '<C-o>', '<C-\\><C-n>')
vim.g['test#strategy'] = "neovim"

-- Quicker window movement
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true })
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true })

-- Misc mappings
vim.keymap.set('n', 'Y', 'y$', { noremap = true })
vim.keymap.set('n', 'n', 'nzzzv', { noremap = true })
vim.keymap.set('n', 'N', 'Nzzzv', { noremap = true })
vim.keymap.set('n', 'J', 'mzJ`z', { noremap = true })
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set('n', 'zo', 'za', { remap = true, desc = "Toggle fold" })

-- Git mappings
vim.keymap.set('n', '<Leader>gb', '<cmd>Git blame<cr>', { noremap = true })

-- Lazygit
vim.keymap.set('n', 'lg', ':tabnew term://lazygit<cr>', { noremap = true })

-- Move highlighted rows
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Insert date in yyyy-mm-dd format
vim.keymap.set("n", "<Leader>d", ':r !date "+\\%Y-\\%m-\\%d"<CR>', { noremap = true, silent = true })

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
