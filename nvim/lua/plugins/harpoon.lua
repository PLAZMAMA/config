return {
    "ThePrimeagen/harpoon",
    version = "*",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local keymap = vim.keymap
        local harpoon = require("harpoon")

        harpoon:setup()
        keymap.set(
            { "n" },
            "<leader>a",
            function()
                harpoon:list():add()
                vim.api.nvim_exec_autocmds("User", { pattern = "HarpoonAdd" })
            end,
            { desc = "[A]dd file to Harpoon" }
        )
        keymap.set(
            { "n", "i", "t" },
            "<C-e>",
            function()
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end,
            { desc = "Toggle Harpoon menue" }
        )
        keymap.set(
            { "n", "i", "t" },
            "<C-7>",
            function()
                harpoon:list():select(1)
            end,
            { desc = "Go to Harpoon first file" }
        )
        keymap.set(
            { "n", "i", "t" },
            "<C-8>",
            function()
                harpoon:list():select(2)
            end,
            { desc = "Go to Harpoon second file" }
        )
        keymap.set(
            { "n", "i", "t" },
            "<C-9>",
            function()
                harpoon:list():select(3)
            end,
            { desc = "Go to Harpoon third file" }
        )
        keymap.set(
            { "n", "i", "t" },
            "<C-0>",
            function()
                harpoon:list():select(4)
            end,
            { desc = "Go to Harpoon fourth file" }
        )
    end,
}
