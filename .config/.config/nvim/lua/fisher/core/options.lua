vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to space
opt.autoindent = true -- copy indent from current line when starting new one


opt.wrap = false

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true -- enables highlighting of the current line where the cursor is

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text d:w

-- backspace 
opt.backspace = "indent,eol,start" -- allow backspace on indent end of line or insert mode start position

-- clipboard = Enables Neovim to use the system clipboard as the default register. This means that copying (y yank) and pasting (p put) in Neovim will use the system clipboard, allowing you to easily share text between Neovim and other applications.
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split windows to the right
opt.splitbelow = true --split windows down
