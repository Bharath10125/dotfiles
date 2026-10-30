-----------------------------------------------------------
-- AUTOCMDS
-----------------------------------------------------------

-----------------------------------------------------------
-- PlatformIO: Detect project and warn if compile_commands.json is missing
-- This is the #1 reason clangd shows errors in PlatformIO projects.
-----------------------------------------------------------
vim.api.nvim_create_autocmd("VimEnter", {
    group = vim.api.nvim_create_augroup("PlatformIODetect", { clear = true }),
    desc = "Detect PlatformIO project and check for compile_commands.json",
    callback = function()
        vim.schedule(function()
            local cwd = vim.fn.getcwd()
            local pio_ini = cwd .. "/platformio.ini"
            local compile_db = cwd .. "/compile_commands.json"

            -- Check if this is a PlatformIO project
            if vim.fn.filereadable(pio_ini) == 1 then
                -- Check if compile_commands.json exists (needed for clangd to find headers)
                if vim.fn.filereadable(compile_db) == 0 then
                    vim.notify(
                        "📡 PlatformIO project detected!\n"
                            .. "⚠️  No compile_commands.json found — clangd may show 'file not found' errors.\n\n"
                            .. "→ Fix: Press <Space>pd to generate it now\n"
                            .. "→ Or run in terminal: pio run -t compiledb",
                        vim.log.levels.WARN,
                        { title = "PlatformIO LSP Setup" }
                    )
                else
                    vim.notify(
                        "📡 PlatformIO project — clangd ready ✓",
                        vim.log.levels.INFO,
                        { title = "PlatformIO LSP" }
                    )
                end
            end
        end)
    end,
})

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
