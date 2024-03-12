local opt = vim.opt -- for conciseness
local indent = 2

-- default encoding
opt.fileencoding = "utf-8"

-- open and maintain multiple buffers
opt.hidden = true

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = indent -- spaces for tabs (prettier default)
opt.shiftwidth = indent -- spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
opt.smartindent = true

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor position
opt.cursorline = true -- highlight the current cursor line
opt.cursorcolumn = true -- highlight the current cursor column

-- appearance
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.scrolloff = 10 -- don't allow scrolling within 10 lines of top or bottom
opt.sidescrolloff = 10 -- don't allow scrolling within 10 characters of left or right
opt.signcolumn = "yes:1" -- show sign column so that text doesn't shift
opt.colorcolumn = "120" -- place a veritical line at a good place to start a new line

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom
