vim.pack.add({
  { src = "https://github.com/rafamadriz/friendly-snippets" },
  { src = "https://github.com/saghen/blink.cmp", name ="blink", version = vim.version.range("1.0") }
})

local blink = require("blink.cmp")

blink.setup({
  keymap = { preset = "default" },
  appearance = {
    use_nvim_cmp_as_default = true,
    nerd_font_variant = "mono"
  },
  signature = { enabled = true },
  completion = {
      documentation = { auto_show = true },
      menu = { scrolloff = 0 },
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
  fuzzy = { implementation = "prefer_rust_with_warning" },
})
