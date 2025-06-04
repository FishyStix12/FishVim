return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
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

    mason.setup()

    mason_lspconfig.setup({
      ensure_installed = {
        "pyright", "lua_ls", "tsserver", "html", "cssls",
        "tailwindcss", "svelte", "graphql", "emmet_ls", "bashls",
      },
      automatic_installation = true,
    })

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local servers = {
      "pyright",
      "lua_ls",
      "tsserver",
      "html",
      "cssls",
      "tailwindcss",
      "svelte",
      "graphql",
      "emmet_ls",
      "bashls",
    }

    for _, server in ipairs(servers) do
      lspconfig[server].setup({
        capabilities = capabilities,
      })
    end

    mason_null_ls.setup({
      ensure_installed = { "prettier", "stylua", "eslint_d", "black" },
    })

    mason_tool_installer.setup({
      ensure_installed = { "prettier", "stylua", "eslint_d", "black" },
      auto_update = true,
      run_on_start = true,
    })
  end,
}

