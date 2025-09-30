local keymap = vim.keymap

keymap.set('', '<Leader>so', ':so ~/.config/nvim/init.lua<cr>') -- Reload nvim config

-- Tab mappings
keymap.set('', '<Leader>tt', ':tabnew<cr>')
keymap.set('', '<Leader>tc', ':tabclose<cr>')
keymap.set('', '<Leader>tn', ':tabnext<cr>')
keymap.set('', '<Leader>tp', ':tabprevious<cr>')

-- Test mappings
keymap.set('n', '<Leader>t', ':TestFile<cr>')
keymap.set('n', '<Leader>s', ':TestNearest<cr>')
keymap.set('n', '<Leader>l', ':TestLast<cr>')
keymap.set('n', '<Leader>a', ':TestSuite<cr>')
keymap.set('n', '<Leader>gt', ':TestVisit<cr>')
keymap.set('t', '<C-o>', '<C-\\><C-n>')
vim.g['test#strategy'] = "neovim"

-- Quicker window movement
keymap.set('n', '<C-j>', '<C-w>j', { noremap = true })
keymap.set('n', '<C-k>', '<C-w>k', { noremap = true })
keymap.set('n', '<C-h>', '<C-w>h', { noremap = true })
keymap.set('n', '<C-l>', '<C-w>l', { noremap = true })

-- Misc mappings
keymap.set('n', 'Y', 'y$', { noremap = true })
keymap.set('n', 'n', 'nzzzv', { noremap = true })
keymap.set('n', 'N', 'Nzzzv', { noremap = true })
keymap.set('n', 'J', 'mzJ`z', { noremap = true })
keymap.set("x", "<leader>p", [["_dP]])
keymap.set('n', 'zo', 'za', { remap = true, desc = "Toggle fold" })

-- Git mappings
keymap.set('n', '<Leader>gb', '<cmd>Git blame<cr>', { noremap = true })

-- Lazygit
keymap.set('n', 'lg', ':tabnew term://lazygit<cr>', { noremap = true })

-- Move highlighted rows
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Insert date with start of list in yyyy-mm-dd format
keymap.set("n", "<Leader>d", function()
  local date = os.date("%Y-%m-%d")
  local line = "## " .. date
  vim.api.nvim_put({line, "- ", ""}, "l", true, true)
  vim.cmd("normal! 2k")
  vim.cmd("startinsert!")
end, { noremap = true, silent = true })
