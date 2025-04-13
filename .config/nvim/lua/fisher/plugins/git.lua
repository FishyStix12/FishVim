return {
  -- LazyGit integration for Neovim
  "kdheepak/lazygit.nvim",

  -- Commands provided by LazyGit (autoloads plugin when any of these are used)
  cmd = {
    "LazyGit",                  -- Open LazyGit UI
    "LazyGitConfig",            -- Open LazyGit config file
    "LazyGitCurrentFile",       -- Show Git status for the current file
    "LazyGitFilter",            -- Open LazyGit with specific filter
    "LazyGitFilterCurrentFile", -- Open LazyGit with a filter on the current file
  },

  -- Optional dependency required for floating window support
  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  -- Keybinding to open LazyGit using leader key ('<leader>lg')
  -- Using 'keys' ensures the plugin is only loaded when the keybinding is triggered
  keys = {
    { "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open LazyGit UI" },
  },
}
