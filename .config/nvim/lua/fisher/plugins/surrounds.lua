return {
  "kylechui/nvim-surround",           -- Plugin for surrounding text with characters like quotes, parentheses, etc.
  
  event = { "BufReadPre", "BufNewFile" },  -- Load plugin when opening or creating a new file 

  version = "*",                      -- Use for stability, omit for using the latest features from the `main` branch

  config = true,                      -- Automatically configure plugin upon loading

  -- Optionally, custom configuration can be added here if needed:
  -- config = function()
  --   require("nvim-surround").setup({
  --     -- Custom configurations for nvim-surround (e.g., custom key mappings, etc.)
  --   })
  -- end,
}
