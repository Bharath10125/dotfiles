return {
    -----------------------------------------------------------
    -- VS Code Theme
    -----------------------------------------------------------
    {
        "Mofiqul/vscode.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("vscode").setup({
                transparent = false,
                italic_comments = true,
                underline_links = true,
                cursorline = true,
            })
            vim.cmd("colorscheme vscode")
        end,
    },

    -----------------------------------------------------------
    -- Icons
    -----------------------------------------------------------
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
        opts = {},
    },

    -----------------------------------------------------------
    -- Editor Tabs (VS Code bufferline)
    -----------------------------------------------------------
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = "VeryLazy",
        opts = {
            options = {
                mode = "buffers",
                style_preset = 1,
                always_show_bufferline = true,
                show_buffer_close_icons = true,
                show_close_icon = false,
                color_icons = true,
                diagnostics = "nvim_lsp",
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "EXPLORER",
                        highlight = "Directory",
                        text_align = "left",
                    },
                },
            },
        },
    },

    -----------------------------------------------------------
    -- Breadcrumbs (VS Code winbar: File > Class > Function)
    -----------------------------------------------------------
    {
        "Bekaboo/dropbar.nvim",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {},
    },

    -----------------------------------------------------------
    -- Indent Guidelines (VS Code indentation lines)
    -----------------------------------------------------------
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            indent = {
                char = "│",
                tab_char = "│",
            },
            scope = { enabled = true },
            exclude = {
                filetypes = {
                    "help",
                    "neo-tree",
                    "Trouble",
                    "lazy",
                    "mason",
                    "toggleterm",
                },
            },
        },
    },

    -----------------------------------------------------------
    -- Statusline
    -----------------------------------------------------------
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            options = {
                theme = "auto",
                globalstatus = true,
                section_separators = "",
                component_separators = "",
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = { { "filename", path = 1 } },
                lualine_x = { "encoding", "fileformat", "filetype" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
        },
    },
}
