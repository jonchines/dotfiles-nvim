return {
  -- {
  --   "bluz71/vim-moonfly-colors",
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     -- load the colorscheme here
  --     vim.cmd([[colorscheme moonfly]])
  --   end,
  -- },
  {
    "EdenEast/nightfox.nvim",
    priority = 1000,
    config = function()
      require("nightfox").setup({
        options = {
          colorblind = {
            enable = true,
            severity = {
              protan = 1, -- Severity [0,1] for protan (red)
              deutan = 0.9, -- Severity [0,1] for deutan (green)
              tritan = 0.6, -- Severity [0,1] for tritan (blue)
            },
          },
        },
      })
      vim.cmd.colorscheme("carbonfox")
    end,
  },

  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     require("catppuccin").setup({
  --       flavour = "mocha",
  --       show_end_of_buffer = false,
  --       dim_inactive = {
  --         enabled = true, -- dims the background color of inactive window
  --         shade = "dark",
  --         percentage = 0.15, -- percentage of the shade to apply to the inactive window
  --       },
  --       color_overrides = {
  --         -- mocha = {
  --         --   base = "#000000",
  --         --   mantle = "#000000",
  --         --   crust = "#000000",
  --         -- },
  --       },
  --       integrations = {
  --         cmp = true,
  --         gitsigns = true,
  --         nvimtree = true,
  --         treesitter = true,
  --         indent_blankline = {
  --           enabled = true,
  --           scope_color = "blue", -- catppuccin color (eg. `lavender`) Default: text
  --           colored_indent_levels = false,
  --         },
  --         markdown = true,
  --         which_key = true,
  --       },
  --     })
  --     vim.cmd.colorscheme("catppuccin")
  --   end,
  -- },

  -- {
  --   "folke/tokyonight.nvim",
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     local bg = "#011628"
  --     local bg_dark = "#011423"
  --     local bg_highlight = "#143652"
  --     local bg_search = "#0A64AC"
  --     local bg_visual = "#275378"
  --     local fg = "#CBE0F0"
  --     local fg_dark = "#B4D0E9"
  --     local fg_gutter = "#627E97"
  --     local border = "#547998"
  --
  --     require("tokyonight").setup({
  --       style = "night",
  --       on_colors = function(colors)
  --         colors.bg = bg
  --         colors.bg_dark = bg_dark
  --         colors.bg_float = bg_dark
  --         colors.bg_highlight = bg_highlight
  --         colors.bg_popup = bg_dark
  --         colors.bg_search = bg_search
  --         colors.bg_sidebar = bg_dark
  --         colors.bg_statusline = bg_dark
  --         colors.bg_visual = bg_visual
  --         colors.border = border
  --         colors.fg = fg
  --         colors.fg_dark = fg_dark
  --         colors.fg_float = fg
  --         colors.fg_gutter = fg_gutter
  --         colors.fg_sidebar = fg_dark
  --       end,
  --     })
  --     -- load the colorscheme here
  --     vim.cmd([[colorscheme tokyonight]])
  --   end,
  -- },
}
