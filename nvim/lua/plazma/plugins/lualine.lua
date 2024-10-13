return {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    version = '*',
    opts = {
        options = {
            icons_enabled = false,
            theme = 'auto',
            component_separators = '|',
            section_separators = '',
        },
    },
}
