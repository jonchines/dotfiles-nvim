return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "windwp/nvim-ts-autotag",
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      -- import nvim-treesitter plugin
      local treesitter = require("nvim-treesitter.configs")

      vim.g.skip_ts_context_commentstring_module = true

      -- configure treesitter
      treesitter.setup({
        -- Enable syntax highlighting
        highlight = { enable = true },
        -- Enable indentation
        indent = { enable = true },
        -- Enable autotagging (w/ nvim-ts-autotag plugin)
        autotag = { enable = true },
        modules = {},
        auto_install = true,
        sync_install = true,
        ignore_install = {},
        -- Ensure these language parsers are installed
        ensure_installed = {
          "bash",
          "comment",
          "css",
          "dockerfile",
          "gitignore",
          "hcl",
          "html",
          "javascript",
          "jq",
          "json",
          "lua",
          "markdown",
          "markdown_inline",
          "python",
          "query",
          "sql",
          "terraform",
          "tsx",
          "typescript",
          "vim",
          "vimdoc",
          "yaml",
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = "<C-s>",
            node_decremental = "<M-space>",
          },
        },
        -- textobjects = {
        --   select = {
        --     enable = true,
        --     lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        --     keymaps = {
        --       -- You can use the capture groups defined in textobjects.scm
        --       ["aa"] = "@parameter.outer",
        --       ["ia"] = "@parameter.inner",
        --       ["af"] = "@function.outer",
        --       ["if"] = "@function.inner",
        --       ["ac"] = "@class.outer",
        --       ["ic"] = "@class.inner",
        --     },
        --   },
        --   move = {
        --     enable = true,
        --     set_jumps = true, -- whether to set jumps in the jumplist
        --     goto_next_start = {
        --       ["]m"] = "@function.outer",
        --       ["]]"] = "@class.outer",
        --     },
        --     goto_next_end = {
        --       ["]M"] = "@function.outer",
        --       ["]["] = "@class.outer",
        --     },
        --     goto_previous_start = {
        --       ["[m"] = "@function.outer",
        --       ["[["] = "@class.outer",
        --     },
        --     goto_previous_end = {
        --       ["[M"] = "@function.outer",
        --       ["[]"] = "@class.outer",
        --     },
        --   },
        --   swap = {
        --     enable = true,
        --     swap_next = {
        --       ["<leader>a"] = "@parameter.inner",
        --     },
        --     swap_previous = {
        --       ["<leader>A"] = "@parameter.inner",
        --     },
        --   },
        -- },
      })
    end,
  },
}
