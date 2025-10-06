-- Enable all LSP servers (configs are in lsp/ directory)
vim.lsp.enable({
  "clangd",
  "herb_ls",
  "lua_ls",
  "ruby_lsp"
})

vim.diagnostic.config({
  float = {
    border = "single",
    source = true,
    -- Additional spacing options
    max_width = 80,
    max_height = 20,
  },
  virtual_text = false,
  virtual_lines = { current_line = true }
})

local diagnostics = {
  "DiagnosticUnderlineError",
  "DiagnosticUnderlineWarn",
  "DiagnosticUnderlineInfo",
  "DiagnosticUnderlineHint"
}

for _, diagnostic in ipairs(diagnostics) do
  local hl = vim.api.nvim_get_hl(0, { name = diagnostic })
  hl.undercurl = true
  hl.underline = nil  -- remove straight underline
  vim.api.nvim_set_hl(0, diagnostic, hl)
end

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    local opts = { silent = true }

    if client:supports_method('textDocument/formatting') then
      vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, opts)
    end

    opts.desc = "Go to definition"
    vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, opts)

    opts.desc = "Show LSP references"
    vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts)

    opts.desc = "Show diagnostics in floating window"
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
  end,
})
