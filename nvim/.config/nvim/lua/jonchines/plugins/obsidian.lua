return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    { "<leader>on", "<cmd>Obsidian new<cr>", desc = "New Obsidian note", ft = "markdown" },
    { "<leader>oo", "<cmd>Obsidian search<cr>", desc = "Search Obsidian notes", ft = "markdown" },
    { "<leader>os", "<cmd>Obsidian quick-switch<cr>", desc = "Quick switch notes", ft = "markdown" },
    { "<leader>ob", "<cmd>Obsidian backlinks<cr>", desc = "Show backlinks", ft = "markdown" },
    { "<leader>ot", "<cmd>Obsidian today<cr>", desc = "Open today's note", ft = "markdown" },
    { "<leader>oy", "<cmd>Obsidian yesterday<cr>", desc = "Open yesterday's note", ft = "markdown" },
    { "<leader>ol", "<cmd>Obsidian links<cr>", desc = "Show note links", ft = "markdown" },
    { "<leader>oT", "<cmd>Obsidian template<cr>", desc = "Insert template", ft = "markdown" },
  },
  opts = {
    -- Disable legacy commands (ObsidianNew -> Obsidian new)
    legacy_commands = false,

    workspaces = {
      {
        name = "personal",
        path = "/data/jhines/1_personal/notes",
      },
    },

    -- Optional, customize how note IDs are generated given an optional title.
    ---@param title string|?
    ---@return string
    note_id_func = function(title)
      -- Create note IDs in a Zettelkasten format with a timestamp.
      local suffix = ""
      if title ~= nil then
        -- If title is given, transform it into valid file name.
        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        -- If title is nil, just add 4 random uppercase letters to the suffix.
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return tostring(os.time()) .. "-" .. suffix
    end,

    -- Frontmatter configuration
    frontmatter = {
      func = function(note)
        -- Add the title of the note as an alias.
        if note.title then
          note:add_alias(note.title)
        end

        local out = { id = note.id, aliases = note.aliases, tags = note.tags }

        -- `note.metadata` contains any manually added fields in the frontmatter.
        -- So here we just make sure those fields are kept in the frontmatter.
        if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
          for k, v in pairs(note.metadata) do
            out[k] = v
          end
        end

        return out
      end,
    },

    -- Daily notes configuration
    daily_notes = {
      folder = "daily",
      date_format = "%Y-%m-%d",
      alias_format = "%B %-d, %Y",
      template = nil, -- Set to a template file name if you have one
    },

    -- Completion configuration
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },

    -- Checkbox configuration - defines cycling order when toggling
    checkbox = {
      order = { " ", "x", ">", "~" },
    },

    -- Callbacks for setting up keymaps when entering obsidian notes
    callbacks = {
      enter_note = function(client, note)
        -- Set conceallevel for proper obsidian UI rendering
        vim.opt_local.conceallevel = 2
        vim.opt_local.concealcursor = "nc" -- Conceal in normal and command mode

        -- Smart action on enter - checks if cmp menu is visible first
        vim.keymap.set("n", "<CR>", function()
          local cmp = require("cmp")
          if cmp.visible() then
            cmp.confirm({ select = false })
          else
            return require("obsidian").util.smart_action()
          end
        end, { buffer = note.bufnr, expr = true, desc = "Obsidian smart action" })

        -- Toggle checkbox
        vim.keymap.set("n", "<leader>ch", function()
          return require("obsidian").util.toggle_checkbox()
        end, { buffer = note.bufnr, expr = true, desc = "Toggle checkbox" })

        -- Navigate to next/previous links
        vim.keymap.set("n", "]o", function()
          return require("obsidian").util.gf_passthrough()
        end, { buffer = note.bufnr, noremap = false, expr = true, desc = "Next link" })

        vim.keymap.set("n", "[o", function()
          return require("obsidian").util.gf_passthrough()
        end, { buffer = note.bufnr, noremap = false, expr = true, desc = "Previous link" })
      end,
    },

    -- Configure which external apps to use for opening URLs and images
    follow_url_func = function(url)
      -- Open the URL in the default web browser.
      vim.fn.jobstart({ "xdg-open", url }) -- Linux
    end,

    -- UI configuration - enables prettier rendering of markdown
    ui = {
      enable = true,
      update_debounce = 200,
      bullets = { char = "•", hl_group = "ObsidianBullet" },
      external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
      reference_text = { hl_group = "ObsidianRefText" },
      highlight_text = { hl_group = "ObsidianHighlightText" },
      tags = { hl_group = "ObsidianTag" },
      hl_groups = {
        ObsidianTodo = { bold = true, fg = "#f78c6c" },
        ObsidianDone = { bold = true, fg = "#89ddff" },
        ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
        ObsidianTilde = { bold = true, fg = "#ff5370" },
        ObsidianBullet = { bold = true, fg = "#89ddff" },
        ObsidianRefText = { underline = true, fg = "#c792ea" },
        ObsidianExtLinkIcon = { fg = "#c792ea" },
        ObsidianTag = { italic = true, fg = "#89ddff" },
        ObsidianHighlightText = { bg = "#75662e" },
      },
    },

    -- Attachments configuration
    attachments = {
      img_folder = "assets/imgs",
    },

    -- Use telescope for pickers
    picker = {
      name = "telescope.nvim",
      mappings = {
        new = "<C-x>",
        insert_link = "<C-l>",
      },
    },
  },

  config = function(_, opts)
    require("obsidian").setup(opts)

    -- Set conceallevel for markdown files in the obsidian workspace
    -- This ensures obsidian UI features work properly
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "markdown",
      callback = function()
        -- Check if we're in the obsidian workspace
        local bufpath = vim.api.nvim_buf_get_name(0)
        if bufpath:match("^/data/jhines/1_personal/notes") then
          vim.opt_local.conceallevel = 2
          vim.opt_local.concealcursor = "nc"
        end
      end,
      group = vim.api.nvim_create_augroup("ObsidianConceal", { clear = true }),
    })

    -- Additional keymaps that don't fit in the 'keys' table
    vim.keymap.set("v", "<leader>ol", "<cmd>Obsidian link<cr>", { desc = "Create link from selection" })
    vim.keymap.set("v", "<leader>oL", "<cmd>Obsidian link new<cr>", { desc = "Create new note from selection" })
  end,
}
