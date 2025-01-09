return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
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
      },
    },
    config = function()
      local lspconfig = require 'lspconfig'

      lspconfig.lua_ls.setup {}
      lspconfig.ruby_lsp.setup {
        init_options = {
          formatter = 'standard',
          linters = { 'standard' },
        }
      }
    end,
    vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, { desc = "GOTO Definition LSP" }),
    vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, { desc = "GOTO References LSP" }),
    vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { desc = "Format the buffer using the LSP" })
  }
}
