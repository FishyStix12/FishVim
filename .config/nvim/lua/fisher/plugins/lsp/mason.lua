return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "williamboman/mason-null-ls.nvim",
    "nvim-treesitter/nvim-treesitter",
    "mfussenegger/nvim-dap",
    "nvim-telescope/telescope.nvim",
    "nvim-telescope/telescope-fzf-native.nvim",
    "neovim/nvim-lspconfig",
    "jose-elias-alvarez/null-ls.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_null_ls = require("mason-null-ls")
    local mason_tool_installer = require("mason-tool-installer")
    local treesitter = require("nvim-treesitter.configs")
    local dap = require("dap")
    local telescope = require("telescope")
    local lspconfig = require("lspconfig")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "pyright", "clangd", "html", "cssls", "tailwindcss",
        "svelte", "graphql", "emmet_ls", "prismals", "jdtls", "intelephense"
      },
      automatic_installation = true,
    })

    -- Set up each LSP server manually
    local servers = {
      "pyright", "gopls", "clangd", "html", "cssls", "tailwindcss",
      "svelte", "graphql", "emmet_ls", "prismals", "jdtls", "intelephense"
    }

    for _, server in ipairs(servers) do
      lspconfig[server].setup({})
    end

    mason_null_ls.setup({
      ensure_installed = {
        "eslint_d", "prettier", "black", "stylua", "golangci-lint",
        "clang_format", "phpcs", "ruff", "luacheck", "vulture", "fixjson",
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier", "stylua", "isort", "black", "pylint", "eslint_d",
      },
      auto_update = true,
      run_on_start = true,
    })

    treesitter.setup({
      ensure_installed = "all",
      highlight = { enable = true },
      indent = { enable = true },
    })

    dap.adapters.python = {
      type = "executable",
      command = "/usr/bin/python",
      args = { "-m", "debugpy.adapter" },
    }

    dap.configurations.python = {
      {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
      },
    }

    dap.adapters.node2 = {
      type = "executable",
      command = "node",
      args = { os.getenv("HOME") .. "/vscode-node-debug2/out/src/nodeDebug.js" },
    }

    dap.configurations.javascript = {
      {
        type = "node2",
        request = "launch",
        name = "Launch Program",
        program = "${file}",
      },
    }

    telescope.setup({
      defaults = {
        file_ignore_patterns = { "node_modules", "vendor", ".git/" },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
        },
      },
    })

    telescope.load_extension("fzf")

    vim.keymap.set("n", "<leader>ff", function() telescope.builtin.find_files() end)
    vim.keymap.set("n", "<leader>fg", function() telescope.builtin.live_grep() end)
    vim.keymap.set("n", "<leader>fb", function() telescope.builtin.buffers() end)
  end,
}
