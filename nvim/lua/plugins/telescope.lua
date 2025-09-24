return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",

      -- Allow seaching using FZF syntax
      --
      -- "telescope-fzf-native.nvim is a c port of fzf. It only covers the algorithm
      -- and implements few functions to support calculating the score. This means
      -- that the fzf syntax is supported:"
      --
      -- +------------+----------------------------+------------------------------------+
      -- | Token      | Match type                 | Description                        |
      -- +------------+----------------------------+------------------------------------+
      -- | sbtrkt     | fuzzy-match                | Items that match sbtrkt            |
      -- | 'wild      | exact-match (quoted)       | Items that include wild            |
      -- | ^music     | prefix-exact-match         | Items that start with music        |
      -- | .mp3$      | suffix-exact-match         | Items that end with .mp3           |
      -- | !fire      | inverse-exact-match        | Items that do not include fire     |
      -- | !^music    | inverse-prefix-exact-match | Items that do not start with music |
      -- | !.mp3$     | inverse-suffix-exact-match | Items that do not end with .mp3    |
      -- +------------+---------------------------+-------------------------------------+
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
    },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Fuzzily find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Fuzzily grep" },
      {
        "<leader>fb", function()
          require("telescope.builtin").buffers({
            -- Sorts all buffers by most recently used
            sort_mru = true
          })
        end,
        desc = 'Telescope buffers'
      },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Fuzzily find Neovim help topics" },
      { "<leader>fc", "<cmd>Telescope git_commits<cr>", desc = "Fuzzily find Git commits" },
      { "<leader>fr", function () require("telescope.builtin").resume() end, desc = 'Telescope resume previous' },
      { "<leader>fw", "<cmd>Telescope grep_string<cr>", desc = "Grep word under cursor", mode = { "n", "v" } },
      { "<leader>fs", "<cmd>Telescope spell_suggest<cr>", desc = "Show spelling suggestions for word under cursor", mode = { "n", "v" } },
      { "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Show diagnostics in open buffers", mode = { "n", "v" } },
    },
    config = function ()
      require("telescope").setup({
        defaults = {
        },
        extensions = {
          fzf = {}
        }
      })

      -- Load telescope-fzf-native.nvim extension
      require('telescope').load_extension('fzf')
    end
  }
}
