return {
  -- Plugin repository: Provides indentation guides to improve code readability
  "lukas-reineke/indent-blankline.nvim",
  
  -- Load the plugin on these events to optimize performance
  event = { "BufReadPre", "BufNewFile" }, -- Triggers before reading a buffer or creating a new file

  -- Specify the main module for the plugin (ensures proper initialization)
  main = "ibl",

  -- Plugin configuration options
  opts = {
    indent = { 
      char = "┊", -- Character used for indentation guides (can be customized)
    },
  },
}
