-----------------------------------------------------------
-- AUTOCMDS
-----------------------------------------------------------

-- Automatically open Neo-tree sidebar on the left on startup (VS Code behavior)
local neotree_group = vim.api.nvim_create_augroup("NeotreeOnStartup", { clear = true })
vim.api.nvim_create_autocmd("VimEnter", {
    group = neotree_group,
    desc = "Open Neo-tree sidebar on startup like VS Code",
    callback = function(data)
        -- Skip in diff mode, stdin, or git commit messages
        if vim.opt.diff:get() then
            return
        end
        local ft = vim.bo.filetype
        if ft == "gitcommit" or ft == "gitrebase" then
            return
        end

        local is_dir = vim.fn.isdirectory(data.file) == 1

        if is_dir then
            vim.cmd.cd(data.file)
            vim.cmd("enew")
            require("neo-tree.command").execute({ action = "show", source = "filesystem", position = "left" })
        else
            require("neo-tree.command").execute({ action = "show", source = "filesystem", position = "left" })
        end
    end,
})

-- Highlight yanked text briefly (VS Code visual feedback)
local yank_group = vim.api.nvim_create_augroup("HighlightYank", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    group = yank_group,
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
    end,
})

-- Automatically enable treesitter syntax highlighting
vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
        pcall(vim.treesitter.start, args.buf)
    end,
})

-- Terminal settings: no line numbers, start in insert mode
local term_group = vim.api.nvim_create_augroup("TerminalSettings", { clear = true })
vim.api.nvim_create_autocmd("TermOpen", {
    group = term_group,
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.opt_local.signcolumn = "no"
        vim.cmd("startinsert")
    end,
})

-- Resize splits if terminal window is resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
    callback = function()
        local current_tab = vim.fn.tabpagenr()
        vim.cmd("tabdo wincmd =")
        vim.cmd("tabnext " .. current_tab)
    end,
})

-- Close certain utility windows with 'q'
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "help", "lspinfo", "man", "qf", "checkhealth", "notify" },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
    end,
})
