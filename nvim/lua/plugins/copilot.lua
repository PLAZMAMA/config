return {
    "zbirenbaum/copilot.lua",
    -- enabled = false,
    event = "InsertEnter",
    keys = {
        {
            "<C-a><C-a>",
            function()
                require("copilot.suggestion").accept()
            end,
            mode = "i",
            desc = "Accept copilot suggestion",
        },
        {
            "<C-a><C-w>",
            function()
                require("copilot.suggestion").accept_word()
            end,
            mode = "i",
            desc = "Accept the first word of copilot suggestion",
        },
        {
            "<C-a><C-l>",
            function()
                require("copilot.suggestion").accept_line()
            end,
            mode = "i",
            desc = "Accept the first line of copilot suggestion",
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
        copilot_model = "gpt-4o-copilot"
    },
}
