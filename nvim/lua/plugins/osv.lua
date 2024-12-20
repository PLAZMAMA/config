return {
    "jbyuki/one-small-step-for-vimkind",
    keys = {
        {
            "<leader>dl",
            function()
                require("osv").launch { port = 8086 }
            end,
            desc = "Lua(nvim) [D]ebug Server [L]aunch",
        },
        {
            "<leader>ds",
            function()
                require("osv").stop()
                vim.notify("Server stopped")
            end,
            desc = "Lua(nvim) [D]ebug Server [S]top",
        },
    },
}
