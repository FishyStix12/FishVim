# Custom NeoVim

# By: Nicholas Fisher 

![image](https://github.com/user-attachments/assets/df423b19-2be3-48af-aa9b-661ccdba77b8)  

**Important Note: Setup Dot bot before vim.**  <br />

**Important Note: If you want to see leader commands in this setup, press space in nvim to see the which keys.** <br />  

**Run the dependencies.sh script to download dependencies for this custom Neovim.** <br />

**Import Information:** <br />
If plugins have not automatically installed do one of the following: <br />
**`Mason Plugins`** <br />
1. For the plugin manager to appear type `:Mason` to see if the package name matches on of the failed to install packages on the Mason display. <br />
2. Then type `:MasonInstall --force <plugin_name> <Optional_plugin_name> <plugin_name>` to install the missing plugin/plugins. <br />

**`Lazy Plugins`** <br />
1. Type `:Lazy` to enter the Lazy Plugin manager. <br />
2a. Press `control+shift+I` or if this does not work then... <br />
2b. Press q to exit the plugin manager and type `:Lazy Install <plugin_name> <Optional_plugin_name> <plugin_name>` <br />
(optional) 3. then type `:Lazy Reload <plugin_name> <Optional_plugin_name> <plugin_name>`. To force reload plugins into the active session. Or for a simplier method use the steps below. <br />

**Then once the plugins have installed quit fishvim and reopen with `nvim`. <br />

 ---
 
| Command | Description |
|---------|-------------|
| `chmod +x dependencies.sh` | Make the dependencies script executable. |
| `./dependencies.sh` | Run the dependencies installation script. |

---

# Terminology  
![image](https://github.com/user-attachments/assets/c70bcaa3-430d-47ac-b835-8344edb6dcba)  
**Key Terms**  <br />
- The leader key is a special prefix key used to trigger custom shortcuts. By default, Vim/Neovim’s leader is the `\` key, but many people prefer using the spacebar (`<Space>`) since it's easier to reach and press.  <br />

---

# Neovim 📌 Keybindings Cheat Sheet (With Telescope)

This cheat sheet contains Neovim keybindings, including file operations, window management, and Telescope search commands. <br />

| Command | Description |
|---------|-------------|
| `nvim .` | Opens Netrw Directory Listing. |

---

# Leader Key (<Space>) Shortcuts 🚀

| **Keybinding**   | **Action**                                      |
|------------------|------------------------------------------------|
| `<Space>`        | Leader key in this setup. |

---

# Greeter Menu 👋 (Type Command from Terminal Prompt)

| Command | Description |
|---------|-------------|
| `nvim` | Open greeter menu. |

---

# View Mode (Normal Mode) 📝  

**Press ESC to enter Normal Mode.**

| **Keybinding**   | **Action**                                      |
|------------------|------------------------------------------------|
| `Shift + V`      | Highlight text (after this, you can use the commands below). |
| `gg`             | Go to the top of the file. |
| `GG`             | Go to the bottom of the file. |
| `d`              | Delete highlighted text. |
| `dd`             | Delete the current line. |
| `P`              | Undo last delete. |
| `<insert #> k`   | Jump up to a specific line. |
| `<insert #> j`   | Jump down to a specific line. |
| `:source %`      | Reload changes in Neovim. |
| `:w`             | Save file. |
| `:q`             | Quit Neovim. |
| `:h <command>`   | Open help page for the command. |
| `/<text>`        | Search for text in the file. |
| `:Explore`       | Open the file explorer (Netrw). |

---

# Insert Mode ✏️

| **Keybinding**   | **Action**                                      |
|------------------|------------------------------------------------|
| `Press i`        | Enter Insert Mode. |
| `jk`             | Exit Insert Mode. |

---

# Nvim-Tree (File Explorer) 📂

| **Keybinding**   | **Action**                                      |
|------------------|------------------------------------------------|
| `nvim .`         | Open Neovim with file explorer. |
| `:Explore`       | Open file explorer from within Neovim. |
| `:e <file/path>` | Create a new file at the specified location. |

---

# Telescope Keybindings 🔍

| **Keybinding**   | **Action**                                      |
|------------------|------------------------------------------------|
| `<leader> + ff`  | Find files in the current directory. |
| `<leader> + fr`  | Find recently opened files. |
| `<leader> + fs`  | Search for a string inside the project. |
| `<leader> + fc`  | Find occurrences of the word under cursor. |

---

# File Operations 💾

| **Keybinding**   | **Action**                                      |
|------------------|------------------------------------------------|
| `<leader> + w`   | Save file. |
| `<leader> + nh`  | Clear search highlights. |

---

# Nvim-Tree File Explorer 📁

| **Keybinding**   | **Action**                                      |
|------------------|------------------------------------------------|
| `<leader> + ee`  | Open Nvim-Tree File Explorer. |
| `<leader> + ef`  | Open file explorer for the current file. |
| `<leader> + ec`  | Collapse the file explorer. |
| `<leader> + er`  | Refresh the file explorer. |
| `Press a`        | Create new file in the current directory in the explorer. |

---

# Window Management 🔳

| **Keybinding**   | **Action**                                      |
|------------------|------------------------------------------------|
| `<leader> + sv`  | Split window vertically. |
| `<leader> + sh`  | Split window horizontally. |
| `<leader> + se`  | Resize splits to equal size. |
| `<leader> + sx`  | Close the current split window. |

---

# Window Navigation 🔄

| **Keybinding**   | **Action**                                      |
|------------------|------------------------------------------------|
| `<leader> + a`   | Move left. |
| `<leader> + s`   | Move down. |
| `<leader> + d`   | Move right. |
| `<leader> + q`   | Move up. |

---

# Number Operations 🔢

| **Keybinding**   | **Action**                                      |
|------------------|------------------------------------------------|
| `<leader> + +`   | Increment number under cursor. |
| `<leader> + -`   | Decrement number under cursor. |

---

# Auto Sessions 👥

| **Keybinding**   | **Action**                                      |
|------------------|------------------------------------------------|
| `<leader> + wr`  | Restore Workspace Session for current working directory (cwd). |
| `<leader> + ws`  | Save workspace session for cwd. |

---

# Buffer Management 🗂️

| **Keybinding**   | **Action**                                      |
|------------------|------------------------------------------------|
| `<Tab>`          | Go to the next buffer. |
| `<Shift-Tab>`    | Go to the previous buffer. |
| `<leader> + bp`  | Pick a buffer (highlight buffers to switch). |
| `<leader> + bc`  | Pick & close a buffer. |
| `<leader> + bd`  | Close the current buffer. |

---

# Buffer Positioning 🔀

| **Keybinding**   | **Action**                                      |
|------------------|------------------------------------------------|
| `<leader> + bl`  | Move buffer to the right. |
| `<leader> + bh`  | Move buffer to the left. |

---

# Buffer Sorting 📂

| **Keybinding**   | **Action**                                      |
|------------------|------------------------------------------------|
| `<leader> + bs`  | Sort buffers by extension. |

---

# Window Maximization 🏋

| **Keybinding**   | **Action**                                      |
|------------------|------------------------------------------------|
| `<leader> + sm`  | Toggle maximization of the current split window. |

---

# TreeSitter

| Command         | Description |
|-----------------|-------------|
| `:Inspectree`   | Inspect the syntax tree. |

---

# Auto-Completion 🕜

### Navigation

| **Keybinding**   | **Action**                                      |
|------------------|------------------------------------------------|
| `<C-k>`          | Move to the previous suggestion. |
| `<C-j>`          | Move to the next suggestion. |
| `<C-b>`          | Scroll up in the documentation popup. |
| `<C-f>`          | Scroll down in the documentation popup. |

### Interaction 🎮

| **Keybinding**   | **Action**                                      |
|------------------|------------------------------------------------|
| `<C-Space>`      | Manually trigger the completion menu. |
| `<C-e>`          | Close the completion menu. |
| `<CR>`           | Confirm the selected suggestion (without auto-selection). |

---

# Commenting 💯
| **Keybinding**   | **Action**                                      |
|------------------|------------------------------------------------|
|Comment Line/Block	gcc for line comment| gbc for block comment | 
|Toggle Comment	Ctrl + / (or user-defined)|

---

# TODO 📜

| **Keybinding**            | **Action**                              |
|-----------------------------------|-----------------------------------------|
| `:TodoList`                       | List TODOs                              |
| `]t` | Jump to Next TODO                       |
| `[t`  | Jump to Previous TODO                   |
| `:TodoDone`                       | Mark TODO as done                       |
| `/TODO` | Search for TODOs                  |

---

# Substitute Plugin 🚈

| **Keybinding/Command**            | **Action**                              |
|-----------------------------------|-----------------------------------------|
| `s`                               | Substitute with motion (e.g., `siw` replaces a word) |
| `ss`                              | Substitute the entire line               |
| `S`                               | Substitute from cursor to the end of the line |
| `x` + `s`                         | Substitute selected text in visual mode  |

---

# nvim-surround 🔉

| **Keybinding/Command**  | **Action**                                         |
|-------------------------|----------------------------------------------------|
| `cs{`                   | Change surrounding characters to `{`               |
| `ds"`                   | Delete surrounding quotes (`"`)                    |
| `ysiw(`                 | Surround a word with parentheses `()`               |
| `yss[`                  | Surround the entire line with square brackets `[]`  |
| `cs"`                   | Change surrounding quotes to double quotes (`""`)  |
| `ds'`                   | Delete surrounding single quotes (`'`)             |

---

# Mason Installations

### 1. Language Servers

| **Language**         | **Server**                             | **Mason Package**                        | **Basic Command**                         |
|---------------------|----------------------------------------|------------------------------------------|------------------------------------------|
| Python              | `pyright`                              | `python-lsp-server`                      | `:LspInstall pyright`                    |
| JavaScript/TypeScript| `tsserver`                            | `typescript-language-server`             | `:LspInstall tsserver`                   |
| Go                  | `gopls`                                | `gopls`                                  | `:LspInstall gopls`                      |
| Rust                | `rust-analyzer`                        | `rust-analyzer`                          | `:LspInstall rust-analyzer`              |
| Java                | `jdtls`                                | `jdtls`                                  | `:LspInstall jdtls`                      |
| C/C++               | `clangd`                               | `clangd`                                 | `:LspInstall clangd`                     |
| Lua                 | `sumneko_lua`                          | `lua-language-server`                    | `:LspInstall sumneko_lua`                |
| Ruby                | `solargraph`                           | `solargraph`                             | `:LspInstall solargraph`                 |
| PHP                 | `intelephense`                         | `intelephense`                           | `:LspInstall intelephense`               |
| HTML/CSS/JS         | `html-languageserver`                  | `vscode-html-languageserver`             | `:LspInstall html-languageserver`        |

---

### 2. Linters

| **Language**         | **Linter**                             | **Mason Package**                       | **Basic Command**                         |
|---------------------|----------------------------------------|-----------------------------------------|------------------------------------------|
| Python              | `flake8`                               | `flake8`                                | `:LspInstall flake8`                     |
| JavaScript/TypeScript| `eslint`                              | `eslint_d`                              | `:LspInstall eslint`                     |
| Go                  | `golangci-lint`                        | `golangci-lint`                         | `:LspInstall golangci-lint`              |
| Rust                | `clippy`                               | `rust-analyzer` (includes `clippy`)     | `:LspInstall rust-analyzer`              |
| C/C++               | `clang-tidy`                           | `clang-tidy`                            | `:LspInstall clang-tidy`                 |
| Lua                 | `luacheck`                             | `luacheck`                              | `:LspInstall luacheck`                   |
| PHP                 | `phpcs`                                | `phpcs`                                 | `:LspInstall phpcs`                      |

---

### 3. Formatters

| **Language**         | **Formatter**                          | **Mason Package**                        | **Basic Command**                         |
|---------------------|----------------------------------------|------------------------------------------|------------------------------------------|
| Python              | `black`                                | `black`                                  | `:LspInstall black`                      |
| JavaScript/TypeScript| `prettier`                             | `prettier`                               | `:LspInstall prettier`                   |
| Go                  | `gofmt`                                | `gofmt`                                  | `:LspInstall gofmt`                      |
| Rust                | `rustfmt`                              | `rustfmt`                                | `:LspInstall rustfmt`                    |
| C/C++               | `clang-format`                         | `clang-format`                           | `:LspInstall clang-format`               |
| Lua                 | `stylua`                               | `stylua`                                 | `:LspInstall stylua`                     |
| PHP                 | `php-cs-fixer`                         | `php-cs-fixer`                           | `:LspInstall php-cs-fixer`               |

---

### 4. Debuggers

| **Language**         | **Debugger**                           | **Mason Package**                       | **Basic Command**                         |
|---------------------|----------------------------------------|-----------------------------------------|------------------------------------------|
| Python              | `debugpy`                              | `debugpy`                               | `:LspInstall debugpy`                    |
| JavaScript/TypeScript| `vscode-node-debug2`                   | `vscode-node-debug2`                    | `:LspInstall vscode-node-debug2`         |
| C/C++               | `vscode-cpptools`                      | `vscode-cpptools`                       | `:LspInstall vscode-cpptools`            |
| Rust                | `lldb`                                 | `lldb-vscode`                           | `:LspInstall lldb-vscode`                |

---

### 5. Other Useful Tools

| **Tool**            | **Mason Package**                        | **Basic Command**                         |
|---------------------|------------------------------------------|------------------------------------------|
| **Telescope**       | `telescope` (fuzzy finder)               | `:Telescope`                             |
| **FZF**             | `fzf` (fuzzy finder)                    | `:FZF`                                   |

---

### How to Install Plugins Using Mason:

- **Install a Language Server**:  
  `:MasonInstall <server-name>`  
  Example:  
  `:MasonInstall pyright` (for Python language server)

- **Install a Linter**:  
  `:MasonInstall <linter-name>`  
  Example:  
  `:MasonInstall flake8` (for Python linter)

- **Install a Formatter**:  
  `:MasonInstall <formatter-name>`  
  Example:  
  `:MasonInstall black` (for Python formatter)

- **Install a Debugger**:  
  `:MasonInstall <debugger-name>`  
  Example:  
  `:MasonInstall debugpy` (for Python debugger)

---

# LSP Setup 📰
### **Explanation of Key Bindings**:

| **Keybinding/Command**           | **Description**                                                |
|----------------------------------|-----------------------------------------------------------------|
| `gR`                             | Find references to the symbol under the cursor.                |
| `gD`                             | Navigate to the declaration of the symbol under the cursor.    |
| `gd`                             | Show the definitions of the symbol under the cursor.           |
| `gi`                             | Show the implementations of the symbol under the cursor.       |
| `gt`                             | Show the type definitions of the symbol under the cursor.      |
| `<leader>ca`                     | Show available code actions, helpful for refactoring or other tasks. |
| `<leader>rn`                     | Smart rename for the symbol under the cursor.                  |
| `<leader>D`                      | Show diagnostics for the whole buffer.                         |
| `<leader>d`                      | Show diagnostics for the current line.                         |
| `[d` and `]d`                    | Navigate to previous or next diagnostic in the buffer.         |
| `K`                              | Display documentation for the symbol under the cursor.         |
| `<leader>rs`                     | Restart the LSP server if necessary.                           |

---

Here’s the GitHub-style README table for the **basic commands** of the `trouble.nvim` plugin, based on the configuration you provided:

---

# Trouble.nvim 👷

| **Keybinding/Command**             | **Action**                                                      |
|------------------------------------|-----------------------------------------------------------------|
| `<leader>xw`                       | Open Trouble workspace diagnostics                              |
| `<leader>xd`                       | Open Trouble document diagnostics                               |
| `<leader>xq`                       | Open Trouble quickfix list                                      |
| `<leader>xl`                       | Open Trouble location list                                      |
| `<leader>xt`                       | Open todos in Trouble (via `todo-comments.nvim`)                |

---

# Format ⚛️
| **Keybinding/Command**             | **Action**                                                      |
|------------------------------------|-----------------------------------------------------------------|
|`<leader>mf`|	Format the current buffer (manual trigger)|
|`:MasonInstall`| prettier stylua isort black	Install the formatters (prettier, stylua, isort, black) via Mason|

Certainly! Here's a GitHub-style **README table** for the keybindings used in your script, similar to how we did earlier:

---

# Linting and Buffer Management 🧹

| **Keybinding/Command**             | **Action**                                                     |
|------------------------------------|---------------------------------------------------------------|
| `<leader>l`                        | Trigger linting for the current file (manual trigger)         |

### **Explanation of Keybinding:**

| **Keybinding/Command**             | **Description**                                                |
|------------------------------------|---------------------------------------------------------------|
| `<leader>l`                        | Lint the current file manually when the keybinding is pressed. This is useful if you want to run linting at any time. |

---

### **Additional Commands:**

| **Command**                        | **Action**                                                     |
|------------------------------------|---------------------------------------------------------------|
| `:MasonInstall`                    | Install the required tools (`eslint_d`, `pylint`, etc.) via **Mason**. |
| `:MasonLog`                        | View the log for Mason installations, which can help troubleshoot issues during tool installation. |

---

# GitSigns.nvim 🪵

### **Navigation:**

| **Keybinding/Command**   | **Action**                                       |
|--------------------------|-------------------------------------------------|
| `]h`                     | Move to the next Git hunk                      |
| `[h`                     | Move to the previous Git hunk                  |

### **Git Actions:**

| **Keybinding/Command**   | **Action**                                       |
|--------------------------|-------------------------------------------------|
| `<leader>hs`             | Stage the current hunk                          |
| `<leader>hr`             | Reset the current hunk                          |
| `<leader>hS`             | Stage all changes in the buffer                 |
| `<leader>hR`             | Reset all changes in the buffer                 |
| `<leader>hu`             | Undo staging of the last hunk                   |
| `<leader>hp`             | Preview the current hunk                        |
| `<leader>hb`             | Blame the current line                          |
| `<leader>hB`             | Toggle line blame visibility                    |
| `<leader>hd`             | Diff the current file                          |
| `<leader>hD`             | Diff the file against the latest commit (~)     |

### **Text Object:**

| **Keybinding/Command**   | **Action**                                       |
|--------------------------|-------------------------------------------------|
| `ih`                     | Select the current Git hunk in Visual Mode      |

---

# LazyGit

| **Keybinding/Command**   | **Action**                                       |
|--------------------------|-------------------------------------------------|
| `LazyGit` or `<leader>lg`            | 	Open LazyGit UI inside Neovim.                        |
| `LazyGitConfig`            |  Open LazyGit configuration file.                          |
| `LazyGitCurrentFile`           |  Show Git status for the current file.                 |
| `LazyGitFilter`            | Open LazyGit with a specific filter.                 |
| `LazyGitFilterCurrentFile`             |  Open LazyGit with a filter on the current file.                   |

