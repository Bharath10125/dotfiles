-----------------------------------------------------------
-- NEOVIM CONFIGURATION (VS Code terminal-based setup)
-----------------------------------------------------------

-- 1. Load general options and leader key
require("config.options")

-- 2. Bootstrap lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- 3. Setup plugins from lua/plugins/
require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
    defaults = {
        lazy = false,
    },
    install = {
        colorscheme = { "vscode", "default" },
    },
    checker = {
        enabled = false,
    },
    change_detection = {
        notify = false,
    },
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})

-- 4. Load keymaps and autocommands
require("config.keymaps")
require("config.autocmds")
