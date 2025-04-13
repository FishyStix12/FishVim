return {
  "mfussenegger/nvim-lint",  -- nvim-lint plugin for linting files in Neovim
  event = { "BufReadPre", "BufNewFile" },  -- Trigger linting setup on buffer read or new file
  config = function()
    -- Import the linting module
    local lint = require("lint")

    -- Define linters for specific file types (filetypes) 
    -- eslint_d is used for JavaScript, TypeScript, and their React variants
    -- pylint is used for Python linting
    lint.linters_by_ft = {
      javascript = { "eslint_d" },         -- Lint JavaScript files with eslint_d
      typescript = { "eslint_d" },         -- Lint TypeScript files with eslint_d
      javascriptreact = { "eslint_d" },    -- Lint JavaScript React files with eslint_d
      typescriptreact = { "eslint_d" },    -- Lint TypeScript React files with eslint_d
      svelte = { "eslint_d" },             -- Lint Svelte files with eslint_d
      python = { "pylint" },               -- Lint Python files with pylint
    }

    -- Create an autocommand group for linting
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    -- Set up automatic linting triggers:
    -- 1. `BufEnter` - Trigger linting when entering the buffer
    -- 2. `BufWritePost` - Trigger linting after saving the file
    -- 3. `InsertLeave` - Trigger linting after leaving insert mode
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()  -- Perform linting when triggered by the above events
      end,
    })

    -- Add a manual keybinding to trigger linting for the current file
    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()  -- Lint the current file when the keybinding is pressed
    end, { desc = "Trigger linting for current file" })

    -- Optional: Automatically lint on file save (uncomment if desired)
    -- vim.api.nvim_create_autocmd("BufWritePost", {
    --   group = lint_augroup,
    --   callback = function()
    --     lint.try_lint()  -- Lint the file after it's saved
    --   end,
    -- })
  end,
}
