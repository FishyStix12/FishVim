return {
  "szw/vim-maximizer", -- Plugin to maximize and restore split windows
  keys = {
    {
      "<leader>sm",
      "<cmd>MaximizerToggle<CR>", -- Toggle maximization of the current split window
      desc = "Maximize/minimize a split",
    },
  },
}
