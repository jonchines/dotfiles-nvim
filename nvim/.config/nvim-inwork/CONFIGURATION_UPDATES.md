# Neovim Configuration Updates

## Overview
This configuration has been modernized to focus on infrastructure/DevOps workflows including Terraform, Ansible, YAML, Bash, SQL, Python, XML, and JSON. TypeScript support remains available but has been minimized.

## Key Changes

### 1. LSP Configuration (lua/jonchines/plugins/lsp/)

#### Mason (`mason.lua`)
**Updated LSP Servers:**
- **Core languages prioritized**: terraformls, tflint, ansiblels, yamlls, bashls, pyright, sqlls, jsonls, lemminx (XML)
- **Minimal web support**: ts_ls, html, cssls
- **Removed**: tailwindcss, emmet_ls (not needed for your workflow)

**Updated Tools:**
- **Added formatters**: shfmt (bash), xmlformatter, sqlfmt
- **Added linters**: shellcheck, markdownlint, ansible-lint, tflint, yamllint

#### LSPConfig (`lspconfig.lua`)
- Removed TypeScript-specific keybindings
- Removed unnecessary web-focused LSP configurations (tailwindcss, emmet)
- Kept minimal web support (html, ts_ls, cssls) for occasional use
- All core language LSP servers properly configured

### 2. Treesitter (`nvim-treesitter.lua`)
**Added parsers:**
- `xml` - for XML file support
- Reorganized ensure_installed list to prioritize DevOps languages

### 3. Formatting (`formatting.lua`)
**New formatters configured:**
- **Terraform**: terraform_fmt
- **Bash/Shell**: shfmt
- **SQL**: sqlfmt
- **XML**: xmlformat
- **Python**: isort + black (already configured)
- **YAML/JSON/Markdown**: prettier

**Format on save enabled** for all configured file types with 1000ms timeout.

### 4. Linting (`linting.lua`)
**New linters configured:**
- **Terraform**: tflint
- **Ansible**: ansible_lint
- **YAML**: yamllint
- **Bash/Shell**: shellcheck
- **Markdown**: markdownlint
- **Python**: pylint (already configured)

**Auto-lint triggers**: BufEnter, BufWritePost, InsertLeave

### 5. Git Workflow

#### Enhanced Gitsigns (`gitsigns.lua`)
**New keybindings:**
- `]h` / `[h` - Navigate to next/previous git hunk
- `<leader>hs` - Stage hunk (works in visual mode too)
- `<leader>hr` - Reset hunk (works in visual mode too)
- `<leader>hS` - Stage entire buffer
- `<leader>hu` - Undo stage hunk
- `<leader>hR` - Reset entire buffer
- `<leader>hp` - Preview hunk
- `<leader>hb` - Show blame for current line
- `<leader>hd` - Diff this file
- `<leader>hD` - Diff this file against HEAD~
- `ih` - Text object to select git hunk (works in visual/operator mode)

#### New: Neogit (`neogit.lua`)
**Git interface similar to Magit:**
- `<leader>gs` - Open Neogit status
- `<leader>gc` - Neogit commit
- `<leader>gp` - Neogit pull
- `<leader>gP` - Neogit push
- `<leader>gb` - Browse git branches (via Telescope)
- `<leader>gl` - Neogit log

**Features:**
- Interactive staging/unstaging
- Commit creation with diff preview
- Integrated with Telescope and Diffview
- Clean UI with fold sections

### 6. Markdown Workflow (`markdown.lua`)

#### Markdown Preview
- `<leader>mp` - Toggle markdown preview in browser
- Auto-preview on port 8888
- Dark theme enabled

#### Table Mode
- `<leader>tm` - Toggle table mode for easy table editing
- Auto-formats tables as you type

#### Table of Contents
- `<leader>mt` - Generate GitHub-flavored TOC
- `<leader>mu` - Update existing TOC

#### Enhanced Syntax
- Conceal enabled for cleaner viewing
- Frontmatter support (YAML in markdown)
- Strikethrough support
- Follow anchors with `ge`

## Existing Features Preserved

### Core Settings (`core/options.lua`)
- 2-space indentation (unchanged)
- Line numbers (absolute + relative)
- Cursor line/column highlighting
- 120-character colorcolumn
- All your existing editor preferences

### Plugins Kept
- **todo**: Task management (unchanged)
- **toggleterm**: Terminal integration (unchanged)
- **which-key**: Keybinding helper (unchanged)
- **autopairs**: Auto-close brackets (unchanged)
- **telescope**: Fuzzy finder (unchanged)
- **nvim-tree**: File explorer (unchanged)
- **comment**: Easy commenting (unchanged)
- **nvim-cmp**: Autocompletion (unchanged)
- **lualine**: Status line (unchanged)

## Installation Steps

1. **Sync plugins:**
   ```vim
   :Lazy sync
   ```

2. **Install LSP servers and tools:**
   ```vim
   :Mason
   ```
   All tools should auto-install. Verify everything is installed.

3. **Install Treesitter parsers:**
   ```vim
   :TSUpdate
   ```

4. **Restart Neovim** to ensure all changes take effect.

## Common Workflows

### Terraform Development
1. Open `.tf` file
2. LSP provides completion, diagnostics (terraformls + tflint)
3. Save to auto-format with terraform_fmt
4. Linting runs automatically

### Ansible Development
1. Open playbook/role files (`.yml` with ansible content)
2. LSP provides completion (ansiblels)
3. ansible-lint runs on save
4. Format with prettier on save

### Markdown Writing
1. Open `.md` file
2. `<leader>mp` - Start live preview
3. `<leader>tm` - Enable table mode for tables
4. `<leader>mt` - Generate TOC when needed
5. Auto-formats with prettier on save

### Git Workflow
1. Make changes to files
2. `]h` / `[h` - Jump between changes
3. `<leader>hs` - Stage hunks interactively
4. `<leader>gs` - Open Neogit for full git interface
5. Stage/unstage in Neogit UI, write commit message
6. `<leader>gP` - Push when ready

## Troubleshooting

### LSP not working
```vim
:LspInfo  " Check which LSP servers are attached
:Mason    " Verify tools are installed
:LspRestart  " Restart LSP if needed
```

### Formatter not working
```vim
:ConformInfo  " Check formatter status
<leader>mp    " Manual format trigger
```

### Linter not running
```vim
:lua require('lint').try_lint()  " Manual lint trigger
<leader>l     " Keybinding for manual lint
```

## File-Specific Notes

### YAML Files
- yamlls provides schema validation
- yamllint checks style
- prettier formats on save
- If file is Ansible, ansible-lint also runs

### Terraform Files
- terraformls provides completion
- tflint provides additional validation
- terraform_fmt formats on save

### Bash Scripts
- bashls provides LSP features
- shellcheck lints for common issues
- shfmt formats on save

### Python Scripts
- pyright provides type checking and completion
- black formats code
- isort organizes imports
- pylint checks code quality

## Performance Considerations

All plugins are lazy-loaded where possible:
- LSP: loads on `BufReadPre`, `BufNewFile`
- Linting: loads on `BufReadPre`, `BufNewFile`
- Formatting: loads on `BufReadPre`, `BufNewFile`
- Markdown plugins: load only for markdown files
- Neogit: loads on command or keybinding

## Next Steps

Consider these optional enhancements:
1. Configure yamllint rules (`.yamllint` in project root)
2. Configure tflint rules (`.tflint.hcl` in project root)
3. Set up ansible-lint config (`.ansible-lint` in project root)
4. Customize Neogit signs/colors to match your theme
5. Add project-specific LSP settings via `.nvim.lua` in project roots
