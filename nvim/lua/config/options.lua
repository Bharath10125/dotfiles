-----------------------------------------------------------
-- OPTIONS (VS Code feel)
-----------------------------------------------------------
local opt = vim.opt

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Line numbers (hybrid relative + absolute current line)
opt.number = true
opt.relativenumber = true

-- Tabs & Indentation (4 spaces default, smart tabs)
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

-- Search settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Appearance & Colors
opt.termguicolors = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.showmode = false -- Lualine already shows the mode

-- Splits (open right and below like VS Code)
opt.splitright = true
opt.splitbelow = true

-- Mouse support (click tabs, file tree, scroll)
opt.mouse = "a"

-- Clipboard (system clipboard integration)
opt.clipboard = "unnamedplus"

-- Undo & Backup
opt.undofile = true
opt.swapfile = false
opt.backup = false

-- Scrolling comfort
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.wrap = false

-- Performance & Responsive UI
opt.updatetime = 200
opt.timeoutlen = 300

-- Prompt to save file when closing unsaved buffer
opt.confirm = true

-- Block selection allows cursor anywhere
opt.virtualedit = "block"

-- Disable built-in netrw in favor of Neo-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
