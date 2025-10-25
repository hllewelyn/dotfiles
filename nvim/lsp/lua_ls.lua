vim.lsp.config('lua_ls', {
  settings {
    Lua = {
      diagnostics = {
        disable = { "missing-fields" },
      },
    }
  }
})

return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".luarc.json", ".git" },
}
