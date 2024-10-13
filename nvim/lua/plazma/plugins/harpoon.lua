return {
    "ThePrimeagen/harpoon",
    version="",
    branch="harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local keymap = vim.keymap
        local harpoon = require("harpoon")

        harpoon:setup()
        keymap.set("n", "<leader>a", function() harpoon:list():add() end)
        keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
        keymap.set("n", "<C-7>", function() harpoon:list():select(1) end)
        keymap.set("n", "<C-8>", function() harpoon:list():select(2) end)
        keymap.set("n", "<C-9>", function() harpoon:list():select(1) end)
        keymap.set("n", "<C-0>", function() harpoon:list():select(1) end)
    end,
}
