-- Telescope mappings
vim.keymap.set('n', '<Leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true })
vim.keymap.set('n', '<Leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true })
vim.keymap.set('n', '<Leader>fq', '<cmd>Telescope quickfix<cr>', { noremap = true })
vim.keymap.set('n', '<Leader>fk', '<cmd>Telescope grep_string<cr>', { noremap = true })
vim.keymap.set('n', '<Leader>fb', '<cmd>Telescope buffers<cr>', { noremap = true })
vim.keymap.set('n', '<Leader>fh', '<cmd>Telescope help_tags<cr>', { noremap = true })
vim.keymap.set('n', '<Leader>fo', '<cmd>Telescope oldfiles<cr>', { noremap = true })
vim.keymap.set('n', '<Leader>fw', '<cmd>Telescope grep_string<cr>', { noremap = true })
vim.keymap.set('v', '<Leader>fw', '<cmd>Telescope grep_string<cr>', { noremap = true })

require('telescope').setup({
  defaults = {
    mappings = {
      i = {
        ["<C-f>"] = require('telescope.actions').send_selected_to_qflist,
      },
      n = {
        ["<C-f>"] = require('telescope.actions').send_selected_to_qflist,
      }
    }
  }
})

