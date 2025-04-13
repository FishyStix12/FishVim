return {
  "windwp/nvim-autopairs", -- Plugin for automatically closing pairs like (), {}, []
  event = { "InsertEnter" }, -- Load only when entering Insert mode (improves startup time)
  dependencies = {
    "hrsh7th/nvim-cmp", -- Autocompletion plugin (for integration)
  },
  config = function()
    -- Import nvim-autopairs
    local autopairs = require("nvim-autopairs")

    -- Configure nvim-autopairs
    autopairs.setup({
      check_ts = true, -- Enable Treesitter integration for better pair management
      ts_config = {
        lua = { "string" }, -- Prevent adding pairs inside Lua string nodes
        javascript = { "template_string" }, -- Prevent adding pairs inside JavaScript template strings
        java = false, -- Disable Treesitter checks for Java
      },
    })

    -- Import nvim-autopairs integration with nvim-cmp
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")

    -- Import nvim-cmp (completion plugin)
    local cmp = require("cmp")

    -- Make nvim-autopairs work with completion
    -- Automatically insert closing pairs when completing functions/methods
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}
