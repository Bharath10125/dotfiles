-----------------------------------------------------------
-- KEYMAPS (VS Code shortcuts & Ergonomics)
-----------------------------------------------------------
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Clear search highlight with Escape
keymap("n", "<Esc>", "<cmd>nohlsearch<cr>", opts)

-----------------------------------------------------------
-- File & Buffer Operations (VS Code feel)
-----------------------------------------------------------

-- Save file (Ctrl+s in Normal, Insert, Visual mode)
keymap({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Close current buffer (VS Code Ctrl+w feel)
keymap("n", "<leader>x", "<cmd>bdelete<cr>", { desc = "Close current buffer" })
keymap("n", "<C-w>", "<cmd>bdelete<cr>", { desc = "Close current buffer" })

-- Quit Neovim
keymap("n", "<leader>q", "<cmd>qa<cr>", { desc = "Quit all" })

-----------------------------------------------------------
-- Explorer & Terminal (VS Code Sidebar & Panel)
-----------------------------------------------------------

-- Toggle File Explorer (Ctrl+b or Space+e)
keymap("n", "<C-b>", "<cmd>Neotree toggle<cr>", { desc = "Toggle File Explorer" })
keymap("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle File Explorer" })
keymap("n", "<leader>E", "<cmd>Neotree reveal<cr>", { desc = "Reveal file in Explorer" })
keymap("n", "<leader>o", "<cmd>Oil<cr>", { desc = "Open Oil file manager" })

-- Toggle Terminal (Ctrl+` or Ctrl+j or Space+t)
keymap({ "n", "t" }, "<C-`>", "<cmd>ToggleTerm<cr>", { desc = "Toggle Terminal" })
keymap({ "n", "t" }, "<C-j>", "<cmd>ToggleTerm<cr>", { desc = "Toggle Terminal" })
keymap("n", "<leader>t", "<cmd>ToggleTerm<cr>", { desc = "Toggle Terminal" })
keymap("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Floating Terminal" })
keymap("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Horizontal Terminal" })
keymap("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical size=60<cr>", { desc = "Vertical Terminal" })

-- Terminal mode: easily escape terminal insert mode with Esc or Ctrl+\ Ctrl+N
keymap("t", "<Esc><Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-----------------------------------------------------------
-- Editor Tabs Navigation (Bufferline)
-----------------------------------------------------------

-- Next / Previous Tab (Tab and Shift-Tab)
keymap("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer tab" })
keymap("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer tab" })
keymap("n", "<leader>bn", "<cmd>BufferLineCycleNext<cr>", { desc = "Next tab" })
keymap("n", "<leader>bp", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous tab" })
keymap("n", "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", { desc = "Close other tabs" })

-----------------------------------------------------------
-- Search & Quick Open (VS Code Telescope mappings)
-----------------------------------------------------------

-- Quick Open / Find Files (Ctrl+p or Space+ff)
keymap("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "Quick open file" })
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })

-- Global Search / Live Grep (Ctrl+Shift+F or Space+fg or Space+/)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Search text across workspace" })
keymap("n", "<leader>/", "<cmd>Telescope live_grep<cr>", { desc = "Search text across workspace" })
keymap("n", "<C-S-f>", "<cmd>Telescope live_grep<cr>", { desc = "Search text across workspace" })

-- Command Palette (Ctrl+Shift+P or Space+fc)
keymap("n", "<leader>fc", "<cmd>Telescope commands<cr>", { desc = "Command palette" })
keymap("n", "<C-S-p>", "<cmd>Telescope commands<cr>", { desc = "Command palette" })

-- Open Buffers / Recent Files
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find open buffers" })
keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Find recent files" })

-----------------------------------------------------------
-- Code Editing Comfort (VS Code Line Moving & Comments)
-----------------------------------------------------------

-- Move lines up/down with Alt+Up/Down or Alt+j/k
keymap("n", "<A-Down>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
keymap("n", "<A-Up>", "<cmd>m .-2<cr>==", { desc = "Move line up" })
keymap("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
keymap("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move line up" })

keymap("i", "<A-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move line down" })
keymap("i", "<A-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move line up" })
keymap("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move line down" })
keymap("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move line up" })

keymap("v", "<A-Down>", ":m '>+1<cr>gv=gv", { desc = "Move selection down" })
keymap("v", "<A-Up>", ":m '<-2<cr>gv=gv", { desc = "Move selection up" })
keymap("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move selection down" })
keymap("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move selection up" })

-- Indent lines in visual mode and keep visual selection
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Comment line / selection (Ctrl+/ and Ctrl+_)
keymap({ "n", "v" }, "<C-/>", "gcc", { remap = true, desc = "Toggle comment" })
keymap({ "n", "v" }, "<C-_>", "gcc", { remap = true, desc = "Toggle comment" })

-----------------------------------------------------------
-- Window Navigation & Resizing
-----------------------------------------------------------

-- Navigate windows with Ctrl+h/j/k/l
keymap("n", "<C-h>", "<C-w>h", { desc = "Focus left window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Focus bottom window" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Focus top window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Focus right window" })

-- Resize window with Ctrl + Arrow keys
keymap("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
keymap("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
keymap("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
keymap("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Split windows
keymap("n", "<leader>wv", "<cmd>vsplit<cr>", { desc = "Split vertical" })
keymap("n", "<leader>ws", "<cmd>split<cr>", { desc = "Split horizontal" })
keymap("n", "<leader>wd", "<cmd>close<cr>", { desc = "Close split" })

-----------------------------------------------------------
-- LSP & Code Intelligence (VS Code keys)
-----------------------------------------------------------

-- Rename symbol (F2 or Space+cr)
keymap("n", "<F2>", vim.lsp.buf.rename, { desc = "Rename symbol" })
keymap("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename symbol" })

-- Go to Definition (F12 or gd)
keymap("n", "<F12>", vim.lsp.buf.definition, { desc = "Go to definition" })
keymap("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
keymap("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
keymap("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })

-- Find References (Shift+F12 or gr)
keymap("n", "<S-F12>", vim.lsp.buf.references, { desc = "Find references" })
keymap("n", "gr", vim.lsp.buf.references, { desc = "Find references" })

-- Hover Documentation (K)
keymap("n", "K", function()
    vim.lsp.buf.hover({ border = "rounded" })
end, { desc = "Hover documentation" })

-- Signature Help (Ctrl+k in insert mode)
keymap("i", "<C-k>", function()
    vim.lsp.buf.signature_help({ border = "rounded" })
end, { desc = "Signature help" })

-- Code Action (Alt+Enter or Ctrl+. or Space+ca)
keymap({ "n", "v" }, "<A-CR>", vim.lsp.buf.code_action, { desc = "Code action / Quick fix" })
keymap({ "n", "v" }, "<C-.>", vim.lsp.buf.code_action, { desc = "Code action / Quick fix" })
keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action / Quick fix" })

-- Format Document (Shift+Alt+F or Space+cf)
keymap({ "n", "v" }, "<S-A-f>", function()
    require("conform").format({ lsp_format = "fallback", async = true })
end, { desc = "Format document" })
keymap({ "n", "v" }, "<leader>cf", function()
    require("conform").format({ lsp_format = "fallback", async = true })
end, { desc = "Format document" })

-- Diagnostic navigation & float
keymap("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
keymap("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
keymap("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line diagnostics" })

-- Trouble diagnostics panel (Problems panel)
keymap("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
keymap("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)" })
