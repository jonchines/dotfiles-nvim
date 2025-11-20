return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  build = "make install_jsregexp",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  config = function()
    local luasnip = require("luasnip")

    -- Load VSCode-style snippets from friendly-snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    -- LuaSnip configuration
    luasnip.config.set_config({
      -- Remember the last snippet to jump back into it
      history = true,
      -- Update dynamic snippets as you type
      updateevents = "TextChanged,TextChangedI",
      -- Enable autotriggered snippets
      enable_autosnippets = false,
      -- Use <Tab> to trigger visual selection
      store_selection_keys = "<Tab>",
    })

    -- Keybindings for snippet navigation
    vim.keymap.set({ "i", "s" }, "<C-l>", function()
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      end
    end, { silent = true, desc = "Expand snippet or jump to next placeholder" })

    vim.keymap.set({ "i", "s" }, "<C-h>", function()
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      end
    end, { silent = true, desc = "Jump to previous snippet placeholder" })

    vim.keymap.set({ "i", "s" }, "<C-L>", function()
      if luasnip.choice_active() then
        luasnip.change_choice(1)
      end
    end, { silent = true, desc = "Cycle through snippet choices" })
  end,
}
