-- The leader key is a special prefix key used to trigger custom shortcuts. By default, Vim/Neovim’s leader is the \ key, but many people prefer using the spacebar (" ") since it's easier to reach and press
vim.g.mapleader = " " --sets the "leader" key in Neovim, which is used as a prefix for creating custom shortcuts.

local keymap = vim.keymap --creates a shortcut (alias) for vim.keymap, making keybindings more concise.

-- Key Mappings
keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })  -- Creates custom key mapping that is = Space + w = Save The description is used by whichkey to describe what the leader key options do 
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with j+k" }) -- Creates custom key mapping that is j + k = Exit Inser
vim.keymap.set("n", "<leader>nh", ":nohlsearch<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number"}) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number"}) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- Move between split windows using <leader> + a/s/q/d
vim.keymap.set("n", "<leader>a", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<leader>s", "<C-w>j", { desc = "Move to below window" })
vim.keymap.set("n", "<leader>q", "<C-w>r", { desc = "Move to above window" })
vim.keymap.set("n", "<leader>d", "<C-w>l", { desc = "Move to right window" })


keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
