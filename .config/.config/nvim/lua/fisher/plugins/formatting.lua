return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },  -- Trigger on buffer read or new file
  config = function()
    -- Import the conform plugin
    local conform = require("conform")

    -- Configure conform with the desired formatters for each filetype
    conform.setup({
      -- Define the formatters for different file types
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        liquid = { "prettier" },
        lua = { "stylua" },  -- Lua uses Stylua formatter
        python = { "isort", "black" },  -- Python uses isort and black formatters
      },

      -- Options for formatting on save
      format_on_save = {
        lsp_fallback = true,   -- Fallback to LSP if no formatter is available
        async = false,         -- Run formatting synchronously
        timeout_ms = 1000,     -- Timeout after 1000ms if formatting takes too long
      },
    })

    -- Keymap for formatting in normal and visual mode
    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })

    -- Optionally, you can add more keybindings for other formatting actions:
    -- vim.keymap.set("n", "<leader>mf", conform.format, { desc = "Format current buffer" })
  end,
}
