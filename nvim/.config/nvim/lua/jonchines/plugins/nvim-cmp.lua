return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", -- source for lsp
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    "hrsh7th/cmp-cmdline", -- source for file system paths
    "hrsh7th/cmp-nvim-lua", -- source for lua
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "L3MON4D3/LuaSnip", -- snippet engine (configured in luasnip.lua)
    "onsails/lspkind.nvim", -- vs-code like pictograms
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")
    local defaults = require("cmp.config.default")()
    local max_items = 5

    cmp.setup({
      window = {
        completion = cmp.config.window.bordered({}),
        documentation = cmp.config.window.bordered({}),
        scrollbar = false,
      },
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        -- Only confirm completion if menu is visible, otherwise fallback to default behavior (obsidian.nvim can handle it)
        ["<CR>"] = cmp.mapping({
          i = function(fallback)
            if cmp.visible() and cmp.get_active_entry() then
              cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
            else
              fallback()
            end
          end,
          s = cmp.mapping.confirm({ select = false }),
          c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
        }),
      }),
      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = "nvim_lsp", max_item_count = max_items }, -- LSP
        { name = "luasnip", max_item_count = max_items }, -- Snippets
        { name = "obsidian", max_item_count = max_items }, -- Obsidian notes
        { name = "obsidian_new", max_item_count = max_items }, -- Obsidian new notes
        { name = "obsidian_tags", max_item_count = max_items }, -- Obsidian tags
        { name = "buffer", max_item_count = max_items }, -- Text within current buffer
        { name = "path", max_item_count = max_items }, -- File system paths
        { name = "neorg", max_item_count = max_items },
      }),
      -- configure lspkind for vs-code like pictograms in completion menu
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
          menu = {
            nvim_lsp = "[LSP]",
            luasnip = "[Snip]",
            obsidian = "[Obsidian]",
            obsidian_new = "[Obsidian New]",
            obsidian_tags = "[Tags]",
            path = "[Path]",
            buffer = "[Buffer]",
            neorg = "[Neorg]",
          },
        }),
      },
      sorting = defaults.sorting,
    })

    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer", max_item_count = max_items },
      },
    })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path", max_item_count = max_items },
      }, {
        { name = "cmdline", max_item_count = max_items },
      }),
    })
  end,
}
