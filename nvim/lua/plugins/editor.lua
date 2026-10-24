return {
    -----------------------------------------------------------
    -- Telescope (Quick Open, Fuzzy Search, Grep)
    -----------------------------------------------------------
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        opts = {
            defaults = {
                prompt_prefix = "   ",
                selection_caret = "  ",
                path_display = { "truncate" },
                sorting_strategy = "ascending",
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        preview_width = 0.55,
                    },
                    width = 0.87,
                    height = 0.80,
                },
                file_ignore_patterns = {
                    "node_modules",
                    "%.git/",
                    "dist/",
                    "build/",
                    "__pycache__",
                    "%.o",
                    "%.class",
                },
            },
        },
    },

    -----------------------------------------------------------
    -- ToggleTerm (VS Code Integrated Terminal)
    -----------------------------------------------------------
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        opts = {
            size = function(term)
                if term.direction == "horizontal" then
                    return 14
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                end
            end,
            open_mapping = [[<C-`>]],
            hide_numbers = true,
            shade_terminals = true,
            start_in_insert = true,
            insert_mappings = true,
            terminal_mappings = true,
            persist_size = true,
            direction = "horizontal",
            close_on_exit = true,
            shell = vim.o.shell,
            float_opts = {
                border = "curved",
                winblend = 0,
            },
        },
    },

    -----------------------------------------------------------
    -- Git Signs (Gutter diff, inline blame)
    -----------------------------------------------------------
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            signs = {
                add = { text = "│" },
                change = { text = "│" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
                untracked = { text = "┆" },
            },
            current_line_blame = true,
            current_line_blame_opts = {
                delay = 400,
                virt_text_pos = "eol",
            },
        },
    },

    -----------------------------------------------------------
    -- Which-key (Keymap cheat sheet popup)
    -----------------------------------------------------------
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            preset = "modern",
        },
    },

    -----------------------------------------------------------
    -- Trouble (Problems list / Diagnostic panel)
    -----------------------------------------------------------
    {
        "folke/trouble.nvim",
        opts = {},
        cmd = "Trouble",
    },

    -----------------------------------------------------------
    -- Autopairs (Auto close brackets & quotes)
    -----------------------------------------------------------
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {
            check_ts = true,
        },
    },

    -----------------------------------------------------------
    -- Autotag (Auto close & rename HTML/JSX tags)
    -----------------------------------------------------------
    {
        "windwp/nvim-ts-autotag",
        event = { "BufReadPre", "BufNewFile" },
        opts = {},
    },

    -----------------------------------------------------------
    -- TODO Comments (Highlight & list TODO/FIXME/NOTE)
    -----------------------------------------------------------
    {
        "folke/todo-comments.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
    },
}
