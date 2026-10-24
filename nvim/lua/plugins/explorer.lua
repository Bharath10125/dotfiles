return {
    -----------------------------------------------------------
    -- Neo-tree (VS Code Sidebar File Explorer)
    -----------------------------------------------------------
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        cmd = "Neotree",
        opts = {
            close_if_last_window = true,
            popup_border_style = "rounded",
            enable_git_status = true,
            enable_diagnostics = true,
            sources = { "filesystem", "buffers", "git_status" },
            source_selector = {
                winbar = true,
                statusline = false,
                sources = {
                    { source = "filesystem", display_name = " 󰉓 Files " },
                    { source = "buffers", display_name = " 󰈚 Buffers " },
                    { source = "git_status", display_name = " 󰊢 Git " },
                },
            },
            filesystem = {
                follow_current_file = {
                    enabled = true,
                },
                use_libuv_file_watcher = true,
                filtered_items = {
                    visible = false,
                    hide_dotfiles = false,
                    hide_gitignored = false,
                },
            },
            window = {
                width = 32,
                mappings = {
                    ["<space>"] = "none",
                    ["l"] = "open",
                    ["h"] = "close_node",
                    ["P"] = { "toggle_preview", config = { use_float = true } },
                },
            },
        },
    },

    -----------------------------------------------------------
    -- Oil.nvim (In-buffer file manager / editing)
    -----------------------------------------------------------
    {
        "stevearc/oil.nvim",
        opts = {
            view_options = {
                show_hidden = true,
            },
        },
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
}
