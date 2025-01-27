return {
  {
    "vim-ruby/vim-ruby",
    enabled = false,
    init = function()
      vim.g.ruby_indent_assignment_style = "variable"
    end
  }
}
