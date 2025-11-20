return {
  "lervag/vimtex",
  lazy = false, -- lazy-loading will disable inverse search
  ft = { "tex", "bib" },
  config = function()
    -- VimTeX configuration
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_view_general_viewer = "zathura"

    -- Compiler settings
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_compiler_latexmk = {
      build_dir = "",
      callback = 1,
      continuous = 1,
      executable = "latexmk",
      options = {
        "-verbose",
        "-file-line-error",
        "-synctex=1",
        "-interaction=nonstopmode",
      },
    }

    -- PDF viewer settings for Zathura
    vim.g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]]

    -- Enable forward search (from Vim to PDF)
    vim.g.vimtex_view_forward_search_on_start = 0

    -- Quickfix settings
    vim.g.vimtex_quickfix_mode = 2 -- Open but don't auto-jump
    vim.g.vimtex_quickfix_open_on_warning = 0

    -- Disable overfull/underfull \hbox and all package warnings
    vim.g.vimtex_quickfix_ignore_filters = {
      "Underfull",
      "Overfull",
      "specifier changed to",
      "Token not allowed in a PDF string",
    }

    -- Table of contents (TOC) settings
    vim.g.vimtex_toc_config = {
      name = "TOC",
      layers = { "content", "todo", "include" },
      split_width = 30,
      todo_sorted = 0,
      show_help = 1,
      show_numbers = 1,
    }

    -- Folding
    vim.g.vimtex_fold_enabled = 0 -- Disable by default (can be slow on large files)

    -- Syntax highlighting
    vim.g.vimtex_syntax_enabled = 1
    vim.g.vimtex_syntax_conceal_disable = 0

    -- Enhanced syntax highlighting options
    vim.g.vimtex_syntax_nospell_comments = 1 -- Don't spellcheck comments
    vim.g.vimtex_syntax_custom_cmds = {
      { name = "newcommand", argstyle = "bold" },
      { name = "renewcommand", argstyle = "bold" },
    }
    vim.g.vimtex_syntax_custom_cmds_with_concealed_delims = {
      { name = "emph", argstyle = "italic", cchar_open = "", cchar_close = "" },
      { name = "textit", argstyle = "italic", cchar_open = "", cchar_close = "" },
      { name = "textbf", argstyle = "bold", cchar_open = "", cchar_close = "" },
    }

    -- Indentation
    vim.g.vimtex_indent_enabled = 1

    -- Imaps (auto-completion in insert mode)
    vim.g.vimtex_imaps_enabled = 0 -- Disable to avoid conflicts with completion

    -- Motion settings
    vim.g.vimtex_motion_enabled = 1
    vim.g.vimtex_motion_matchparen = 1

    -- Disable some default mappings that might conflict
    vim.g.vimtex_mappings_disable = {
      -- n = { "K" }, -- Uncomment to disable K mapping if it conflicts with LSP hover
    }

    -- VimTeX conceal settings - controls what gets concealed
    vim.g.vimtex_syntax_conceal = {
      accents = 1,        -- Conceal accents like \"a to ä
      ligatures = 1,      -- Conceal ligatures
      cites = 1,          -- Conceal citation commands
      fancy = 1,          -- Conceal fancy symbols
      spacing = 0,        -- Don't conceal spacing commands (can be confusing)
      greek = 1,          -- Conceal Greek letters: \alpha → α
      math_bounds = 0,    -- Don't conceal $ $ delimiters (need to see them)
      math_delimiters = 1, -- Conceal \( \) and \[ \]
      math_fracs = 1,     -- Conceal fractions nicely
      math_super_sub = 1, -- Conceal superscripts/subscripts
      math_symbols = 1,   -- Conceal math symbols: \sum → ∑
      sections = 0,       -- Don't conceal section commands
      styles = 1,         -- Conceal styles like \textbf
    }

    -- Compilation on save
    vim.g.vimtex_compiler_latexmk_engines = {
      _ = "-pdf",
      pdflatex = "-pdf",
      lualatex = "-lualatex",
      xelatex = "-xelatex",
    }

    -- Ensure VimTeX syntax is used for .tex files
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "tex",
      callback = function()
        -- Force enable VimTeX syntax
        vim.cmd("syntax enable")
        -- Ensure conceallevel is set for proper rendering
        vim.opt_local.conceallevel = 2
        -- concealcursor controls when to show concealed text based on cursor position
        -- "" = always conceal (even on cursor line)
        -- "n" = conceal in normal mode
        -- "v" = conceal in visual mode
        -- "i" = conceal in insert mode
        -- "c" = conceal in command mode
        vim.opt_local.concealcursor = "" -- Show concealed text on cursor line for easier editing

        -- Ensure spell checking is enabled for LaTeX
        vim.opt_local.spell = true
        vim.opt_local.spelllang = "en_us"
      end,
    })

    -- Set up keybindings
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "tex",
      callback = function()
        local opts = { buffer = true, silent = true }

        -- Compilation
        vim.keymap.set(
          "n",
          "<leader>ll",
          "<cmd>VimtexCompile<CR>",
          vim.tbl_extend("force", opts, { desc = "Toggle continuous compilation" })
        )
        vim.keymap.set(
          "n",
          "<leader>lc",
          "<cmd>VimtexClean<CR>",
          vim.tbl_extend("force", opts, { desc = "Clean auxiliary files" })
        )
        vim.keymap.set(
          "n",
          "<leader>lC",
          "<cmd>VimtexClean!<CR>",
          vim.tbl_extend("force", opts, { desc = "Clean auxiliary and output files" })
        )

        -- Viewing
        vim.keymap.set("n", "<leader>lv", "<cmd>VimtexView<CR>", vim.tbl_extend("force", opts, { desc = "View PDF" }))

        -- Navigation
        vim.keymap.set(
          "n",
          "<leader>lt",
          "<cmd>VimtexTocOpen<CR>",
          vim.tbl_extend("force", opts, { desc = "Open table of contents" })
        )
        vim.keymap.set(
          "n",
          "<leader>lT",
          "<cmd>VimtexTocToggle<CR>",
          vim.tbl_extend("force", opts, { desc = "Toggle table of contents" })
        )

        -- Errors and warnings
        vim.keymap.set(
          "n",
          "<leader>le",
          "<cmd>VimtexErrors<CR>",
          vim.tbl_extend("force", opts, { desc = "Show compilation errors" })
        )

        -- Info
        vim.keymap.set(
          "n",
          "<leader>li",
          "<cmd>VimtexInfo<CR>",
          vim.tbl_extend("force", opts, { desc = "Show VimTeX info" })
        )
        vim.keymap.set(
          "n",
          "<leader>lI",
          "<cmd>VimtexInfoFull<CR>",
          vim.tbl_extend("force", opts, { desc = "Show full VimTeX info" })
        )

        -- Stop
        vim.keymap.set(
          "n",
          "<leader>lk",
          "<cmd>VimtexStop<CR>",
          vim.tbl_extend("force", opts, { desc = "Stop compilation" })
        )
        vim.keymap.set(
          "n",
          "<leader>lK",
          "<cmd>VimtexStopAll<CR>",
          vim.tbl_extend("force", opts, { desc = "Stop all compilations" })
        )

        -- Status
        vim.keymap.set(
          "n",
          "<leader>ls",
          "<cmd>VimtexStatus<CR>",
          vim.tbl_extend("force", opts, { desc = "Show compilation status" })
        )
        vim.keymap.set(
          "n",
          "<leader>la",
          "<cmd>VimtexContextMenu<CR>",
          vim.tbl_extend("force", opts, { desc = "Show context menu" })
        )

        -- Toggle conceallevel for debugging
        vim.keymap.set("n", "<leader>lh", function()
          local current = vim.wo.conceallevel
          if current == 0 then
            vim.wo.conceallevel = 2
            print("Conceal enabled (level 2)")
          else
            vim.wo.conceallevel = 0
            print("Conceal disabled (level 0)")
          end
        end, vim.tbl_extend("force", opts, { desc = "Toggle conceal" }))
      end,
    })

    -- Auto-compilation on save (optional, can be enabled per-project)
    -- Uncomment the following to enable automatic compilation on save
    -- vim.api.nvim_create_autocmd("BufWritePost", {
    --   pattern = "*.tex",
    --   callback = function()
    --     vim.cmd("VimtexCompileSS")
    --   end,
    -- })
  end,
}
