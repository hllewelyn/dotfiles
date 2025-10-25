vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", name = "treesitter" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" }
})

local configs = require("nvim-treesitter.configs")

configs.setup({
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "ruby", "javascript", "html", "css" },
  auto_install = false,
  sync_install = false,
  highlight = { enable = true },
  indent = { enable = true },
  additional_vim_regex_highlighting = true,
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["am"] = "@function.outer",
        ["im"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner",
      },
    },
  },
})

vim.api.nvim_create_autocmd("PackChanged", {
  desc = "Handle nvim-treesitter updates",
  group = vim.api.nvim_create_augroup("nvim-treesitter-pack-changed-update-handler", { clear = true }),
  callback = function(event)
    if event.data.kind == "update" then
      vim.notify("nvim-treesitter updated, running TSUpdate...", vim.log.levels.INFO)
      local ok = pcall(vim.cmd, "TSUpdate")
      if ok then
        vim.notify("TSUpdate completed successfully!", vim.log.levels.INFO)
      else
        vim.notify("TSUpdate command not available yet, skipping", vim.log.levels.WARN)
      end
    end
  end
})
