return {
  -- Markdown preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = "cd app && npx --yes yarn install",
    keys = {
      { "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", desc = "Markdown preview toggle", ft = "markdown" },
    },
    config = function()
      vim.g.mkdp_auto_close = 0
      vim.g.mkdp_open_to_the_world = 0
      vim.g.mkdp_open_ip = "127.0.0.1"
      vim.g.mkdp_port = "8888"
      vim.g.mkdp_browser = ""
      vim.g.mkdp_echo_preview_url = 1
      vim.g.mkdp_theme = "dark"
    end,
  },
  -- Markdown table mode
  {
    "dhruvasagar/vim-table-mode",
    ft = { "markdown" },
    cmd = { "TableModeToggle" },
    keys = {
      { "<leader>tm", "<cmd>TableModeToggle<CR>", desc = "Toggle table mode", ft = "markdown" },
    },
    config = function()
      vim.g.table_mode_corner = "|"
    end,
  },
  -- Markdown TOC generation
  {
    "mzlogin/vim-markdown-toc",
    ft = { "markdown" },
    cmd = { "GenTocGFM", "GenTocRedcarpet", "GenTocGitLab", "UpdateToc", "RemoveToc" },
    keys = {
      { "<leader>mt", "<cmd>GenTocGFM<CR>", desc = "Generate TOC", ft = "markdown" },
      { "<leader>mu", "<cmd>UpdateToc<CR>", desc = "Update TOC", ft = "markdown" },
    },
  },
  -- Better markdown concealing and syntax
  {
    "preservim/vim-markdown",
    ft = { "markdown" },
    config = function()
      vim.g.vim_markdown_folding_disabled = 1
      vim.g.vim_markdown_conceal = 1
      vim.g.vim_markdown_conceal_code_blocks = 0
      vim.g.vim_markdown_frontmatter = 1
      vim.g.vim_markdown_strikethrough = 1
      vim.g.vim_markdown_autowrite = 1
      vim.g.vim_markdown_edit_url_in = "tab"
      vim.g.vim_markdown_follow_anchor = 1
    end,
  },
}
