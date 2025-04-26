return {
    "zbirenbaum/copilot.lua",
    -- enabled = false,
    event = "InsertEnter",
    keys = {
        {
            "<C-a>",
            function()
                require("copilot.suggestion").accept()
            end,
            mode = "i",
            desc = "[A]ccept copilot suggestion",
        },
        {
            "<C-f>",
            function()
                require("copilot.suggestion").accept_line()
            end,
            mode = "i",
            desc = "[F]inish first line of copilot suggestion",
        },
        {
            "<C-h>",
            function()
                require("copilot.suggestion").dismiss()
            end,
            mode = "i",
            desc = "Dismiss copilot suggestion",
        },
    },
    opts = {
        suggestion = { auto_trigger = true },
        filetypes = {
            gitcommit = true,
        },
    },
}
