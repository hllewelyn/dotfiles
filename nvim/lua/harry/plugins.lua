local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.vim/plugged')

Plug 'pbrisbin/vim-mkdir'
Plug 'tpope/vim-bundler'
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


-- Themeing
Plug 'f-person/auto-dark-mode.nvim'
Plug('sonph/onehalf', { rtp = 'vim/' })
Plug 'projekt0n/github-nvim-theme'

-- Plug 'mattn/emmet-vim'
-- Plug 'pangloss/vim-javascript'
-- Plug 'MaxMEllon/vim-jsx-pretty'
-- Plug 'styled-components/vim-styled-components'

-- Treesitter
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'sharkdp/fd'
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate' })  -- We recommend updating the parsers on update
Plug 'nvim-treesitter/nvim-treesitter-context'

-- LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim'
Plug 'williamboman/nvim-lsp-installer'

-- LuaSnip
-- Plug 'L3MON4D3/LuaSnip'

vim.call('plug#end')
