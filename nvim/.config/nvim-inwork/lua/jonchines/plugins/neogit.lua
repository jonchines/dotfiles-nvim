return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
  },
  cmd = "Neogit",
  keys = {
    { "<leader>gs", "<cmd>Neogit<CR>", desc = "Neogit status" },
    { "<leader>gc", "<cmd>Neogit commit<CR>", desc = "Neogit commit" },
    { "<leader>gp", "<cmd>Neogit pull<CR>", desc = "Neogit pull" },
    { "<leader>gP", "<cmd>Neogit push<CR>", desc = "Neogit push" },
    { "<leader>gb", "<cmd>Telescope git_branches<CR>", desc = "Git branches" },
    { "<leader>gl", "<cmd>Neogit log<CR>", desc = "Neogit log" },
  },
  opts = {
    integrations = {
      telescope = true,
      diffview = true,
    },
    signs = {
      section = { "", "" },
      item = { "", "" },
      hunk = { "", "" },
    },
  },
}
