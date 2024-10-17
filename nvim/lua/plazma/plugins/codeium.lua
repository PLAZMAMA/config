-- return {}

-----------------------------------------
-- Enables codeium if the need arises to.

return {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        -- require('codeium').setup({
        --     enable_chat = true,
        --     detect_proxy = true,
        -- })

        vim.g.codeium_disable_bindings = 1
        vim.keymap.set('i', '<C-a>', function() return vim.fn['codeium#Accept']() end, { expr = true })
        vim.keymap.set('i', '<M-l>', function() return vim.fn['codeium#CycleCompletions'](1) end,
            { expr = true, silent = true })
        vim.keymap.set('i', '<M-h>', function() return vim.fn['codeium#CycleCompletions'](-1) end,
            { expr = true, silent = true })
        vim.keymap.set('i', '<M-c>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
        vim.keymap.set('n', '<leader>ct', function() vim.g.codeium_enabled = not vim.g.codeium_enabled end,
            { expr = true, silent = true })

        local wk = require("which-key")
        wk.add({
            {
                mode = { 'n' },
                { '<leader>ct', desc = '[C]odeium) [T]oggle' },
            },
        })
    end,
}
