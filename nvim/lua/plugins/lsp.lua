-- Enable all LSP servers (configs are in lsp/ directory)
vim.lsp.enable({ "herb_ls", "lua_ls", "ruby_lsp", "clangd" })

-- LSP keymaps
vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, { desc = "GOTO Definition LSP" })
vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, { desc = "GOTO References LSP" })
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { desc = "Format the buffer using the LSP" })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic error messages' })

return {
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  }
}
