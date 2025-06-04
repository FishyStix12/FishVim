return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",            -- completion engine
    "hrsh7th/cmp-nvim-lsp",        -- LSP completion source
    "L3MON4D3/LuaSnip",            -- snippet engine
    "jose-elias-alvarez/null-ls.nvim",
    "williamboman/mason-null-ls.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_null_ls = require("mason-null-ls")
    local mason_tool_installer = require("mason-tool-installer")
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    -- Setup Mason
    mason.setup()

    mason_lspconfig.setup({
      ensure_installed = {
        "pyright", "lua_ls", "tsserver", "html", "cssls",
        "tailwindcss", "svelte", "graphql", "emmet_ls", "bashls",
      },
      automatic_installation = true,
    })

    -- LSP capabilities (for autocompletion)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Basic server setup
    local servers = {
      "pyright", "lua_ls", "tsserver", "html", "cssls",
      "tailwindcss", "svelte", "graphql", "emmet_ls", "bashls",
    }

    for _, server in ipairs(servers) do
      lspconfig[server].setup({
        capabilities = capabilities,
      })
    end

    -- Mason Null-LS setup
    mason_null_ls.setup({
      ensure_installed = {
        "prettier", "stylua", "eslint_d", "black", "shfmt",
        "clang_format", "shellcheck",
      },
    })

    -- Auto-install formatters and linters
    mason_tool_installer.setup({
      ensure_installed = {
        "prettier", "stylua", "eslint_d", "black", "shfmt", "shellcheck"
      },
      auto_update = true,
      run_on_start = true,
    })
  end,
}
