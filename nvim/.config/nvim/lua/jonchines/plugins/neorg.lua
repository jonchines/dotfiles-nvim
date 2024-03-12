return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nhrsh7t/nvim-cmp",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local neorg = require("neorg")

    neorg.setup({
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
            name = "[Neorg]",
          },
        },
        ["core.keybinds"] = {
          -- https://github.com/nvim-neorg/neorg/blob/main/lua/neorg/modules/core/keybinds/keybinds.lua
          config = {
            default_keybinds = true,
            neorg_leader = "<Leader><Leader>",
          },
        },
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              test = "~/neorg-test",
            },
          },
        },
        ["core.export"] = {}, -- Loads exporter
        ["core.export.markdown"] = {}, -- Loads Markdown exporter
        ["core.summary"] = {}, -- Loads summary (index page)
        ["core.ui.calendar"] = {}, -- Loads calendar module
      },
    })
  end,
}
