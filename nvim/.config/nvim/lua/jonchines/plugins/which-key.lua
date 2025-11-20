return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  config = function()
    local wk = require("which-key")

    wk.setup({
      -- your configuration comes here
    })

    -- Register leader key groups
    wk.add({
      { "<leader>b", group = "Buffer" },
      { "<leader>c", group = "Code" },
      { "<leader>d", group = "Diagnostics/Delete" },
      { "<leader>e", group = "Explorer" },
      { "<leader>f", group = "Find" },
      { "<leader>g", group = "Git" },
      { "<leader>h", group = "Git Hunks" },
      { "<leader>m", group = "Markdown" },
      { "<leader>r", group = "Rename/Restart" },
      { "<leader>s", group = "Session" },
      { "<leader>w", group = "Window" },
    })

    -- Register localleader groups for LaTeX (only active in .tex files)
    -- vim.api.nvim_create_autocmd("FileType", {
    --   pattern = "tex",
    --   callback = function()
    --     wk.add({
    --       { "<leader>l", group = "LaTeX", buffer = 0 },
    --     })
    --   end,
    -- })
  end,
}
