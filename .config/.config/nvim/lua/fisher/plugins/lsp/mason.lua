return {

  -- Mason for managing LSP servers, linters, formatters, and more

  "williamboman/mason.nvim",

  dependencies = {

    "williamboman/mason-lspconfig.nvim",  -- Automatically install LSP servers

    "williamboman/mason-null-ls.nvim",    -- For null-ls integration (formatters, linters, etc.)

    "nvim-treesitter/nvim-treesitter",    -- Treesitter for advanced syntax highlighting

    "mfussenegger/nvim-dap",             -- nvim-dap for debugging

    "nvim-telescope/telescope.nvim",     -- Telescope for fuzzy finding

    "nvim-telescope/telescope-fzf-native.nvim", -- FZF integration with Telescope

    "neovim/nvim-lspconfig",             -- LSP support for various languages

    "jose-elias-alvarez/null-ls.nvim",   -- Null-ls integration for formatters, linters, and other tools

    "WhoIsSethDaniel/mason-tool-installer.nvim", -- Tool installer for formatters

  },

  config = function()

    -- Import plugins

    local mason = require("mason")

    local mason_lspconfig = require("mason-lspconfig")

    local mason_null_ls = require("mason-null-ls")

    local mason_tool_installer = require("mason-tool-installer")

    local treesitter = require("nvim-treesitter.configs")

    local dap = require("dap")

    local telescope = require("telescope")

    local null_ls = require("null-ls")



    -- Setup Mason for managing tools and servers

    mason.setup({

      ui = {

        icons = {

          package_installed = "✓",

          package_pending = "➜",

          package_uninstalled = "✗",

        },

      },

    })



-- Configure mason-lspconfig to automatically install and manage LSP servers
mason_lspconfig.setup({
  -- Specify which language servers should always be installed
  ensure_installed = {
    -- General-purpose language servers
    "pyright",        -- Python
    "gopls",          -- Go
    "clangd",         -- C/C++

    -- Web development
    "html",           -- HTML
    "cssls",          -- CSS
    "tailwindcss",    -- Tailwind CSS
    "svelte",         -- Svelte framework
    "graphql",        -- GraphQL
    "emmet_ls",       -- Emmet for fast HTML & CSS workflow
    "prismals",       -- Prisma (Database ORM)

    -- Java development
    "jdtls",          -- Java

    -- PHP development
    "intelephense",   -- PHP intelligent language server

    -- Add any other LSP servers you require here
  },

  -- Automatically install missing servers when they are not found
  automatic_installation = true,
})

    -- Setup mason-null-ls for formatters and linters

    mason_null_ls.setup({

      ensure_installed = {

        -- Formatters and linters

        "eslint_d", "prettier", "black", "stylua", "golangci-lint", "clang_format", 

        "phpcs", "ruff", "luacheck", "vulture", "fixjson", -- Add any other formatter or linter you need

      },

    })



    -- Force installation of tools (e.g., prettier, stylua, isort, black)

    mason_tool_installer.setup({

      ensure_installed = {

        "prettier", -- prettier formatter

        "stylua",   -- lua formatter

        "isort",    -- python formatter

        "black",    -- python formatter
        "pylint",   -- python linter
        "eslint_d", -- JS Language linter
      },

      -- Force installation of tools if they are not already installed

      auto_update = true,  -- Automatically update tools if they are outdated

      run_on_start = true, -- Run the installation on startup

    })



    -- Setup Treesitter for better syntax highlighting and parsing

    treesitter.setup({

      ensure_installed = "all",  -- Install all supported languages

      highlight = { enable = true },

      indent = { enable = true },  -- Enable indentation with Treesitter

    })



    -- Configure nvim-dap for debugging

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



    -- Telescope setup with fzf-native extension for faster searching

    telescope.setup({

      defaults = {

        file_ignore_patterns = { "node_modules", "vendor", ".git/" },

      },

      extensions = {

        fzf = {

          fuzzy = true,                    -- Enable fuzzy search

          override_generic_sorter = true,  -- Use fzf for sorting

          override_file_sorter = true,     -- Use fzf for file sorting

        },

      },

    })

    telescope.load_extension("fzf") -- Load fzf extension 



    -- Additional helper functions for telescope 

    vim.keymap.set("n", "<leader>ff", function() telescope.builtin.find_files() end)

    vim.keymap.set("n", "<leader>fg", function() telescope.builtin.live_grep() end)

    vim.keymap.set("n", "<leader>fb", function() telescope.builtin.buffers() end)



    -- Add custom LSP handlers and configurations

    mason_lspconfig.setup_handlers({

      function(server_name)

        require("lspconfig")[server_name].setup({

          -- Example of custom LSP configuration (e.g., on_attach, capabilities, etc.)

        })

      end,

    })



  end,

}

