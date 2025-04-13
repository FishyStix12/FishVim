return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x", -- Ensure compatibility with stable versions
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required dependency for async functionality
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- Faster fuzzy searching
    "nvim-tree/nvim-web-devicons", -- Adds file icons (optional but recommended)
  },

  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    -- Configure Telescope
    telescope.setup({
      defaults = {
        path_display = { "smart" }, -- Display file paths intelligently
        mappings = {
          i = { -- Keybindings for insert mode
            ["<C-k>"] = actions.move_selection_previous, -- Move to previous result
            ["<C-j>"] = actions.move_selection_next, -- Move to next result
            ["<C-q>"] = function(prompt_bufnr) -- Send selected entries to quickfix list and open it
              actions.send_selected_to_qflist(prompt_bufnr)
              actions.open_qflist(prompt_bufnr)
            end,
          },
        },
      },
    })

    -- Load fzf-native extension for improved performance
    telescope.load_extension("fzf")

    -- Keybindings for quick access
    local keymap = vim.keymap -- Alias for conciseness

    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files in current directory" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Find recently opened files" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Search for a string in project" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in project" })
  end,
}
