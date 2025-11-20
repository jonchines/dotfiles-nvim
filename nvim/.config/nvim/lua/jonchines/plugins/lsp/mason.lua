return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        -- Core languages for infrastructure/DevOps
        "terraformls",
        "tflint",
        "ansiblels",
        "yamlls",
        "bashls",
        "pyright",
        "sqlls",
        "jsonls",
        "lemminx", -- XML
        "lua_ls",
        "dockerls",
        "vimls",
        -- LaTeX support
        "texlab",
        -- Minimal web support (occasionally used)
        "ts_ls",
        "html",
        "cssls",
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
    })

    mason_tool_installer.setup({
      ensure_installed = {
        -- Core formatters
        "stylua", -- lua formatter
        "prettier", -- multi-purpose formatter (markdown, yaml, json)
        "black", -- python formatter
        "isort", -- python import sorter
        "sqlfmt", -- sql formatter
        "shfmt", -- shell/bash formatter
        "xmlformatter", -- xml formatter
        -- Core linters
        "tflint", -- terraform linter
        "ansible-lint", -- ansible linter
        "yamllint", -- yaml linter
        "pylint", -- python linter
        "shellcheck", -- bash linter
        "markdownlint", -- markdown linter
        -- Optional web linters (minimal)
        "eslint_d", -- js linter
      },
      automatic_installation = true,
    })
  end,
}
