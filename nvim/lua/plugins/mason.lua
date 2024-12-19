return {
    "williamboman/mason.nvim",
    version = "1.x.x",
    dependencies = {
        "nvim-lspconfig",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        require("mason").setup()

        -- Ensure formatters and language servers are installed
        local formatters = {
            "stylua",
            "ruff",
            "prettierd",
        }
        -- Configured language servers.
        local ensure_installed = require("lazy.core.config").plugins["nvim-lspconfig"].opts.servers
            or {}
        vim.list_extend(ensure_installed, formatters)
        require("mason-tool-installer").setup({
            ensure_installed = ensure_installed,
        })
    end,
}
