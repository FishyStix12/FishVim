-- Define the path where lazy.nvim will be installed
-- `vim.fn.stdpath("data")` returns the path to Neovim's data directory.
-- This is where Neovim stores runtime files, including plugins.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check if the lazy.nvim directory exists
-- `vim.loop.fs_stat(lazypath)` checks if the folder exists at the specified location.
-- If it does NOT exist, then we download and install it.
if not vim.loop.fs_stat(lazypath) then
  -- Use `vim.fn.system()` to run a shell command that clones the plugin from GitHub.
  -- This fetches the "lazy.nvim" plugin manager so we can use it.
  vim.fn.system({
    "git",  -- Command to use Git
    "clone",  -- Clone a repository
    "--filter=blob:none",  -- Optimize download by skipping unnecessary files
    "https://github.com/folke/lazy.nvim.git",  -- URL of the plugin repository
    "--branch=stable",  -- Fetch the latest stable version (instead of development)
    lazypath,  -- Install it in the lazypath directory
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ { import = "fisher.plugins"}, { import = "fisher.plugins.lsp"} }, {
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})
-- Add lazy.nvim to Neovim's runtime path (`rtp`)
-- This tells Neovim: "Look inside this folder for plugins and scripts!"

-- ========================
-- Where Are Plugins Stored?
-- ========================
-- When you install plugins using a plugin manager (like lazy.nvim or packer.nvim),
-- they are stored inside Neovim's *data* directory.
-- - On **Linux/macOS**, plugins go here:
--   ~/.local/share/nvim/lazy/
-- - On **Windows**, plugins go here:
--   C:\Users\YourName\AppData\Local\nvim-data\lazy\
-- This location is **automatically detected** using `vim.fn.stdpath("data")`,
-- so your setup works **on any operating system** without needing hardcoded paths!
