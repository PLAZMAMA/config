return {
  'olimorris/codecompanion.nvim',
  version = '8.11.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'hrsh7th/nvim-cmp', -- Optional: For using slash commands and variables in the chat buffer
    'nvim-telescope/telescope.nvim', -- Optional: For using slash commands
    { 'stevearc/dressing.nvim', opts = {} }, -- Optional: Improves `vim.ui.select`
  },
  opts = {
    send_code = true,
    log_level = 'DEBUG',
  },
  config = function()
    vim.env.GLHF_API_KEY = os.getenv 'GLHF_API_KEY'
    require('codecompanion').setup {
      strategies = {
        chat = {
          adapter = 'glhf',
        },
        inline = {
          adapter = 'glhf',
        },
        agent = {
          adapter = 'glhf',
        },
      },
      adapters = {
        ollama = function()
          return require('codecompanion.adapters').extend('ollama', {
            schema = {
              model = {
                default = 'qwen2.5-coder',
              },
            },
            env = {
              -- url = 'http://192.168.1.30:8080',
              url = 'http://localhost:11434',
              api_key = 'OLLAMA_API_KEY',
            },
            headers = {
              ['Content-Type'] = 'application/json',
              ['Authorization'] = 'Bearer ${api_key}',
            },
            parameters = {
              sync = true,
            },
          })
        end,
      },
    }

    -- Set provider aka ollama
    -- vim.g.codecompanion_adapter = 'ollama'
    vim.g.codecompanion_adapter = 'glhf'

    -- Set keybinding
    vim.api.nvim_set_keymap('n', '<C-c>', '<cmd>CodeCompanionActions<cr>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('v', '<C-c>', '<cmd>CodeCompanionActions<cr>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>ct', '<cmd>CodeCompanionChat Toggle<cr>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('v', '<leader>ct', '<cmd>CodeCompanionChat Toggle<cr>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('v', '<leader>cn', '<cmd>CodeCompanion /naming<cr>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('v', '<leader>ce', '<cmd>CodeCompanion /explain<cr>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('v', '<leader>cc', '<cmd>CodeCompanion<cr>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>cc', '<cmd>CodeCompanion<cr>', { noremap = true, silent = true })

    -- Expand 'cc' into 'CodeCompanion' in the command line
    vim.cmd [[cab cc CodeCompanion]]
  end,
}

------------------------------------------------------------------------------
-- Doesn't work yet
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
-- },
--
-- glhf = function()
--   return require('codecompanion.adapters').extend('openai_compatible', {
--     env_replaced = {
--       url = 'https://glhf.chat/api/openai',
--       api_key = 'GLHF_API_KEY',
--     },
--   })
-- end,
------------------------------------------------------------------------------
