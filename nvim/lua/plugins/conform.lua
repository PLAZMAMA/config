-- Autoformat
return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<C-f>",
            function()
                require("conform").format { async = true, lsp_format = "fallback" }
            end,
            mode = "",
            desc = "[F]ormat buffer",
        },
    },
    opts = {
        notify_on_error = false,
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "ruff_organize_imports", "ruff_format" },
            -- You can use 'stop_after_first' to run the first available formatter from the list
            javascript = { "prettierd" },
            html = { "prettierd" },
            c = { "clangd" },
            cpp = { "clangd" },
        },
    },
}
