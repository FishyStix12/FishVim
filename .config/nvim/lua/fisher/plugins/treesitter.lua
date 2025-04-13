return {
  "nvim-treesitter/nvim-treesitter", -- Treesitter for better syntax highlighting and code parsing
  event = { "BufReadPre", "BufNewFile" }, -- Load when opening a file
  build = ":TSUpdate", -- Automatically update Treesitter parsers
  dependencies = {
    "windwp/nvim-ts-autotag", -- Auto-close and rename HTML/XML tags
  },
  config = function()
    -- Import Treesitter configuration
    local treesitter = require("nvim-treesitter.configs")

    -- Configure Treesitter
    treesitter.setup({
      -- Enable syntax highlighting
      highlight = { enable = true },

      -- Enable automatic indentation
      indent = { enable = true },

      -- Enable automatic tag closing (requires nvim-ts-autotag)
      autotag = { enable = true },

      -- Install these language parsers automatically
      ensure_installed = {
        "json", "javascript", "typescript", "tsx", "yaml", "html", "css",
        "prisma", "markdown", "markdown_inline", "svelte", "graphql", "bash",
        "lua", "vim", "dockerfile", "gitignore", "query", "vimdoc", "c"
      },

      -- Enable incremental selection (expands syntax tree selections)
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>", -- Start incremental selection
          node_incremental = "<C-space>", -- Expand to the next node
          scope_incremental = false, -- Disable scope selection
          node_decremental = "<bs>", -- Shrink selection
        },
      },
    })
  end,
}
