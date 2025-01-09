return {
    -- "PLAZMAMA/bunnyhop.nvim",
    dir = "~/src/bunnyhop.nvim/",
    -- enabled = false,
    lazy = false,
    keys = {
        {
            "<C-h>",
            function()
                require("bunnyhop").hop()
            end,
            desc = "[H]op to predicted location.",
        },
    },
    opts = { api_key = "HF_API_KEY" },
}
