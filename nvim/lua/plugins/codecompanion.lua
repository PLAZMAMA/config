-- TODO: Add custom prompts for function definition generation in different languages. (partly coming up in the next version hopefully)
return {
    "olimorris/codecompanion.nvim",
    enabled = true,
    version = "*",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "MeanderingProgrammer/render-markdown.nvim",
        "zbirenbaum/copilot.lua", -- Optional: For using slash commands and variables in the chat buffer
        "saghen/blink.cmp",
        "nvim-telescope/telescope.nvim", -- Optional: For using slash commands
        { "stevearc/dressing.nvim", opts = {} }, -- Optional: Improves `vim.ui.select`
    },
    keys = {
        {
            "<leader>sa",
            "<cmd>CodeCompanionActions<cr>",
            noremap = true,
            silent = true,
            desc = "[S]earch Code Companion [A]ctions",
        },
        {
            "<leader>ct",
            "<cmd>CodeCompanionChat Toggle<cr>",
            noremap = true,
            desc = "Code Companion [C]hat [T]oggle",
        },
        {
            "<leader>ct",
            "<cmd>CodeCompanionChat<cr>",
            mode = "v",
            noremap = true,
            desc = "Code Companion [C]hat [T]oggle",
        },
        {
            "<leader>ce",
            "<cmd>CodeCompanion /explain<cr>",
            mode = "v",
            noremap = true,
            silent = true,
            desc = "[C]ode Companion [E]xplain",
        },
        {
            "<leader>cc",
            "<cmd>CodeCompanion<cr>",
            mode = { "n", "v" },
            noremap = true,
            desc = "Launch [C]ode [C]ompanion",
        },
    },
    opts = {
        send_code = true,
        log_level = "DEBUG",
        display = {
            chat = {
                render_headers = true,
                show_settings = true,
            },
            diff = {
                enabled = true,
                close_chat_at = 240,
                layout = "vertical",
                opts = {
                    "internal",
                    "filler",
                    "closeoff",
                    "algorithm:patience",
                    "followwrap",
                    "linematch:120",
                },
                provider = "default",
            },
        },
        strategies = {
            chat = {
                adapter = "gemini",
            },
            inline = {
                adapter = "copilot",
            },
            agent = {
                adapter = "copilot",
            },
        },
        adapters = {
            copilot = function()
                return require("codecompanion.adapters").extend("copilot", {
                    schema = {
                        model = {
                            default = "claude-3.7-sonnet",
                        },
                    },
                    num_ctx = {
                        default = 32000,
                    },
                })
            end,
            gemini = function()
                return require("codecompanion.adapters").extend("gemini", {
                    schema = {
                        model = {
                            default = "gemini-2.5-pro-exp-03-25",
                        },
                    },
                    env = {
                        api_key = "GEMINI_API_KEY",
                    },
                })
            end,
            opts = {},
        },
    },
}

--------------------------------------------------------------------------
-- Doesn't work yet
-- Keybinding for the prompt in prompt_library that doesn't work.
-- vim.api.nvim_set_keymap('v', '<leader>cn', '<cmd>CodeCompanion /naming<cr>', { noremap = true, silent = true })

-- prompt_library = {
--   -- Custom promps/behaviors (ex. /{custom_behavior_name})
--   ['Naming'] = {
--     strategy = 'inline',
--     description = 'Give betting naming for the provided code snippet.',
--     opts = {
--       -- index = 12,
--       mapping = '<leader>mn',
--       modes = { 'v' },
--       slash_cmd = 'naming',
--       auto_submit = true,
--       user_prompt = false,
--       stop_context_insertion = true,
--       placement = 'replace',
--     },
--     prompts = {
--       {
--         role = 'user',
--         content = function(context)
--           local code = require('codecompanion.helpers.actions').get_code(context.start_line, context.end_line)
--
--           return 'Please provide better names for the following variables and functions:\n\n```' .. context.filetype .. '\n' .. code .. '\n```\n\n'
--         end,
--         opts = {
--           contains_code = true,
--         },
--       },
--     },
--   },
-- }
