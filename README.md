# Dotfiles

My personal development environment configuration files.

## Contents

- [`.zshrc`](file:///home/bharath/Documents/dotfiles/.zshrc) – Zsh shell configuration (Oh-My-Zsh, plugins, NVM, aliases)
- [`nvim/`](file:///home/bharath/Documents/dotfiles/nvim) – VS Code-style terminal-based IDE configuration for Neovim (v0.12+)
- [`KEYMAPS.md`](file:///home/bharath/Documents/dotfiles/KEYMAPS.md) – Beginner cheat sheet of all IDE shortcuts & VS Code equivalents

### Neovim Features

- **VS Code Theme**: Dark+ color palette (`vscode.nvim`)
- **File Explorer Sidebar**: Auto-opens on the left on startup (`neo-tree.nvim`)
- **Editor Tabs**: Tab bar with icons & close buttons (`bufferline.nvim`)
- **Breadcrumbs Bar**: Clickable `File > Class > Function` at top (`dropbar.nvim`)
- **Sticky Scroll**: Functions/classes stick to the top as you scroll (`treesitter-context`)
- **Multi-Cursor**: Press <kbd>Ctrl</kbd> + <kbd>d</kbd> to add cursors (`vim-visual-multi`)
- **Project Search & Replace**: Global search & replace panel (`grug-far.nvim`)
- **Integrated Terminal**: Bottom terminal with <kbd>Ctrl</kbd> + <kbd>`</kbd> (`toggleterm.nvim`)
- **PlatformIO Embedded**: Build, upload, serial monitor, board wizard (`nvim-platformio.lua`)
- **LSP & Formatters**: C/C++, Python, JS/TS, HTML, CSS, Bash, Lua with format-on-save

### Setup / Symlinks

```bash
# Link Neovim configuration
ln -sfn ~/Documents/dotfiles/nvim ~/.config/nvim

# Link Zsh configuration
ln -sfn ~/Documents/dotfiles/.zshrc ~/.zshrc
```
