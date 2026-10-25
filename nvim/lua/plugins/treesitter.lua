return {
    -----------------------------------------------------------
    -- Treesitter (Syntax Highlighting & Code Parsing)
    -----------------------------------------------------------
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            local ts = require("nvim-treesitter")
            ts.setup({
                install_dir = vim.fn.stdpath("data") .. "/site",
            })

            ts.install({
                "c",
                "cpp",
                "python",
                "java",
                "javascript",
                "typescript",
                "tsx",
                "lua",
                "bash",
                "json",
                "yaml",
                "html",
                "css",
                "dockerfile",
                "sql",
                "markdown",
                "markdown_inline",
                "vim",
                "vimdoc",
            })
        end,
    },

    -----------------------------------------------------------
    -- Treesitter Context (VS Code Sticky Scroll)
    -----------------------------------------------------------
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            max_lines = 3,
            multiline_threshold = 1,
            trim_scope = "outer",
        },
    },
}
