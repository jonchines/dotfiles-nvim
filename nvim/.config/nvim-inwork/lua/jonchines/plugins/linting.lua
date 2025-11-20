return {
  "mfussenegger/nvim-lint",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      -- Core infrastructure/DevOps linters
      terraform = { "tflint" },
      tf = { "tflint" },
      yaml = { "yamllint" },
      ansible = { "ansible_lint" },
      python = { "pylint" },
      sh = { "shellcheck" },
      bash = { "shellcheck" },
      markdown = { "markdownlint" },
      -- Minimal web support
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}
