return {
  "stevearc/conform.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        -- Core infrastructure/DevOps languages
        terraform = { "terraform_fmt" },
        tf = { "terraform_fmt" },
        ["terraform-vars"] = { "terraform_fmt" },
        hcl = { "terraform_fmt" },
        python = { "isort", "black" },
        sql = { "sqlfmt" },
        sh = { "shfmt" },
        bash = { "shfmt" },
        yaml = { "prettier" },
        json = { "prettier" },
        xml = { "xmlformat" },
        lua = { "stylua" },
        markdown = { "prettier" },
        -- Ansible (uses yaml but may need special handling)
        ansible = { "prettier" },
        -- Minimal web support
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>mf", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
