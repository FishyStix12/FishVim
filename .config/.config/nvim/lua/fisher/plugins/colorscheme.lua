return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = false,
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { fg = "#FF00FF" }, -- Bright magenta keywords
          functions = { fg = "#00BFFF" }, -- Electric blue functions
          variables = { fg = "#39FF14" }, -- Neon green variables
          strings = { fg = "#FFD700" }, -- Bright yellow strings
          constants = { fg = "#FFD700" }, -- Bright yellow constants
        },
        on_colors = function(colors)
          -- Background
          colors.bg = "#000000" -- Jet black background
          colors.bg_dark = "#000000"
          colors.bg_float = "#000000"
          colors.bg_highlight = "#1A1A1A"
          colors.bg_sidebar = "#000000"
          colors.bg_statusline = "#000000"
          colors.bg_visual = "#00FFFF" -- Cyan selection
          
          -- Borders & UI Accents
          colors.border = "#00BFFF" -- Electric blue borders
          colors.fg = "#39FF14" -- Neon green text
          colors.fg_dark = "#008000" -- Dark green for secondary text
          colors.fg_gutter = "#228B22" -- Deep green line numbers
          colors.fg_sidebar = "#39FF14"
          colors.bg_search = "#FFD700" -- Bright yellow search highlight

          -- Extra Cyberpunk Accents
          colors.blue = "#00BFFF"
          colors.blue1 = "#00FFFF"
          colors.blue2 = "#00FFFF"
          colors.blue5 = "#5F9EA0"
        end,
      })

      -- Apply colorscheme
      vim.cmd([[colorscheme tokyonight]])

      -- Additional UI tweaks
      vim.cmd([[      
        highlight Normal guibg=#000000 guifg=#39FF14
        highlight Comment guifg=#008000 gui=italic
        highlight CursorLine guibg=#1A1A1A
        highlight LineNr guifg=#228B22
        highlight CursorLineNr guifg=#39FF14 gui=bold
        highlight StatusLine guibg=#000000 guifg=#39FF14
        highlight Visual guibg=#00FFFF
        highlight Function guifg=#00BFFF
        highlight Keyword guifg=#FF00FF
        highlight Statement guifg=#00FFFF
        highlight Type guifg=#FFD700
        highlight String guifg=#FFD700
        highlight Constant guifg=#FFD700
        highlight FloatBorder guifg=#00BFFF guibg=#000000
        highlight PmenuBorder guifg=#00BFFF guibg=#000000
        highlight NetrwHeader guifg=#00BFFF guibg=NONE
      ]])

      -- Function: Electric Blue
      -- Keywords: Bright Magenta
      -- Strings/Constants: Bright Yellow
      -- Borders & UI highlights: Electric Blue
      -- Search & Selection: Cyan
    end,
  },
}
