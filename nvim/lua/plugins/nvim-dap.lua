return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "williamboman/mason.nvim",
        "jbyuki/one-small-step-for-vimkind",
    },
    keys = {
        {
            "<leader>dc",
            function()
                require("dap").continue()
            end,
            noremap = true,
            desc = "[D]ebug [C]ontinue",
        },
        {
            "<M-j>",
            function()
                require("dap").step_over()
            end,
            noremap = true,
            desc = "Debug Step Over",
        },
        {
            "<M-l>",
            function()
                require("dap").step_into()
            end,
            noremap = true,
            desc = "Debug Step Into",
        },
        {
            "<M-k>",
            function()
                require("dap").step_back()
            end,
            noremap = true,
            desc = "Debug Step Out",
        },
        {
            "<M-h>",
            function()
                require("dap").step_out()
            end,
            noremap = true,
            desc = "Debug Step Out",
        },
        {
            "<leader>db",
            function()
                require("dap").toggle_breakpoint()
            end,
            noremap = true,
            desc = "[D]ebug Toggle [B]reakpoint",
        },
        {
            "<leader>dB",
            function()
                require("dap").set_breakpoint(vim.fn.input("Condition: "))
            end,
            noremap = true,
            desc = "[D]ebug Set Conditional [B]reakpoint",
        },
        {
            "<leader>dt",
            function()
                require("dap").terminate()
            end,
            noremap = true,
            desc = "[D]ebug [T]erminate",
        },
    },
    config = function()
        local dap = require("dap")
        -- Lua config.
        dap.configurations.lua = {
            {
                type = "nlua",
                request = "attach",
                name = "Attach to running Neovim instance",
            },
        }
        dap.adapters.nlua = function(callback, config)
            callback({
                type = "server",
                host = config.host or "127.0.0.1",
                port = config.port or 8086,
            })
        end
    end,
}
