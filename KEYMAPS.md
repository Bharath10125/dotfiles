# 🚀 Neovim (VS Code Style) Beginner Cheat Sheet

A quick reference guide for your terminal-based IDE setup.

> **💡 Inside Neovim:**
> * Press <kbd>F1</kbd> or `<Space>` + `?` to open this cheat sheet in a popup window anytime!
> * Press `<Space>` + `sk` to search all active shortcuts with fuzzy search!

---

## 📂 1. File Navigation & Sidebar

| Shortcut | VS Code Equivalent | What it does |
| :--- | :--- | :--- |
| <kbd>Ctrl</kbd> + <kbd>s</kbd> | `Ctrl + S` | **Save file** (works in Normal, Insert, and Visual mode) |
| <kbd>Ctrl</kbd> + <kbd>b</kbd> | `Ctrl + B` | **Toggle Left File Tree Sidebar** (`Neo-tree`) |
| `<Space>` + `e` | `Ctrl + B` | Toggle File Tree Sidebar |
| `<Space>` + `E` | Reveal File | Find and highlight active file in the sidebar tree |
| <kbd>Ctrl</kbd> + <kbd>p</kbd> | `Ctrl + P` | **Quick Open file** by name (`Telescope`) |
| `<Space>` + `ff` | `Ctrl + P` | Find file by name |
| `<Space>` + `fb` | Open Editors | Switch between open file tabs |
| `<Space>` + `fr` | Recent Files | Search recently opened files |
| <kbd>Ctrl</kbd> + <kbd>w</kbd> | `Ctrl + W` | **Close current file tab** |
| `<Space>` + `x` | `Ctrl + W` | Close current file tab |

---

## 🔍 2. Search & Replace

| Shortcut | VS Code Equivalent | What it does |
| :--- | :--- | :--- |
| `<Space>` + `fg` | `Ctrl + Shift + F` | **Live text search** across the entire project |
| `<Space>` + `/` | `Ctrl + Shift + F` | Live text search across project |
| <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>H</kbd> | `Ctrl + Shift + H` | **Global Search & Replace panel** (`Grug-far`) |
| `<Space>` + `sr` | `Ctrl + Shift + H` | Open Global Search & Replace panel |
| `<Space>` + `sw` | Replace word | Search & replace the word under your cursor |
| <kbd>Esc</kbd> | `Esc` | Clear yellow search highlight |

---

## ✏️ 3. Editing & Multi-Cursor

| Shortcut | VS Code Equivalent | What it does |
| :--- | :--- | :--- |
| <kbd>Ctrl</kbd> + <kbd>d</kbd> | `Ctrl + D` | **Multi-cursor**: Select word & add cursor on next match |
| <kbd>Alt</kbd> + <kbd>↑</kbd> | `Alt + ↑` | **Move current line up** |
| <kbd>Alt</kbd> + <kbd>↓</kbd> | `Alt + ↓` | **Move current line down** |
| <kbd>Ctrl</kbd> + <kbd>/</kbd> | `Ctrl + /` | **Toggle comment** on current line or selection |
| <kbd><</kbd> / <kbd>></kbd> | `Shift + Tab` / `Tab` | Indent / unindent selected block in visual mode |
| `cs"'` | Surround | Change surrounding `"double quotes"` to `'single quotes'` |
| `ysiw)` | Surround | Wrap current word in `(parentheses)` |
| `ds"` | Surround | Delete surrounding `"quotes"` |

---

## 🖥️ 4. Terminal, Tabs & Windows

| Shortcut | VS Code Equivalent | What it does |
| :--- | :--- | :--- |
| <kbd>Ctrl</kbd> + <kbd>`</kbd> | `Ctrl + \`` | **Toggle bottom integrated terminal** |
| <kbd>Ctrl</kbd> + <kbd>j</kbd> | `Ctrl + J` | Toggle bottom terminal |
| `<Space>` + `tf` | Terminal | Open floating terminal window |
| <kbd>Tab</kbd> | Next Tab | Switch to **next open tab** |
| <kbd>Shift</kbd> + <kbd>Tab</kbd> | Prev Tab | Switch to **previous open tab** |
| <kbd>Ctrl</kbd> + <kbd>h</kbd> | Switch pane | Move cursor to **left window** (e.g. into file tree) |
| <kbd>Ctrl</kbd> + <kbd>l</kbd> | Switch pane | Move cursor to **right window** (e.g. into editor) |
| <kbd>Ctrl</kbd> + <kbd>j</kbd> / <kbd>k</kbd> | Switch pane | Move cursor to bottom / top window |
| `<Space>` + `wv` | Split Editor | Split window vertically |
| `<Space>` + `ws` | Split Editor | Split window horizontally |

---

## 🧠 5. Code Intelligence & LSP

| Shortcut | VS Code Equivalent | What it does |
| :--- | :--- | :--- |
| <kbd>F2</kbd> | `F2` | **Rename symbol** across whole project |
| `<Space>` + `cr` | `F2` | Rename symbol |
| <kbd>F12</kbd> or `gd` | `F12` | **Go to Definition** |
| <kbd>Shift</kbd> + <kbd>F12</kbd> or `gr` | `Shift + F12` | **Find all References** |
| <kbd>K</kbd> | Hover tooltip | Show documentation / type signature |
| <kbd>Alt</kbd> + <kbd>Enter</kbd> | `Alt + Enter` / `Ctrl + .` | **Quick Fix / Code Actions** (`<Space>ca`) |
| <kbd>Shift</kbd> + <kbd>Alt</kbd> + <kbd>F</kbd> | `Shift + Alt + F` | **Format Document** (`<Space>cf`, auto on save) |
| `[d` / `]d` | Next/Prev error | Jump to previous / next error or warning |
| `<Space>` + `xx` | Problems panel | Toggle Trouble workspace diagnostics list |

---

## 🌲 6. File Explorer Sidebar Keys (When inside Neo-tree)

| Key | What it does |
| :--- | :--- |
| <kbd>Enter</kbd> or `l` | Open file / expand folder |
| `h` | Collapse folder |
| `a` | **Add new file** (`name.py`) or **new folder** (`folder/`) |
| `d` | **Delete** file or folder (asks confirmation) |
| `r` | **Rename** file or folder |
| `c` | **Copy** file |
| `m` | **Move / Cut** file |
| `H` | Toggle hidden files (`.dotfiles`) |
| `P` | Toggle floating file preview |

---

## ⚡ 7. PlatformIO (Embedded Development)

| Shortcut | Action | Command Executed |
| :--- | :--- | :--- |
| `<Space>` + `pm` | **PlatformIO Wizard** | Initialize project, select board & framework (`:Pioinit`) |
| `<Space>` + `pb` | **Build / Compile** | `pio run` (runs in bottom terminal) |
| `<Space>` + `pu` | **Upload Firmware** | `pio run --target upload` |
| `<Space>` + `ps` | **Serial Monitor** | `pio device monitor` |
| `<Space>` + `pr` | **Upload & Monitor** | `pio run -t upload && pio device monitor` |
| `<Space>` + `pd` | **Generate Clangd DB** | `pio run -t compiledb` (enables full autocomplete for Arduino / ESP32) |
| `<Space>` + `pc` | **Clean Build** | `pio run --target clean` |
| `<Space>` + `pl` | **List Devices** | `pio device list` (shows connected COM ports) |
