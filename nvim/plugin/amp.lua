vim.pack.add({
  { src = "https://github.com/sourcegraph/amp.nvim" }
}, { load = true })

require('amp').setup({ auto_start = true, log_level = "info" })
