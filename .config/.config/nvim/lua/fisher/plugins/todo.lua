return {
  "folke/todo-comments.nvim", -- Highlight and navigate TODO, FIXME, and other comments 
  event = { "BufReadPre", "BufNewFile" }, -- Load only when opening or creating a file (improves startup time)
  dependencies = { "nvim-lua/plenary.nvim" }, -- Required dependency for async processing
  config = function()
    -- Import todo-comments plugin
    local todo_comments = require("todo-comments")

    -- Keybindings for navigating TODO comments 
    local keymap = vim.keymap -- For conciseness

    keymap.set("n", "]t", function()
      todo_comments.jump_next()
    end, { desc = "Jump to next TODO comment" }) -- Jump to the next TODO, FIXME, or similar comment 

    keymap.set("n", "[t", function()
      todo_comments.jump_prev()
    end, { desc = "Jump to previous TODO comment" }) -- Jump to the previous TODO, FIXME, or similar comment 

    -- Initialize todo-comments with default settings
    todo_comments.setup()
  end,
}
