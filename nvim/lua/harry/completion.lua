-- Setup nvim-cmp.
vim.opt.completeopt = { "menu", "menuone", "noselect" }

local lspkind = require "lspkind"
lspkind.init()
local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- expand = function(args)
    --   require('luasnip').lsp_expand(args.body)
    -- end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ["<tab>"] = cmp.config.disable,
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'buffer', keyword_length = 5 },
    { name = 'path' },
  }),
  formatting = {
    format = lspkind.cmp_format {
      mode = 'text',
      menu = {
        buffer = "[buf]",
        path = "[path]",
        nvim_lua = "[api]",
        nvim_lsp = "[LSP]"
      }
    }
  },
  view = {
    entries = 'native',
  },
  experimental = {
    ghost_text = true,
  }
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})
