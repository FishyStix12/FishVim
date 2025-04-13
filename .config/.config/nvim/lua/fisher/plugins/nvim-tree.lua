return {

  "nvim-tree/nvim-tree.lua",

  dependencies = "nvim-tree/nvim-web-devicons", -- Enables file icons in the explorer

  config = function()

    local nvimtree = require("nvim-tree")



    -- Disable netrw (default file explorer) to avoid conflicts

    vim.g.loaded_netrw = 1

    vim.g.loaded_netrwPlugin = 1



    -- Load and configure Nvim-Tree

    require("nvim-tree").setup({

      -- Configure appearance of the file explorer

      view = {

        width = 35, -- Set the width of the Nvim-Tree window

        relativenumber = true, -- Show relative line numbers

      },



      -- Customize folder and file icons

      renderer = {

        highlight_git = true, -- Enable Git highlight

        highlight_opened_files = "all", -- Highlight all opened files

        root_folder_label = ":t", -- Show folder name instead of full path

        indent_markers = {

          enable = true, -- Show indent markers for folder depth

        },

        icons = {

          show = {

            file = true,
            folder = true,

            folder_arrow = true,

            git = true,

          },

          glyphs = {

            default = "💣",

            symlink = "🙂", -- Symlink file

            git = {

              unstaged = "✗", -- Changes not staged

              staged = "✓", -- Staged changes

              unmerged = "🔀", -- Merge conflict

              renamed = "➜", -- Renamed file

              deleted = "🚮", -- Deleted file

              untracked = "🪄", -- New untracked file

              ignored = "🤫", -- Git ignored file

            },

            folder = {

              arrow_closed = "→", -- Closed folder

              arrow_open = "↓", -- Open folder

              default = "📁", -- Folder closed

              open = "📂", -- Folder open

              empty = "🪫", -- Empty folder closed

              empty_open = "😮", -- Empty folder open

              symlink = "🔗", -- Symlink folder

            },

          },

        },

      },



      -- Improve file opening behavior

      actions = {

        open_file = {

          window_picker = {

            enable = false, -- Disable window picker to improve split-window behavior

          },

        },

      },



      -- Hide specific files from appearing in the tree

      filters = {

        custom = { ".DS_Store" }, -- Hide macOS system files

      },



      -- Show git-ignored files in the tree (change to `true` to hide ignored files)

      git = {

        enable = true,

        ignore = false,

        show_on_dirs = true,

        show_on_open_dirs = true,

        timeout = 400,

      },

    })



    -- Keybindings for Nvim-Tree

    local keymap = vim.keymap

    keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })

    keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" })

    keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })

    keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })

  end,

}

