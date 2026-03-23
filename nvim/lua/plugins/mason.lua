return {
    "mason-org/mason.nvim",
    version = "2.x.x",
    dependencies = {
        "nvim-lspconfig",
        "mason-org/mason-lspconfig.nvim",
    },
    config = function()
        require("mason").setup()

        -- Formatters/linters to install via mason (not LSPs)
        local formatters = { "stylua", "ruff", "prettierd" }

        -- LSP server configs are declared in nvim-lspconfig.lua opts.servers
        local servers = require("lazy.core.config").plugins["nvim-lspconfig"].opts.servers
        local server_names = vim.tbl_keys(servers or {})

        -- blink.cmp supports additional completion capabilities, so broadcast that to servers
        local capabilities = require("blink.cmp").get_lsp_capabilities()

        -- Apply per-server config via vim.lsp.config() before enabling
        for server_name, server_opts in pairs(servers) do
            local merged = vim.tbl_deep_extend("force", {}, server_opts, {
                capabilities = vim.tbl_deep_extend(
                    "force",
                    {},
                    capabilities,
                    server_opts.capabilities or {}
                ),
            })
            vim.lsp.config(server_name, merged)
        end

        -- Monkey-patch mason-registry.refresh to guard against nil updated_registries
        -- (upstream bug: https://github.com/mason-org/mason-lspconfig.nvim commit 6b2ba82)
        local registry = require("mason-registry")
        local orig_refresh = registry.refresh
        registry.refresh = function(cb, ...)
            return orig_refresh(function(success, updated_registries)
                if cb then
                    cb(success, updated_registries or {})
                end
            end, ...)
        end

        -- Ensure LSP servers are installed; automatic_enable will call vim.lsp.enable()
        require("mason-lspconfig").setup {
            ensure_installed = server_names,
            automatic_enable = true,
        }

        -- Restore original refresh after setup
        registry.refresh = orig_refresh

        -- Install formatters/linters directly via mason registry
        registry.refresh(function()
            for _, name in ipairs(formatters) do
                local ok, pkg = pcall(registry.get_package, name)
                if ok and not pkg:is_installed() then
                    pkg:install()
                end
            end
        end)
    end,
}
