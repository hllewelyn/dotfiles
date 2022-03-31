vim.g.mapleader = " "

local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.vim/plugged')

Plug 'ervandew/supertab'
Plug 'pbrisbin/vim-mkdir'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-test/vim-test'
Plug 'dense-analysis/ale'
Plug('sonph/onehalf', { rtp = 'vim/' })
Plug('fatih/vim-go', { ['do'] = ':GoUpdateBinaries' })

Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'styled-components/vim-styled-components'

-- Treesitter
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'sharkdp/fd'
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate' })  -- We recommend updating the parsers on update

-- LSP
Plug 'neovim/nvim-lspconfig'
-- Plug 'hrsh7th/cmp-nvim-lsp'
-- Plug 'hrsh7th/cmp-buffer'
-- Plug 'hrsh7th/cmp-path'
-- Plug 'hrsh7th/cmp-cmdline'
-- Plug 'hrsh7th/nvim-cmp'

vim.call('plug#end')

-- require'lspconfig'.solargraph.setup{}
vim.opt.compatible = false
vim.opt.autoread = true            -- automatically reload if file changes outside of vim
vim.opt.ruler = true		-- show the cursor position all the time
vim.opt.number = true		-- show line numbers
vim.opt.relativenumber = true      -- show relative line numbers
vim.opt.numberwidth=5	-- width of the number gutter
vim.opt.showmode = false		-- hide --INSERT-- in cmdline
vim.opt.hls = true			-- highlight search results
vim.opt.splitbelow = true 		-- open horizontal splits below
vim.opt.splitright = true		-- open vertical splits to the right
vim.opt.backspace = "indent,eol,start" -- backspace over everything in insert
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.history = 200
vim.opt.autoindent = true -- always have automatic indenting on
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.expandtab = true -- spaces instead of tabs
vim.opt.scrolloff = 3 -- start scrolling 5 lines before edge of viewport
vim.opt.clipboard = vim.opt.clipboard + 'unnamedplus'
vim.opt.mouse = 'a'
vim.opt.foldlevel = 1
vim.opt.foldmethod = 'syntax'
vim.opt.termguicolors = true
vim.opt.textwidth=110

-- Netrw
vim.g.netrw_winsize = 30
vim.g.netrw_banner = 0
vim.g.netrw_localcopydircmr = 'cp -r'

-- Ale
vim.g.ale_linters = {ruby = 'standardrb', javascript = 'eslint'}
vim.g.ale_linters_explicit  = 1
vim.g.ale_fixers = {ruby = 'standardrb', javascript = 'prettier'}
vim.g.ale_fix_on_save = 1

-- Ruby Vim
vim.g.ruby_indent_assignment_style = 'variable'

-- Themeing
vim.cmd('colorscheme onehalflight')
vim.cmd('syntax enable')
vim.cmd [[
  " Change the color of the editor after 120 chars, except for the quickfix panel.
  let &colorcolumn=join(range(121,999),",")
  au FileType qf setlocal nonumber colorcolumn=

  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

  " Shortcut commands to change the colorscheme - mainly used for pairing
  command! DD execute "colorscheme onehalfdark"
  command! DL execute "colorscheme onehalflight"
]]

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

-- Telescope mappings
vim.keymap.set('n', '<Leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true })
vim.keymap.set('n', '<Leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true })
vim.keymap.set('n', '<Leader>fk', '<cmd>Telescope grep_string<cr>', { noremap = true })
vim.keymap.set('n', '<Leader>fb', '<cmd>Telescope buffers<cr>', { noremap = true })
vim.keymap.set('n', '<Leader>fh', '<cmd>Telescope help_tags<cr>', { noremap = true })
vim.keymap.set('n', '<Leader>fo', '<cmd>Telescope oldfiles<cr>', { noremap = true })

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
