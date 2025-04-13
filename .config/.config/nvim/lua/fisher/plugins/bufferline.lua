return {
  "akinsho/bufferline.nvim",
  event = "BufReadPre", -- Load bufferline only when a file is opened (reduces startup time)
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- Enables file icons in the bufferline
  version = "*", -- Always use the latest version of the plugin
  config = function()
    require("bufferline").setup({
      options = {
        mode = "tabs", -- Use tabs instead of buffers (easier window management)
        separator_style = "slant", -- Sets the separator style between tabs
        numbers = "ordinal", -- Displays buffer numbers for quick navigation
        diagnostics = "nvim_lsp", -- Show LSP diagnostics on buffers
        show_buffer_close_icons = true, -- Display close icons for each buffer
        show_close_icon = false, -- Hides the global close button (not needed)
        always_show_bufferline = true, -- Keep bufferline visible even with a single buffer
        hover = {
          enabled = true, -- Enables hover actions
          delay = 200, -- Delay before hover actions activate
          reveal = { "close" }, -- Shows close button when hovering over a buffer
        },
        offsets = { -- Adds an offset for the NvimTree file explorer
          {
            filetype = "NvimTree",
            text = "File Explorer", -- Title displayed when NvimTree is open
            highlight = "Directory", -- Applies 'Directory' highlight group to the title
            text_align = "center", -- Center aligns the text
          },
        },
      },
    })

    -- Keybindings for buffer management
    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true } -- Common options for keybindings

    -- Navigate between buffers
    keymap("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Go to next buffer", noremap = true, silent = true }) -- Next buffer
    keymap("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Go to previous buffer", noremap = true, silent = true }) -- Previous buffer

    -- Buffer picking & closing
    keymap("n", "<leader>bp", "<cmd>BufferLinePick<CR>", { desc = "Pick a buffer", noremap = true, silent = true }) -- Highlight available buffers to switch to
    keymap("n", "<leader>bc", "<cmd>BufferLinePickClose<CR>", { desc = "Pick & close a buffer", noremap = true, silent = true }) -- Pick a buffer to close

    -- Move buffers left/right
    keymap("n", "<leader>bl", "<cmd>BufferLineMoveNext<CR>", { desc = "Move buffer right", noremap = true, silent = true }) -- Move buffer right
    keymap("n", "<leader>bh", "<cmd>BufferLineMovePrev<CR>", { desc = "Move buffer left", noremap = true, silent = true }) -- Move buffer left

    -- Sorting buffers
    keymap("n", "<leader>bs", "<cmd>BufferLineSortByExtension<CR>", { desc = "Sort buffers by extension", noremap = true, silent = true }) -- Sort buffers by file extension

    -- Close current buffer
    keymap("n", "<leader>bd", "<cmd>bd<CR>", { desc = "Close current buffer", noremap = true, silent = true }) -- Close the currently active buffer
  end,
}
