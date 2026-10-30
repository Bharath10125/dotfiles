return {
    -----------------------------------------------------------
    -- Mason (Package Manager for LSPs, Formatters, Linters)
    -----------------------------------------------------------
    {
        "williamboman/mason.nvim",
        opts = {
            ui = {
                border = "rounded",
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        },
    },

    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        opts = {
            ensure_installed = {
                "basedpyright",
                "clangd",
                "ts_ls",
                "html",
                "cssls",
                "lua_ls",
                "bashls",
                "jsonls",
                "yamlls",
            },
            automatic_installation = true,
        },
    },

    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        dependencies = { "williamboman/mason.nvim" },
        opts = {
            ensure_installed = {
                -- Formatters
                "prettier",
                "stylua",
                "ruff",
                "clang-format",
                "shfmt",
            },
            auto_update = false,
            run_on_start = true,
        },
    },

    -----------------------------------------------------------
    -- Autocompletion (Blink.cmp - fast, modern VS Code feel)
    -----------------------------------------------------------
    {
        "saghen/blink.cmp",
        version = "1.*",
        opts = {
            keymap = {
                preset = "enter",
                ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
                ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
            },
            appearance = {
                nerd_font_variant = "mono",
            },
            completion = {
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 200,
                    window = { border = "rounded" },
                },
                menu = {
                    border = "rounded",
                    draw = {
                        columns = {
                            { "label", "label_description", gap = 1 },
                            { "kind_icon", "kind", gap = 1 },
                        },
                    },
                },
            },
            sources = {
                default = { "lsp", "path", "buffer", "snippets" },
            },
            fuzzy = {
                implementation = "prefer_rust_with_warning",
            },
        },
    },

    -----------------------------------------------------------
    -- LSP Config (Language Server Protocol)
    -----------------------------------------------------------
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "saghen/blink.cmp",
        },
        config = function()
            -- Visual diagnostic customization (rounded borders, signs)
            vim.diagnostic.config({
                virtual_text = {
                    prefix = "●",
                },
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = " ",
                        [vim.diagnostic.severity.WARN] = " ",
                        [vim.diagnostic.severity.INFO] = " ",
                        [vim.diagnostic.severity.HINT] = "󰌵 ",
                    },
                },
                underline = true,
                update_in_insert = false,
                severity_sort = true,
                float = {
                    border = "rounded",
                    source = "always",
                },
            })

            -- Configure blink.cmp capabilities for all LSPs
            local blink_cmp = require("blink.cmp")
            local capabilities = blink_cmp.get_lsp_capabilities()

            if vim.lsp.config then
                vim.lsp.config("*", { capabilities = capabilities })
            end

            -- Lua LSP settings (recognize `vim` global and Neovim API)
            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        },
                        telemetry = { enable = false },
                    },
                },
            })

            -- Clangd settings (C / C++ and PlatformIO embedded)
            -- --query-driver lets clangd run cross-compilers (avr-gcc, xtensa-g++, arm-none-eabi-gcc etc.)
            -- to automatically discover their system include paths, which fixes all
            -- "file not found" errors in PlatformIO projects (Arduino.h, esp_system.h, etc.)
            vim.lsp.config("clangd", {
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--header-insertion=iwyu",
                    "--completion-style=detailed",
                    "--function-arg-placeholders",
                    "--fallback-style=llvm",
                    -- Glob pattern (NOT expanded by vim) — clangd uses this itself to
                    -- whitelist cross-compilers and extract their system include paths.
                    "--query-driver="
                        .. os.getenv("HOME")
                        .. "/.platformio/packages/toolchain-*/bin/*,"
                        .. os.getenv("HOME")
                        .. "/.platformio/packages/toolchain-*/*/bin/*",
                },
            })

            -- BasedPyright (Python)
            vim.lsp.config("basedpyright", {
                settings = {
                    basedpyright = {
                        analysis = {
                            typeCheckingMode = "basic",
                            autoSearchPaths = true,
                            useLibraryCodeForTypes = true,
                            diagnosticMode = "workspace",
                        },
                    },
                },
            })

            -- Enable language servers
            local servers = {
                "lua_ls",
                "clangd",
                "basedpyright",
                "ts_ls",
                "html",
                "cssls",
                "bashls",
                "jsonls",
                "yamlls",
            }
            for _, server in ipairs(servers) do
                vim.lsp.enable(server)
            end
        end,
    },

    -----------------------------------------------------------
    -- Conform (Auto-Formatting on Save)
    -----------------------------------------------------------
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "ruff_format" },
                c = { "clang_format" },
                cpp = { "clang_format" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                html = { "prettier" },
                css = { "prettier" },
                json = { "prettier" },
                yaml = { "prettier" },
                sh = { "shfmt" },
                bash = { "shfmt" },
            },
            format_on_save = {
                timeout_ms = 1000,
                lsp_format = "fallback",
            },
        },
    },
}
