return {
  -- Trouble plugin for showing diagnostics, quickfix, location list, and todos in Neovim
  "folke/trouble.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",      -- Required for file type icons in trouble diagnostics
    "folke/todo-comments.nvim",         -- For displaying todos and comments in trouble
  },
  opts = {
    focus = true, -- Focus on the window when toggling Trouble
  },
  cmd = "Trouble",  -- Command to open Trouble window
  keys = {
    -- Keybindings for opening various Trouble views
    { "<leader>xw", "<cmd>Trouble diagnostics toggle<CR>", desc = "Open trouble workspace diagnostics" },  -- Workspace diagnostics
    { "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Open trouble document diagnostics" }, -- Document diagnostics
    { "<leader>xq", "<cmd>Trouble quickfix toggle<CR>", desc = "Open trouble quickfix list" },  -- Quickfix list
    { "<leader>xl", "<cmd>Trouble loclist toggle<CR>", desc = "Open trouble location list" },  -- Location list 
    { "<leader>xt", "<cmd>Trouble todo toggle<CR>", desc = "Open todos in trouble" },  -- Todo list 
  },
}
