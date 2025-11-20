# Neovim Keybindings Reference

**Leader Key:** `<Space>`
**Local Leader:** `,`

---

## Table of Contents
- [General Editing](#general-editing)
- [Navigation](#navigation)
- [Search & Replace](#search--replace)
- [Text Objects & Operators](#text-objects--operators)
- [Buffer Management](#buffer-management)
- [Window Management](#window-management)
- [File Explorer (nvim-tree)](#file-explorer-nvim-tree)
- [Fuzzy Finder (Telescope)](#fuzzy-finder-telescope)
- [LSP (Language Server)](#lsp-language-server)
- [Code Formatting](#code-formatting)
- [Code Linting](#code-linting)
- [Code Completion](#code-completion)
- [Commenting](#commenting)
- [Git (Gitsigns)](#git-gitsigns)
- [Git (Neogit)](#git-neogit)
- [Markdown](#markdown)
- [Terminal (Toggleterm)](#terminal-toggleterm)
- [Insert Mode](#insert-mode)
- [Visual Mode](#visual-mode)

---

## General Editing

| Mode | Keybinding | Description |
|------|------------|-------------|
| n | `<leader>nh` | Clear search highlights |
| n | `<leader>+` | Increment number under cursor |
| n | `<leader>-` | Decrement number under cursor |
| n | `x` | Delete single character (to black hole register) |
| n | `<leader>d` | Delete (to black hole register) |
| v | `<leader>d` | Delete selection (to black hole register) |
| x | `<leader>p` | Paste without yanking deleted text |

### Clipboard Operations

| Mode | Keybinding | Description |
|------|------------|-------------|
| n | `<leader>y` | Yank to system clipboard |
| v | `<leader>y` | Yank selection to system clipboard |
| n | `<leader>Y` | Yank line to system clipboard |

---

## Navigation

### Line Navigation (Word Wrap Aware)

| Mode | Keybinding | Description |
|------|------------|-------------|
| n | `j` | Move down (display line if wrapped) |
| n | `k` | Move up (display line if wrapped) |

### Page Navigation

| Mode | Keybinding | Description |
|------|------------|-------------|
| n | `<C-d>` | Half page down (centered) |
| n | `<C-u>` | Half page up (centered) |

### Search Navigation

| Mode | Keybinding | Description |
|------|------------|-------------|
| n | `n` | Next search result (centered) |
| n | `N` | Previous search result (centered) |

### LSP Navigation

| Mode | Keybinding | Description |
|------|------------|-------------|
| n | `gR` | Show LSP references (Telescope) |
| n | `gD` | Go to declaration |
| n | `gd` | Show LSP definitions (Telescope) |
| n | `gi` | Show LSP implementations (Telescope) |
| n | `gt` | Show LSP type definitions (Telescope) |
| n | `K` | Show documentation for symbol under cursor |

### Diagnostic Navigation

| Mode | Keybinding | Description |
|------|------------|-------------|
| n | `[d` | Go to previous diagnostic |
| n | `]d` | Go to next diagnostic |
| n | `<leader>d` | Show line diagnostics (float) |
| n | `<leader>D` | Show buffer diagnostics (Telescope) |

### Git Hunk Navigation

| Mode | Keybinding | Description |
|------|------------|-------------|
| n | `]h` | Next git hunk |
| n | `[h` | Previous git hunk |

---

## Search & Replace

| Mode | Keybinding | Description |
|------|------------|-------------|
| n | `<leader>nh` | Clear search highlights |

---

## Text Objects & Operators

### Incremental Selection (Treesitter)

| Mode | Keybinding | Description |
|------|------------|-------------|
| n | `<C-space>` | Initialize incremental selection |
| n | `<C-space>` | Increment to next node |
| n | `<C-s>` | Increment to scope |
| n | `<M-space>` | Decrement node |

### Git Text Objects

| Mode | Keybinding | Description |
|------|------------|-------------|
| o, x | `ih` | Select git hunk (inner hunk) |

---

## Buffer Management

| Mode | Keybinding | Description |
|------|------------|-------------|
| n | `<leader>bd` | Delete current buffer (preserves split) |

---

## Window Management

| Mode | Keybinding | Description |
|------|------------|-------------|
| n | `<leader>wv` | Split window vertically |
| n | `<leader>wh` | Split window horizontally |
| n | `<leader>we` | Make split windows equal size |
| n | `<leader>wr` | Rotate split windows |
| n | `<leader>wc` | Close current split window |

---

## File Explorer (nvim-tree)

| Mode | Keybinding | Description |
|------|------------|-------------|
| n | `<leader>ee` | Toggle file explorer |
| n | `<leader>ef` | Toggle file explorer on current file |
| n | `<leader>ec` | Collapse file explorer |
| n | `<leader>er` | Refresh file explorer |

### Within nvim-tree

| Keybinding | Description |
|------------|-------------|
| `a` | Create new file/directory |
| `d` | Delete file/directory |
| `r` | Rename file/directory |
| `x` | Cut file/directory |
| `c` | Copy file/directory |
| `p` | Paste file/directory |
| `y` | Copy name |
| `Y` | Copy relative path |
| `gy` | Copy absolute path |
| `<CR>` | Open file/directory |
| `o` | Open file/directory |
| `<Tab>` | Preview file |
| `I` | Toggle hidden files |
| `H` | Toggle dotfiles |
| `R` | Refresh tree |

---

## Fuzzy Finder (Telescope)

| Mode | Keybinding | Description |
|------|------------|-------------|
| n | `<leader>ff` | Find files in current working directory |
| n | `<leader>fr` | Find recent files |
| n | `<leader>fs` | Live grep (find string in cwd) |
| n | `<leader>fc` | Find string under cursor in cwd |
| n | `<leader>gb` | Browse git branches |

### Within Telescope Picker (Insert Mode)

| Keybinding | Description |
|------------|-------------|
| `<C-j>` | Move to next result |
| `<C-k>` | Move to previous result |
| `<C-q>` | Send selected to quickfix list |
| `<CR>` | Select item |
| `<C-x>` | Open in horizontal split |
| `<C-v>` | Open in vertical split |
| `<C-t>` | Open in new tab |
| `<Esc>` | Close picker |

---

## LSP (Language Server)

### Code Actions & Refactoring

| Mode | Keybinding | Description |
|------|------------|-------------|
| n, v | `<leader>ca` | Show code actions |
| n | `<leader>rn` | Smart rename (LSP) |
| n | `<leader>rs` | Restart LSP |

### Documentation & Info

| Mode | Keybinding | Description |
|------|------------|-------------|
| n | `K` | Show hover documentation |

### Diagnostics

| Mode | Keybinding | Description |
|------|------------|-------------|
| n | `<leader>d` | Show line diagnostics |
| n | `<leader>D` | Show buffer diagnostics (Telescope) |
| n | `[d` | Previous diagnostic |
| n | `]d` | Next diagnostic |

---

## Code Formatting

| Mode | Keybinding | Description |
|------|------------|-------------|
| n, v | `<leader>mf` | Format file or range (manual trigger) |

**Note:** Auto-format on save is enabled for all configured file types.

### Supported Formats
- **Terraform**: terraform_fmt
- **Bash/Shell**: shfmt
- **Python**: isort + black
- **SQL**: sqlfmt
- **XML**: xmlformat
- **YAML**: prettier
- **JSON**: prettier
- **Markdown**: prettier
- **Lua**: stylua
- **JavaScript/TypeScript**: prettier

---

## Code Linting

| Mode | Keybinding | Description |
|------|------------|-------------|
| n | `<leader>l` | Trigger linting manually |

**Note:** Auto-lint is enabled on `BufEnter`, `BufWritePost`, and `InsertLeave`.

### Configured Linters
- **Terraform**: tflint
- **Ansible**: ansible_lint
- **YAML**: yamllint
- **Bash/Shell**: shellcheck
- **Python**: pylint
- **Markdown**: markdownlint
- **JavaScript/TypeScript**: eslint_d

---

## Code Completion

### In Completion Menu

| Mode | Keybinding | Description |
|------|------------|-------------|
| i | `<C-j>` | Next completion item |
| i | `<C-k>` | Previous completion item |
| i | `<C-b>` | Scroll docs up |
| i | `<C-f>` | Scroll docs down |
| i | `<C-Space>` | Trigger completion |
| i | `<C-e>` | Abort completion |
| i | `<CR>` | Confirm selection |

### Completion Sources
- LSP (language server completions)
- LuaSnip (snippets)
- Buffer (text from current buffer)
- Path (filesystem paths)

---

## Commenting

Uses [Comment.nvim](https://github.com/numToStr/Comment.nvim) with default keybindings.

| Mode | Keybinding | Description |
|------|------------|-------------|
| n | `gcc` | Toggle line comment |
| n | `gbc` | Toggle block comment |
| n | `gc{motion}` | Comment motion (e.g., `gcap` for paragraph) |
| v | `gc` | Toggle comment on selection |
| v | `gb` | Toggle block comment on selection |

---

## Git (Gitsigns)

### Hunk Operations

| Mode | Keybinding | Description |
|------|------------|-------------|
| n | `]h` | Next hunk |
| n | `[h` | Previous hunk |
| n | `<leader>hs` | Stage hunk |
| v | `<leader>hs` | Stage selected hunk |
| n | `<leader>hr` | Reset hunk |
| v | `<leader>hr` | Reset selected hunk |
| n | `<leader>hS` | Stage entire buffer |
| n | `<leader>hu` | Undo stage hunk |
| n | `<leader>hR` | Reset entire buffer |
| n | `<leader>hp` | Preview hunk |

### Blame & Diff

| Mode | Keybinding | Description |
|------|------------|-------------|
| n | `<leader>hb` | Show blame for current line |
| n | `<leader>hd` | Diff this file |
| n | `<leader>hD` | Diff this file against HEAD~ |

### Text Objects

| Mode | Keybinding | Description |
|------|------------|-------------|
| o, x | `ih` | Select hunk text object |

---

## Git (Neogit)

| Mode | Keybinding | Description |
|------|------------|-------------|
| n | `<leader>gs` | Open Neogit status |
| n | `<leader>gc` | Neogit commit |
| n | `<leader>gp` | Neogit pull |
| n | `<leader>gP` | Neogit push |
| n | `<leader>gb` | Browse git branches (Telescope) |
| n | `<leader>gl` | Neogit log |

### Within Neogit Interface

| Keybinding | Description |
|------------|-------------|
| `Tab` | Toggle fold/unfold section |
| `s` | Stage/unstage item |
| `S` | Stage all |
| `u` | Unstage item |
| `U` | Unstage all |
| `d` | Discard changes |
| `c` | Open commit popup |
| `cc` | Commit |
| `p` | Open push popup |
| `P` | Open pull popup |
| `l` | Open log popup |
| `?` | Show help |
| `q` | Close Neogit |

---

## Markdown

| Mode | Keybinding | Description | Context |
|------|------------|-------------|---------|
| n | `<leader>mp` | Toggle markdown preview in browser | Markdown files |
| n | `<leader>tm` | Toggle table mode | Markdown files |
| n | `<leader>mt` | Generate table of contents (GitHub flavored) | Markdown files |
| n | `<leader>mu` | Update existing table of contents | Markdown files |

### Markdown Features
- **Preview**: Live HTML preview in browser on port 8888
- **Table Mode**: Auto-format tables as you type
- **TOC**: Auto-generate and update table of contents
- **Syntax**: Enhanced concealing for cleaner display
- **Frontmatter**: YAML frontmatter support
- **Strikethrough**: `~~text~~` support

---

## Terminal (Toggleterm)

| Mode | Keybinding | Description |
|------|------------|-------------|
| n | `<C-t>` | Toggle floating terminal |
| i | `<C-t>` | Toggle floating terminal |

### Terminal Configuration
- **Direction**: Floating window
- **Border**: Curved
- **Size**: 15 lines (when horizontal)
- **Start in insert mode**: Yes
- **Close on exit**: Yes

---

## Insert Mode

| Mode | Keybinding | Description |
|------|------------|-------------|
| i | `<A-j>` | Move line down |
| i | `<A-k>` | Move line up |
| i | `<C-t>` | Toggle terminal |

---

## Visual Mode

| Mode | Keybinding | Description |
|------|------------|-------------|
| v | `<A-j>` | Move selection down |
| v | `<A-k>` | Move selection up |
| v | `<leader>hs` | Stage selected git hunk |
| v | `<leader>hr` | Reset selected git hunk |
| v | `<leader>y` | Yank to system clipboard |
| v | `<leader>d` | Delete to black hole register |
| v | `<leader>ca` | Code actions for selection |
| v | `gc` | Toggle comment on selection |
| v | `gb` | Toggle block comment on selection |
| v | `<leader>mf` | Format selection |

---

## Quick Reference by Prefix

### `<leader>b` - Buffer
- `bd` - Delete buffer

### `<leader>c` - Code
- `ca` - Code actions

### `<leader>d` - Diagnostics/Delete
- `d` - Show line diagnostics
- `D` - Show buffer diagnostics (Telescope)
- `d` - Delete to black hole (normal/visual)

### `<leader>e` - Explorer (nvim-tree)
- `ee` - Toggle explorer
- `ef` - Find file in explorer
- `ec` - Collapse explorer
- `er` - Refresh explorer

### `<leader>f` - Find (Telescope)
- `ff` - Find files
- `fr` - Recent files
- `fs` - Find string (live grep)
- `fc` - Find string under cursor

### `<leader>g` - Git
- `gs` - Git status (Neogit)
- `gc` - Git commit
- `gp` - Git pull
- `gP` - Git push
- `gb` - Git branches
- `gl` - Git log

### `<leader>h` - Git Hunks
- `hs` - Stage hunk
- `hr` - Reset hunk
- `hS` - Stage buffer
- `hu` - Undo stage
- `hR` - Reset buffer
- `hp` - Preview hunk
- `hb` - Blame line
- `hd` - Diff this
- `hD` - Diff HEAD~

### `<leader>l` - Linting
- `l` - Trigger linting

### `<leader>m` - Markdown/Formatting
- `mp` - Markdown preview
- `mt` - Markdown TOC generate
- `mu` - Markdown TOC update
- `mf` - Format code
- `tm` - Table mode

### `<leader>n` - Miscellaneous
- `nh` - Clear search highlights

### `<leader>r` - Refactor/Restart
- `rn` - Rename symbol
- `rs` - Restart LSP

### `<leader>w` - Window
- `wv` - Split vertical
- `wh` - Split horizontal
- `we` - Equal size
- `wr` - Rotate
- `wc` - Close

### `<leader>y` - Yank to clipboard
- `y` - Yank
- `Y` - Yank line

---

## Special Keys Reference

| Key | Meaning |
|-----|---------|
| `<leader>` | Space |
| `<localleader>` | Comma (,) |
| `<C-x>` | Ctrl + x |
| `<A-x>` | Alt + x (Meta) |
| `<CR>` | Enter/Return |
| `<Esc>` | Escape |
| `<Tab>` | Tab |
| `<Space>` | Space |

---

## Conflict Resolution

**Previous Conflict (RESOLVED):**
- `<leader>mp` was mapped to both format and markdown preview
- **Resolution**: Format moved to `<leader>mf`
- Markdown preview remains on `<leader>mp`

---

## Notes

1. **Auto-completion** triggers automatically after typing, or manually with `<C-Space>`
2. **Auto-format** on save is enabled for all configured file types
3. **Auto-lint** runs on buffer enter, write, and insert leave
4. **LSP features** only work when an LSP server is attached to the buffer
5. **Git features** only work in git repositories
6. **Markdown features** only available in `.md` files
7. **Which-key** will show available keybindings after pressing `<leader>` with a 500ms delay

---

## Tips

1. **Discover keybindings**: Press `<leader>` and wait for which-key popup
2. **LSP info**: `:LspInfo` to see attached language servers
3. **Installed tools**: `:Mason` to manage LSP servers, linters, formatters
4. **Treesitter info**: `:TSInstallInfo` to see installed parsers
5. **Plugin management**: `:Lazy` to manage plugins
6. **Keybinding conflicts**: `:verbose map <keybinding>` to see what's mapped
