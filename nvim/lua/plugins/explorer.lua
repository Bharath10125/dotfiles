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
        opts = {
            close_if_last_window = true,
            popup_border_style = "rounded",
            enable_git_status = true,
            enable_diagnostics = true,
            open_on_tab = false,
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
            default_component_configs = {
                indent = {
                    indent_size = 2,
                    padding = 1,
                    with_markers = true,
                    indent_marker = "│",
                    last_indent_marker = "└",
                    highlight = "NeoTreeIndentMarker",
                    with_expanders = true,
                    expander_collapsed = "",
                    expander_expanded = "",
                    expander_highlight = "NeoTreeExpander",
                },
                icon = {
                    folder_closed = "",
                    folder_open = "",
                    folder_empty = "󰉖",
                    default = "󰈙",
                },
                name = {
                    trailing_slash = false,
                    use_git_status_colors = true,
                },
                git_status = {
                    symbols = {
                        added     = "✚",
                        modified  = "",
                        deleted   = "✖",
                        renamed   = "󰁕",
                        untracked = "",
                        ignored   = "",
                        unstaged  = "󰄱",
                        staged    = "",
                        conflict  = "",
                    },
                },
            },
            filesystem = {
                bind_to_cwd = false,
                follow_current_file = {
                    enabled = true,
                },
                use_libuv_file_watcher = true,
                hijack_netrw_behavior = "open_default",
                filtered_items = {
                    visible = false,
                    hide_dotfiles = false,
                    hide_gitignored = false,
                },
            },
            window = {
                position = "left",
                width = 30,
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
    -- Oil.nvim (In-buffer file manager / optional)
    -----------------------------------------------------------
    {
        "stevearc/oil.nvim",
        opts = {
            default_file_explorer = false,
            view_options = {
                show_hidden = true,
            },
        },
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
}
