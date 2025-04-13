return {
  "gbprod/substitute.nvim", -- Plugin for advanced substitution in Neovim
  event = { "BufReadPre", "BufNewFile" }, -- Load when opening or creating a file 
  config = function()
    -- Import substitute.nvim plugin 
    local substitute = require("substitute")

    -- Initialize substitute.nvim with default settings
    substitute.setup()

    -- Keybindings for substitution operations
    local keymap = vim.keymap -- For conciseness

    keymap.set("n", "s", substitute.operator, { desc = "Substitute with motion" }) -- Replace text with motion (e.g., 'siw' replaces a word)
    keymap.set("n", "ss", substitute.line, { desc = "Substitute entire line" }) -- Replace the entire line
    keymap.set("n", "S", substitute.eol, { desc = "Substitute until end of line" }) -- Replace from cursor to end of line
    keymap.set("x", "s", substitute.visual, { desc = "Substitute in visual mode" }) -- Replace selected text in visual mode
  end,
}
