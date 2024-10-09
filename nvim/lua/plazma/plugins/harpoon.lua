return {
    "ThePrimeagen/harpoon",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local keymap = vim.keymap
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")
        
        keymap.set("n", "<leader>a", mark.add_file)
        keymap.set("n", "<C-e>", ui.toggle_quick_menu)
        keymap.set("n", "<C-7>", function() ui.nav_file(1) end)
        keymap.set("n", "<C-8>", function() ui.nav_file(2) end)
        keymap.set("n", "<C-9>", function() ui.nav_file(3) end)
        keymap.set("n", "<C-0>", function() ui.nav_file(4) end)
    end,
}
