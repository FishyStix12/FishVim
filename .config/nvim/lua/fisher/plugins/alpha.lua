return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    -- Load required modules
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Function: Retrieves the current date and time for the startup screen
    local function get_datetime()
      return os.date("📅 %A, %B %d, %Y  🕒 %I:%M %p") -- Formats date and time
    end

    -- Header Section: FishVim ASCII Banner
    -- This appears at the top of the startup screen
    dashboard.section.header.val = {
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⣠⣤⣤⠶⠶⠶⠶⠾⠛⠛⠛⠛⠛⠛⠛⢿",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⣶⣿⣛⠛⠛⠛⠓⠢⢄⡀⠀⠤⠟⠂⠀⠀⠀⠀⠀⠀⢀⡿",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⠾⠛⠉⠑⠤⣙⢮⡉⠓⣦⣄⡀⠀⣹⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⠃",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⣤⡶⠞⠋⠉⠀⠀⠀⠀⠀⠀⠒⠛⠛⠛⠉⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⢰⡟⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡴⠾⠛⠉⣡⡾⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⢺⢿⢉⡽⡟⢓⣶⠦⢤⣀⡀⠈⠳⣿⠁",
      "⠀⠀⠀⠀⠀⠀⠀⠀⣀⡴⠟⠁⠀⠀⣀⣴⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡤⠚⠁⠀⢛⠛⠛⠻⢷⡧⣾⡴⣛⣏⣹⡇⣀⣿ ███████╗██╗███████╗██╗  ██╗██╗   ██╗██╗███╗   ███╗⠀⠀",
      "⠀⠀⠀⠀⠀⠀⣠⠞⠋⠀⣀⠤⠒⢉⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠔⠋⠀⣀⠴⠚⠛⠛⠯⡑⠂⠀⠀⡏⢹⣿⡾⠟⠋⠁ ██╔════╝██║██╔════╝██║  ██║██║   ██║██║████╗ ████║",
      "⠀⠀⠀⠀⣠⠞⠁⠀⠐⠊⠀⠀⢠⡿⠁⠀⢰⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡏⣤⡿⠋⠀⠀⠀⠀⠀⠀⡹⠀⠀⠀⣠⡾⠋⠀⠀⠀⠀⠀█████╗  ██║███████╗███████║██║   ██║██║██╔████╔██║",
      "⠀⠀⣠⡞⠁⠀⠀⠀⠀⠀⠀⢠⡿⠁⢀⢸⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⣷⡞⠋⠉⠉⠓⠒⠢⢤⣴⣥⣆⣠⡾⠋⠀⠀⠀⣦⠀⠀⠀██╔══╝  ██║╚════██║██╔══██║╚██╗ ██╔╝██║██║╚██╔╝██║⠀",
      "⠀⣼⠋⠀⠀⠀⠀⠀⠀⠀⢀⡟⠀⠀⢸⠀⡆⢧⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⢽⣦⠀⠀⠀⠀⠀⠀⣟⡿⣽⡏⠀⠀⠀⠀⠀⡿⣧⠀⠀██║     ██║███████║██║  ██║ ╚████╔╝ ██║██║ ╚═╝ ██║",
      "⢸⣇⣤⣤⣤⣤⣄⡀⠀⢀⡾⠁⠀⠀⢘⡆⠱⡈⢆⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⢻⡚⡆⣀⠀⠀⠀⢸⡽⣿⠃⠀⠀⠀⠀⠀⡇⢹⡄ ╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
      "⠀⠀⠀⠀⠀⠀⠈⠙⢷⣾⠃⠀⠀⠀⠈⠾⣦⣙⠪⢷⠄⠀⠀⠀⠀⠀⠀⠀⠈⠻⣭⣟⣹⢦⣀⣀⣟⣹⡟⠀⠀⠀⠀⠀⠀⡇⠈⣷⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⠀⠀⣤⠶⠖⠊⠉⠀⠉⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠦⣼⣞⣹⣯⠟⠁⠀⠀⠀⠀⠀⠀⡇⠀⢹⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣇⡾⠁⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢐⣲⡾⠟⠛⠳⣤⡀⠀⠀⠀⠀⠀⠀⡇⠀⣸⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⢨⡟⠁⠀⠀⠀⠀⠀⠀⣼⠇⠀⠀⠀⠀⠀⠀⠀⠙⣻⡿⣿⣯⣁⠀⢰⡀⠀⠀⠙⠳⣄⡀⠀⢠⡟⠋⡔⣿⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⣰⠏⠀⠀⠀⠀⠀⠀⢀⡼⠁⠀⠀⠀⠀⠀⠀⠀⢀⠔⠋⢰⠛⢄⠉⠛⠾⣧⡀⠀⠀⠀⠈⠻⣤⣸⡡⠎⢀⡏⠀⠀",
      "⠀⠀⠀⠀⠀⠀⢰⡟⠀⠀⠀⠀⠀⠀⢠⡾⡁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠙⠲⢤⣈⣉⠳⢦⣄⡀⠀⠈⠻⣄⠀⣼⠃⠀⠀",
      "⠀⠀⠀⠀⠀⢀⡟⠀⠀⠀⠀⠀⠀⣠⠟⠀⠙⠢⢄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠉⠛⠶⣤⡙⣾⠃⠀⠀⠀",
      "⠀⠀⠀⠀⠀⣸⠁⠀⠀⠀⣀⣤⠾⠻⣦⡀⠀⠀⠀⠈⠑⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⠟⠁  ",
      "⠀⠀⠀⠀⠀⣏⣠⡴⠞⠋⠉⠀⠀⠀⠈⠛⢶⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠂⣉⣽⠟⠋    ",
      "⠀⠀⠀⠀⠀⢋⡁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠛⠒⠶⠶⢤⣤⣤⣤⣤⣤⣤⣤⡤⠴⠶⠖⠚⠋⠉ ",
      "                                🐟 H A C K E R ' S  V I M  C H O I C E 🐟",
    }
    

    -- Footer Section: Displays live date & time under the title
    -- Updates each time Neovim is launched
    dashboard.section.footer.val = get_datetime()

    -- Menu Section: Navigation buttons
    -- This adds shortcuts for common actions
    dashboard.section.buttons.val = {
      dashboard.button("e", "📁  > New File", "<cmd>ene<CR>"), -- Create a new file
      dashboard.button("SPC ee", "🗺  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"), -- Open NvimTree
      dashboard.button("SPC ff", "🔍  > Find File", "<cmd>Telescope find_files<CR>"), -- Search for files
      dashboard.button("SPC fs", "🔭  > Find Word", "<cmd>Telescope live_grep<CR>"), -- Search text in project
      dashboard.button("SPC wr", "♼   > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"), -- Restore session
      dashboard.button("q", "⚔️   > Quit NVIM", "<cmd>qa<CR>"), -- Exit Neovim
    }

    -- Apply the dashboard configuration to Alpha.nvim
    alpha.setup(dashboard.opts)

    -- Custom Highlight Groups
    -- This section defines custom colors for different elements
    vim.cmd([[
      hi AlphaHeader guifg=#FF00FF gui=bold    " Magenta header (FISHVIM title)
      hi AlphaShortcut guifg=#FFFF00 gui=bold  " Yellow shortcut keys (SPC, q, e)
      hi AlphaFooter guifg=#FFFFFF gui=italic  " White italic footer (Date & Time)
    ]])



    -- Auto Command: Disable folding in Alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
