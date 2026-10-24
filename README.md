# Dotfiles

My personal development environment configuration files.

## Neovim (`nvim/`)

VS Code-style terminal-based IDE configuration for Neovim (v0.12+).

### Structure

```
nvim/
├── init.lua                  # Entry point & lazy.nvim bootstrap
├── lazy-lock.json            # Pinned plugin lockfile
└── lua/
    ├── config/
    │   ├── options.lua       # Editor options & UI settings
    │   ├── keymaps.lua       # VS Code-style shortcuts
    │   └── autocmds.lua      # Autocommands & file triggers
    └── plugins/
        ├── ui.lua            # VS Code theme, tabs, statusline, indent guides
        ├── explorer.lua      # Neo-tree file sidebar & Oil.nvim
        ├── editor.lua        # Telescope, ToggleTerm, GitSigns, Autopairs, Autotag
        ├── lsp.lua           # Mason, LSPs, Blink.cmp, Conform formatters
        └── treesitter.lua    # Syntax highlighting & AST parsers
```

### Setup / Symlink

```bash
# Link nvim config to ~/.config/nvim
ln -sfn ~/Documents/dotfiles/nvim ~/.config/nvim
```
