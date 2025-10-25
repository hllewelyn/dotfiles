vim.pack.add({
  "https://github.com/nvim-telescope/telescope.nvim" ,
  "https://github.com/nvim-lua/plenary.nvim"
}, { confirm = false })

local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

telescope.setup({
  defaults = {
  },
  extensions = {
    fzf = {}
  },
  pickers = {
    help_tags = {
      mappings = {
        i = {
          ["<CR>"] = actions.select_vertical,
        },
        n = {
          ["<CR>"] = actions.select_vertical,
        },
      },
    },
  }
})

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Fuzzily find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Fuzzily grep' })
vim.keymap.set('n', '<leader>fb', function() builtin.buffers({ sort_mru = true }) end, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Fuzzily find Neovim help topics' })
vim.keymap.set('n', '<leader>fc', builtin.git_commits, { desc = 'Fuzzily find Git commits' })
vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = 'Telescope resume previous' })
vim.keymap.set({ 'n', 'v' }, '<leader>fw', builtin.grep_string, { desc = 'Grep word under cursor' })
vim.keymap.set({ 'n', 'v' }, '<leader>fs', builtin.spell_suggest,
  { desc = 'Show spelling suggestions for word under cursor' })
vim.keymap.set({ 'n', 'v' }, '<leader>fd', builtin.diagnostics, { desc = 'Show diagnostics in open buffers' })
