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
        {
            "<C-t>",
            function()
                local buf = vim.api.nvim_create_buf(false, true)
                vim.api.nvim_buf_set_lines(buf, 0, 1, false, { "testing" })
                local namespace = vim.api.nvim_create_namespace("test")
                ---@diagnostic disable-next-line: param-type-mismatch
                vim.api.nvim_buf_add_highlight(buf, namespace, "Cursor", 0, 0, 1)
                local id =  vim.api.nvim_open_win(buf, false, {
                    relative = "cursor",
                    row = 0,
                    col = 5,
                    width = 10,
                    height = 1,
                    style = "minimal",
                    border = "single",
                    title = "test",
                })
            end,
        }
    },
    opts = {},
}
