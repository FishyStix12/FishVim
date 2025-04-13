return {
  -- Auto-completion plugin
  "hrsh7th/nvim-cmp",

  -- Load plugin when entering insert mode (optimizes performance)
  event = "InsertEnter",

  -- Dependencies for enhanced auto-completion features
  dependencies = {
    "hrsh7th/cmp-buffer", -- Completion source for text in the current buffer
    "hrsh7th/cmp-path", -- Completion source for filesystem paths
    {
      "L3MON4D3/LuaSnip", -- Snippet engine
      version = "v2.*", -- Use latest major v2 release
      build = "make install_jsregexp", -- Optional: Enables regex support for snippets
    },
    "saadparwaiz1/cmp_luasnip", -- Enables Luasnip integration with nvim-cmp
    "rafamadriz/friendly-snippets", -- Predefined snippet collection
    "onsails/lspkind.nvim", -- Adds VS Code-like icons to completion menu
  },

  -- Configuration function to set up nvim-cmp
  config = function()
    -- Load required modules
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    -- Load VS Code-style snippets from installed plugins (e.g., friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()

    -- Configure nvim-cmp
    cmp.setup({
      -- Auto-completion behavior
      completion = {
        completeopt = "menu,menuone,preview,noselect", -- Controls popup behavior
      },

      -- Configure snippet expansion behavior
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body) -- Expand snippet using LuaSnip
        end,
      },

      -- Key mappings for navigation and interaction in the completion menu
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- Move to previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(), -- Move to next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- Scroll documentation up
        ["<C-f>"] = cmp.mapping.scroll_docs(4), -- Scroll documentation down
        ["<C-Space>"] = cmp.mapping.complete(), -- Trigger completion menu
        ["<C-e>"] = cmp.mapping.abort(), -- Close completion menu
        ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Confirm selection
      }),

      -- Define completion sources in priority order
      sources = cmp.config.sources({
        { name = "nvim_lsp"}, -- LSP 
        { name = "luasnip" }, -- Snippets
        { name = "buffer" }, -- Text from current buffer
        { name = "path" }, -- File paths
      }),

      -- Formatting settings for completion menu (adds icons and truncates long items)
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50, -- Limit completion item width
          ellipsis_char = "...", -- Show "..." for truncated items
        }),
      },
    })
  end,
}
