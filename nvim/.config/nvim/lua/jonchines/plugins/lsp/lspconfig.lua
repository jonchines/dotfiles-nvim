return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    -- LSP status updates
    -- { "j-hui/fidget.nvim", opts = {} },
    -- Enhanced LDP UI's
    { "nvimdev/lspsaga.nvim" },
    -- Additional lua configuration, makes nvim stuff amazing!
    "folke/neodev.nvim",
  },
  config = function()
    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    -- import Neovim Lua plugin
    local neodev = require("neodev")
    -- import LSPSaga plugin
    local lspsaga = require("lspsaga")

    local keymap = vim.keymap -- for conciseness

    local opts = { noremap = true, silent = true }
    local on_attach = function(client, bufnr)
      opts.buffer = bufnr

      -- set keybinds
      opts.desc = "Show LSP references"
      keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

      opts.desc = "Go to declaration"
      keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

      opts.desc = "Show LSP definitions"
      keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

      opts.desc = "Show LSP implementations"
      keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

      opts.desc = "Show LSP type definitions"
      keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

      opts.desc = "See available code actions"
      keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

      opts.desc = "Smart rename"
      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

      opts.desc = "Show buffer diagnostics"
      keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

      opts.desc = "Show line diagnostics"
      keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

      opts.desc = "Go to previous diagnostic"
      keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

      opts.desc = "Go to next diagnostic"
      keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

      opts.desc = "Show documentation for what is under cursor"
      keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

      opts.desc = "Restart LSP"
      keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- configure Neodev server
    neodev.setup({})

    -- configure LSPSaga
    lspsaga.setup({})

    -- Core infrastructure/DevOps LSP servers

    -- configure python server
    vim.lsp.config("pyright", {
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure lua server (with special settings)
    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = { -- custom settings for lua
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })

    -- configure terraformls server
    vim.lsp.config("terraformls", {
      capabilities = capabilities,
      on_attach = on_attach,
      -- filetypes = { "terraform" },
    })

    -- configure tflint server
    vim.lsp.config("tflint", {
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure ansiblels server
    vim.lsp.config("ansiblels", {
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure bashls server
    vim.lsp.config("bashls", {
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure dockerls server
    vim.lsp.config("dockerls", {
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure json-lsp server
    vim.lsp.config("jsonls", {
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure sqlls server
    vim.lsp.config("sqlls", {
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure vimls server
    vim.lsp.config("vimls", {
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure yamlls server
    vim.lsp.config("yamlls", {
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure lemminx server (XML)
    vim.lsp.config("lemminx", {
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure texlab server (LaTeX)
    vim.lsp.config("texlab", {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        texlab = {
          build = {
            executable = "latexmk",
            args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
            onSave = false,
            forwardSearchAfter = false,
          },
          forwardSearch = {
            executable = nil, -- Set to your PDF viewer if you want forward search
            args = {},
          },
          chktex = {
            onOpenAndSave = false,
            onEdit = false,
          },
          diagnosticsDelay = 300,
          latexFormatter = "latexindent",
          latexindent = {
            ["local"] = nil, -- Set to path to .latexindent.yaml if you have one
            modifyLineBreaks = false,
          },
        },
      },
    })

    -- Minimal web support (occasionally used)
    vim.lsp.config("html", {
      capabilities = capabilities,
      on_attach = on_attach,
    })

    vim.lsp.config("ts_ls", {
      capabilities = capabilities,
      on_attach = on_attach,
    })

    vim.lsp.config("cssls", {
      capabilities = capabilities,
      on_attach = on_attach,
    })
  end,
}
