return {
    "rcarriga/nvim-dap-ui",
    dependencies = { "nvim-neotest/nvim-nio" },
    keys = {
        {
            "<leader>de",
            function()
                -- Calling twice to open and jump to window.
                require("dapui").eval()
                require("dapui").eval()
            end,
            desc = "[D]ebug [E]val",
        },
    },
    opts = {
        controls = { enabled = false },
        floating = { border = "rounded" },
        layouts = {
            {
                elements = {
                    { id = "watches", size = 0.5 },
                    { id = "scopes", size = 0.5 },
                },
                position = "left",
                size = 40,
            },
            {
                elements = {
                    { id = "repl", size = 1 },
                },
                position = "bottom",
                size = 10,
            },
        },
    },
    config = function(_, opts)
        -- Automatically open debug UI when debugging.
        local dap, dapui = require("dap"), require("dapui")
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end
        dapui.setup(opts)
    end,
}
