return {
    'TabbyML/vim-tabby',
    config = function()
        vim.g.tabby_keybinding_accept = '<C-a>'
        vim.g.tabby_keybinding_trigger_or_dismiss = '<C-m>'

        -- Document existing key chains
        local wk = require("which-key")
        wk.add({
            {
                mode = { 'n', 'i' },
                { '<C-m>', desc = '[M]atrix(Tabby) toggle' },
                { '<C-a>', desc = '[A]ccept suggestion' },
            }
        })
    end,
}
