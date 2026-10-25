return {
    -----------------------------------------------------------
    -- PlatformIO (Embedded Development: Arduino, ESP32, STM32)
    -----------------------------------------------------------
    {
        "anurag3301/nvim-platformio.lua",
        dependencies = {
            "akinsho/toggleterm.nvim",
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
        },
        cmd = {
            "Pioinit",
            "Piocmd",
        },
        keys = {
            { "<leader>pm", "<cmd>Pioinit<cr>", desc = "PlatformIO Init / Menu" },
            {
                "<leader>pb",
                function()
                    require("toggleterm").exec("pio run")
                end,
                desc = "PlatformIO: Build / Compile",
            },
            {
                "<leader>pu",
                function()
                    require("toggleterm").exec("pio run --target upload")
                end,
                desc = "PlatformIO: Upload Firmware",
            },
            {
                "<leader>ps",
                function()
                    require("toggleterm").exec("pio device monitor")
                end,
                desc = "PlatformIO: Serial Monitor",
            },
            {
                "<leader>pr",
                function()
                    require("toggleterm").exec("pio run --target upload && pio device monitor")
                end,
                desc = "PlatformIO: Upload & Monitor",
            },
            {
                "<leader>pc",
                function()
                    require("toggleterm").exec("pio run --target clean")
                end,
                desc = "PlatformIO: Clean Build",
            },
            {
                "<leader>pd",
                function()
                    require("toggleterm").exec("pio run --target compiledb")
                end,
                desc = "PlatformIO: Generate Clangd DB (compile_commands.json)",
            },
            {
                "<leader>pl",
                function()
                    require("toggleterm").exec("pio device list")
                end,
                desc = "PlatformIO: List Devices / Ports",
            },
        },
        opts = {
            lsp = "clangd",
            clangd_source = "compiledb",
            picker_backend = "telescope",
        },
    },
}
