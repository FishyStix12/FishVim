return {

  "nvim-lualine/lualine.nvim",

  event = "VeryLazy", -- Load only when needed

  dependencies = { "nvim-tree/nvim-web-devicons" },

  config = function()

    local lualine = require("lualine")

    local lazy_status = require("lazy.status") -- Lazy plugin update status



    -- FishVim Colorscheme (Matching Theme)

    local colors = {

      blue = "#00BFFF",       -- Electric Blue

      cyan = "#00FFFF",       -- Neon Cyan

      green = "#39FF14",      -- Neon Green

      yellow = "#FFD700",     -- Bright Yellow

      magenta = "#FF00FF",    -- Bright Magenta

      red = "#FF4A4A",        -- Soft Red for errors

      fg = "#39FF14",         -- Neon Green text

      bg = "#000000",         -- Jet Black background

      inactive_bg = "#1A1A1A" -- Dark Gray for inactive status

    }



    -- FishVim Lualine Theme

    local fishvim_lualine_theme = {

      normal = {

        a = { bg = colors.green, fg = colors.bg, gui = "bold" },

        b = { bg = colors.bg, fg = colors.fg },

        c = { bg = colors.bg, fg = colors.fg },

      },

      insert = {

        a = { bg = colors.cyan, fg = colors.bg, gui = "bold" },

      },

      visual = {

        a = { bg = colors.blue, fg = colors.bg, gui = "bold" },

      },

      command = {

        a = { bg = colors.magenta, fg = colors.bg, gui = "bold" },

      },

      replace = {

        a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },

      },

      inactive = {

        a = { bg = colors.inactive_bg, fg = colors.fg, gui = "bold" },

        b = { bg = colors.inactive_bg, fg = colors.fg },

        c = { bg = colors.inactive_bg, fg = colors.fg },

      },

    }



    -- Configure Lualine

    lualine.setup({

      options = {

        theme = fishvim_lualine_theme,

        icons_enabled = true, -- Enable icons

        component_separators = { left = "⬅️", right = "➡️" },

        section_separators = { left = "⬅️", right = "➡️" },

        globalstatus = true, -- Single status line for all windows

      },

      sections = {

        -- Left Section (Mode + Git Branch)

        lualine_a = { { "mode", upper = true } }, -- Displays current mode (NORMAL, INSERT, etc.)

        lualine_b = { { "branch", icon = "😼" } }, -- Displays current Git branch



        -- Center Section (File + LSP Info)

        lualine_c = { 

          { "filename", path = 1, icon = "🏞" }, -- Show filename with relative path

          { "diagnostics", sources = { "nvim_diagnostic" }, symbols = { error = "💢", warn = "⚠️", info = "ℹ️" } }, -- Show LSP diagnostics

        },



        -- Right Section (System Info)

        lualine_x = {

          {

            lazy_status.updates, -- Show Lazy plugin updates

            cond = lazy_status.has_updates,

            color = { fg = colors.yellow },

          },

          { "encoding" }, -- File encoding (e.g., UTF-8)

          { "fileformat", symbols = { unix = "🐧", dos = "💻", mac = "🍎" } }, -- File format with OS icons

          { "filetype" }, -- File type (e.g., Lua, Python)

        },



        -- Progress + Cursor Position

        lualine_y = { "progress" }, -- Show current progress (percentage)

        lualine_z = { "location" }, -- Show cursor position (line:column)

      },



      -- Inactive Statusline (Minimal Look)

      inactive_sections = {

        lualine_c = { "filename" },

        lualine_x = { "location" },

      },

    })

  end,

}

