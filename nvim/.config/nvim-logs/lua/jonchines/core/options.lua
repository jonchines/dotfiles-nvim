-- [[ Setting options ]]
-- See `:help opt`

-- Local variables
local opt = vim.opt -- Used to be concise
local indent = 2

-- Set file encoding
opt.fileencoding = "utf-8"

-- Open and maintain multiple buffers
opt.hidden = true

-- Set highlight on search
opt.hlsearch = false

-- Make line numbers default
opt.number = true -- Shows absolute number
opt.relativenumber = true -- Shows relative line numbers

-- Enable mouse mode
opt.mouse = "a"

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- opt.clipboard = 'unnamedplus'

-- Enable break indent
opt.breakindent = true

-- Save undo history
opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
opt.ignorecase = true -- Ignore case when searching
opt.smartcase = true -- Mixed case search term implies exact search term

-- Cursor position
opt.cursorline = true -- Highlight the current cursor line
opt.cursorcolumn = true -- Highlight the current cursor column

-- Appearance
opt.termguicolors = true -- NOTE: make sure terminal supports this
opt.background = "dark" -- Set for colorschemes that have light and dark options
opt.scrolloff = 10 -- Don't allow scrolling within n-lines of the top or bottom of buffer
opt.sidescrolloff = 10 -- Don't allow scolling within n-char of the left or right side of buffer
opt.signcolumn = "yes:1" -- Keep signcolumn on by default
opt.colorcolumn = "120" -- Place a vertical line at a good end of line position

-- Decrease update time
opt.updatetime = 250
opt.timeoutlen = 300

-- Set completeopt to have a better completion experience
opt.completeopt = "menuone,noselect"

-- Editing settings
opt.wrap = false -- Disable line wrapping
opt.tabstop = indent -- Space for tabs (prettier default)
opt.shiftwidth = indent -- Spaces for indent width
opt.expandtab = true -- Expand tab to spaces
opt.autoindent = true -- Copy indent from current line when starting new line
opt.smartindent = true

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- vim: ts=2 sts=2 sw=2 et
